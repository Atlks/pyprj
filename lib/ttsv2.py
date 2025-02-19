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

from pydub import AudioSegment

def convert_mp3_to_wav(mp3_path: str, wav_path: str, sample_rate: int = 44100):
    """将 MP3 转换为 WAV"""
    audio = AudioSegment.from_mp3(mp3_path)
    audio = audio.set_frame_rate(sample_rate)  # 设置采样率（可选）
    audio.export(wav_path, format="wav")
    print(f"✅ 转换完成: {wav_path}")
    
  

def convert_to_wav(input_file: str, ffmpeg_path: str = "ffmpeg") -> str:
    print(f"input_file= {input_file}")
    output_file = os.path.splitext(input_file)[0] + ".wav"
    
    cmd = [ffmpeg_path, "-i", input_file, output_file]
    print(f"{ffmpeg_path} {' '.join(cmd[1:])}")

    process = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True)

    if process.returncode == 0:
        print(f"🎵 ConvertToWav ok: {output_file}")
        return output_file
    else:
        print(f"❌ ConvertToWav fail: {input_file}\nError: {process.stderr}")
        return ""
# Example usage
print("run....")
audio_file="\"/tts3500cnchar/我.wav\""
# text_to_speech("普通消息","普通消息.wav")
#text_to_speech("普通消息普通消息","普通消息普通消息.wav")
#text_to_speech("网络连接警报网络连接警报网络连接警报","网络连接警报.mp3")
#text_to_speech("打卡定时器 打卡定时器 打卡定时器 打卡定时器 打卡定时器","打卡定时器.mp3")
#text_to_speech("吃饭咯吃饭咯","吃饭咯.mp3")
#text_to_speech("网络连接警报","网络连接警报.mp3")
#text_to_speech("tg消息","tg消息.mp3")
msg="普通消息" 
msg="滴滴滴紧急消息滴滴拉卡消息"
msg="滴滴紧急消息滴滴私聊TG消息"
msg="滴滴打卡滴滴打卡"
msg="普通消息拉卡消息" 
msg="午休结束" 
msg="普通消息微信消息" 
msg="滴滴滴紧急消息滴滴滴紧急消息"
msg="滴普通消息" 
msg="滴" 
msg="k" 
msg="滴滴紧急消息滴滴TG打卡消息"
msg="滴滴滴tg群滴滴tg群消息"
msg="滴滴tg打卡滴滴tg群打卡消息"
msg="滴滴tg私聊滴滴tg私聊消息"
msg="滴滴拉卡消息滴滴拉卡消息"
msg="滴滴我的消息滴滴我的消息"
msg="running"
MP3file = "c:/cfg/"+msg+".mp3"
text_to_speech(msg,MP3file)
#,MP3file+".wav"
convert_to_wav(MP3file)
#convert_mp3_to_wav("网络连接警报.mp3","网络连接警报.mp3.wav")
# cmd=f" start {audio_file}"
#os.system(cmd  )
# C:\Progrm\Python313\Scripts\pip3.exe 
# C:\Progrm\Python313\python.exe  c:\0prj\pyprj\lib\ttsv2.py
# C:\Progrm\Python313\Scripts\pip3.exe  install pyaudioop
#  C:\Progrm\Python313\python.exe  c:\0prj\pyprj\lib\ttsv2.py
# C:\Progrm\Python313\Scripts\pip3.exe install --force-reinstall pydub
# C:\Users\attil\AppData\Local\Programs\Python\Python312\python.exe  c:\0prj\pyprj\lib\ttsv2.py
# C:\Users\attil\AppData\Local\Programs\Python\Python312\Scripts\pip3.12.exe  install gtts
# C:\Progrm\Python312\Scripts\pip3.12.exe  install pydub
# ffmpeg  -i  网络连接警报.mp3  网络连接警报.mp3.wav
#  C:\Users\attil\AppData\Local\Programs\Python\Python312\python.exe  c:\0prj\pyprj\lib\ttsv2.py