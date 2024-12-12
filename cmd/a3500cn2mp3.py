



import json
import os

# lib fld..ttsv2.py....   txt fun
from lib.ttsv2 import text_to_speech


def existFile(filename):
    return os.path.exists(filename)# 示例使用


def fileSize(filename):
    """
      获取文件大小（以字节为单位）。
      如果文件不存在，则返回 None。
      """
    if os.path.exists(filename):
        return os.path.getsize(filename)
    else:
        return 0


def delFile(filename):
    """
    删除指定文件

    :param filename: 文件路径
    """
    try:
        os.remove(filename)
        print(f"File {filename} deleted successfully.")
    except OSError as e:
        print(f"Error: {e}")

# 示例使用
# delFile("example.txt")  # 替换为你的文件路径



def read_and_display_json_list(file_path):
    """
    读取 JSON 文件，文件内容是一个 JSON 列表，循环打印列表中的每个元素。

    :param file_path: JSON 文件的路径
    """
    try:
        # 打开 JSON 文件并解析内容
        with open(file_path, 'r', encoding='utf-8') as file:
            json_list = json.load(file)

        # 检查是否是一个列表
        if isinstance(json_list, list):
            for index, item in enumerate(json_list):
                print(f"Item {index + 1}: {item}")
                newfile=f"/tts3500cncharMp3/{item}.mp3"
                if   existFile(newfile):
                    if fileSize(newfile) == 0:
                        delFile(newfile)
                if not existFile(newfile):
                    text_to_speech(f"{item}",newfile)
                    if fileSize(newfile)==0:
                        delFile(newfile)

        else:
            print("Error: JSON 文件内容不是一个列表")
    except FileNotFoundError:
        print(f"Error: 文件未找到: {file_path}")
    except json.JSONDecodeError:
        print(f"Error: 解析 JSON 文件时出错")
    except Exception as e:
        print(f"Error: {e}")

# 测试函数
if __name__ == "__main__":
    # 假设 JSON 文件路径为 example.json

    # file_path = "example.json"
    fl="C:\\0prj\\goPrjApi\\3500cn chars.json"
    read_and_display_json_list(fl)
