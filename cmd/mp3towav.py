import os

from pydub import AudioSegment
# C:\Users\attil\AppData\Local\Programs\Python\Python313\Scripts\pip.exe  install   audioop
def convert_mp3_to_wav(mp3_path, wav_path):
    """
    将 MP3 文件转换为 WAV 文件

    :param mp3_path: 输入的 MP3 文件路径
    :param wav_path: 输出的 WAV 文件路径
    """
    # 加载 MP3 文件
    audio = AudioSegment.from_mp3(mp3_path)

    # 导出为 WAV 文件
    audio.export(wav_path, format="wav")

# 循环目录，打印子文件
def foreachDir(dir):
    for root, dirs, files in os.walk(dir):
        print("当前目录:", root)
        print("子目录:", dirs)
        print("文件:", files)

        print("-" * 40)
        convert_mp3_to_wav(files, files+".wav")


if __name__ == "__main__":
    dir="/tts3500cnchar"
    foreachDir(dir)
    mp3_path = "input.mp3"  # 输入的 MP3 文件路径
    wav_path = "output.wav"  # 输出的 WAV 文件路径
    convert_mp3_to_wav(mp3_path, wav_path)
    print("转换完成！")
