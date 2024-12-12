import 'dart:typed_data';
import 'dart:io';
import 'dart:convert'; // 导入用于编码解码的库
import 'package:http/http.dart' as http; // 导入http库
import 'package:hex/hex.dart'; // 确保安装 hex 包
import 'package:mnemonic/mnemonic.dart'; // 确保安装 mnemonic 包
import 'dart:convert'; // 用于 utf8 编码
import 'package:crypto/crypto.dart'; // 确保安装 crypto 包
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'dart:io';
import 'dart:convert';
import 'second_page.dart'; // 导入新的页面
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';
Future<void> send(String message,String address,int port) async {
  // 创建一个 UDP 发送器
  RawDatagramSocket socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);

  // 设置广播地址和端口
  // var address = '255.255.255.255';
  //address="127.0.0.1";
  //if cant recv msg,,chg add to 127.0....
  var broadcastAddress = InternetAddress(address);

  //int port = 12345;

  var data = utf8.encode(message);

  // 发送广播
  // 打印调试信息
  var a = [broadcastAddress.address, port, message]; // 使用列表替代 object[]
  print("fun send(( ${jsonEncode(a)} )) ");

  socket.send(data, broadcastAddress, port);
  print('Broadcast message sent: $message');



  // 可选：等待一段时间以确保消息发送完成
  // await sleep2025(3);
  // 关闭 socket
  socket.close();
  // await sleep2025(3);
}
String getCurrentDateTime() {
  // 获取当前日期时间
  DateTime now = DateTime.now();
  // 使用 DateFormat 格式化日期时间
  String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
  return formattedDate;
}


WidgetsApp newRootCmpktWidgetsAppV2(Widget page ) {
  return WidgetsApp(
    builder: (context, child) {
      // 返回您的主页面  newPage
      return page;
    },
    color: const Color(0xFF42A5F5), // 应用的主题颜色
  );
}

WidgetsApp newRootCmpktWidgetsApp(Function pageFun ) {
  return WidgetsApp(
    builder: (context, child) {
      // 返回您的主页面  newPage
      return pageFun();
    },
    color: const Color(0xFF42A5F5), // 应用的主题颜色
  );
}
String toStr(int globalCounter) {  return globalCounter.toString();}
String md5Hash(String s) {
  // 将字符串转换为字节
  final bytes = utf8.encode(s);

  // 计算 MD5 哈希
  final digest = md5.convert(bytes);

  // 返回 MD5 哈希的十六进制字符串表示
  return digest.toString();
}
