from gtts import gTTS
import os
from pathlib import Path
import subprocess

# gTTS（Google Text-to-Speech）库来将文本转换为语音，默认输出格式是MP3。
# C:\Users\attil\AppData\Local\Programs\Python\Python313\Scripts\pip.exe  install gtts
# // pip install gtts
# C:\Users\attil\AppData\Local\Programs\Python\Python313\Scripts\pip.exe  install pydub
"""
  将文本转换为语音，并保存为音频文件。
  :param text: 要转换的文本
  :param audio_file: 保存的音频文件路径
  :param lang: 语言代码，默认中文 'zh'
"""
def text_to_speech(text,audio_file, lang='zh'):
    try:
        # Read the text from the file


        if not text:
            raise ValueError("The file is empty or couldn't be read.")


        # 确保目录存在
        audio_path = Path(audio_file)
        audio_path.parent.mkdir(parents=True, exist_ok=True)



        # 将文本转换为语音  默认输出格式：MP3 文件。
        tts = gTTS(text=text, lang=lang)
        tts.save(str(audio_path))


        # Play the audio file

        print(f"Text-to-speech conversion completed. Audio saved as {audio_file}.")
        return  audio_file
    except Exception as e:
        print(f"An error occurred: {e}")


# Example usage
audio_file="\"/tts3500cnchar/我.wav\""
text_to_speech("我","/tts3500cnchar/我.wav")
cmd=f" start {audio_file}"
os.system(cmd  )

