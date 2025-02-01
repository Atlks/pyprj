import ctypes
from ctypes import wintypes
import time

# 定义必要的Windows API结构和常量
user32 = ctypes.WinDLL('user32', use_last_error=True)

WM_CLIPBOARDUPDATE = 0x031D

# 定义WNDCLASS结构体
class WNDCLASS(ctypes.Structure):
    _fields_ = [
        ("style", wintypes.UINT),
        ("lpfnWndProc", ctypes.WINFUNCTYPE(wintypes.LRESULT, wintypes.HWND, wintypes.UINT, wintypes.WPARAM, wintypes.LPARAM)),
        ("cbClsExtra", wintypes.INT),
        ("cbWndExtra", wintypes.INT),
        ("hInstance", wintypes.HINSTANCE),
        ("hIcon", wintypes.HICON),
        ("hCursor", wintypes.HCURSOR),
        ("hbrBackground", wintypes.HBRUSH),
        ("lpszMenuName", wintypes.LPCWSTR),
        ("lpszClassName", wintypes.LPCWSTR),
    ]

# 定义一个窗口类
class WindowsToastListener:
    def __init__(self):
        self.hwnd = None
        self.hinst = ctypes.windll.kernel32.GetModuleHandleW(None)
        self.wndclass = WNDCLASS()

    def register_window(self):
        self.wndclass.lpfnWndProc = self.wndproc
        self.wndclass.lpszClassName = 'ToastNotificationListener'
        self.wndclass.hInstance = self.hinst
        user32.RegisterClassW(ctypes.byref(self.wndclass))
        style = 0
        self.hwnd = user32.CreateWindowExW(0, self.wndclass.lpszClassName, None, style, 0, 0, 0, 0, 0, None, self.hinst, None)
        user32.AddClipboardFormatListener(self.hwnd)

    def unregister_window(self):
        if self.hwnd:
            user32.RemoveClipboardFormatListener(self.hwnd)
            user32.DestroyWindow(self.hwnd)
            user32.UnregisterClassW(self.wndclass.lpszClassName, self.hinst)
            self.hwnd = None

    def wndproc(self, hwnd, msg, wparam, lparam):
        if msg == WM_CLIPBOARDUPDATE:
            print("Clipboard update detected - Toast notification might have been shown.")
        return user32.DefWindowProcW(hwnd, msg, wparam, lparam)

def main():
    listener = WindowsToastListener()
    listener.register_window()
    try:
        # 主循环
        while True:
            time.sleep(1)
    finally:
        listener.unregister_window()

if __name__ == "__main__":
    main()
