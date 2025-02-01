# pip install pywin32
# C:\Progrm\Python313\Scripts\pip.exe install pywin32


import win32gui
import win32con
import time


def enum_window_proc(hwnd, top_windows):
    if win32gui.IsWindowVisible(hwnd) and win32gui.GetWindowText(hwnd) != "":
        top_windows.append((hwnd, win32gui.GetWindowText(hwnd)))


def get_notifications():
    top_windows = []
    win32gui.EnumWindows(enum_window_proc, top_windows)

    notifications = []
    for hwnd, window_text in top_windows:
        print(window_text)
        # lark
        if "通知" in window_text or "Toast" in window_text:
            # 这里假设通知窗口的标题包含“通知”或“Toast”
            notifications.append(window_text)


    return notifications


if __name__ == "__main__":
    while True:
        notifications = get_notifications()
        if notifications:
            for notification in notifications:
                print("检测到通知:", notification)
        time.sleep(1888)  # 每5秒检查一次
