
grpid=-1002209160657  //ntfy mir coll grp
const TelegramBot = require('node-telegram-bot-api');

// 你的 Telegram 机器人 Token
const token =  "8121736741:AAGKUS35nyeTodd7JXIb8u-sNQPN2sh6olw"

console.log("111    ")

// 创建 bot 实例，设置 polling 监听模式
const bot = new TelegramBot(token, { polling: true });

console.log("Bot 正在监听消息...");

// 监听所有群组和私聊的消息
bot.on('message', (msg) => {
    console.log(`收到消息: ${msg.text}`);
    console.log(`来自: ${msg.chat.title || msg.chat.username} (ID: ${msg.chat.id})`);
});
