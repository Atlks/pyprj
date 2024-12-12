// ignore_for_file: unused_import

import 'dart:typed_data';
import 'dart:io';
import 'dart:convert'; // 导入用于编码解码的库
import 'package:http/http.dart' as http; // 导入http库
import 'package:hex/hex.dart'; // 确保安装 hex 包
import 'package:mnemonic/mnemonic.dart'; // 确保安装 mnemonic 包
import 'dart:convert'; // 用于 utf8 编码
import 'package:crypto/crypto.dart'; // 确保安装 crypto 包
import 'dart:async';

import 'package:path/path.dart';
import 'package:your_project_name/util.dart';

//--- flt wb
//  C:\flutter\bin\flutter.bat devices
// C:\flutter\bin\flutter.bat config --enable-web
//   C:\flutter\bin\flutter.bat run -d chrome
// 主函数
Future<void> main() async {
  print('Hello, World!');

  // 计算 MD5 哈希
  print(md5Hash("8888"));

  // 写入文件
  writeFile("dartStore.txt", "123");

  // 示例URL
  final url = 'https://jsonplaceholder.typicode.com/posts/1';
  await sendHttpGet(url);
}





void writeFile(String fileName, String txt ) {
  // 创建一个文件名，例如 "output.txt"
  //final fileName = 'output.txt';

  // 创建文件对象
  final file = File(fileName);

  // 写入字符串和整数到文件
  file.writeAsStringSync('$txt', mode: FileMode.append);

  print('写入成功: $fileName , $txt');
}

Future<void> sendHttpGet(String url) async {
  print("fun get("+url);
  try {
    // 发送 GET 请求
    final response = await http.get(Uri.parse(url));

    // 检查响应状态
    if (response.statusCode == 200) {
      // 如果服务器返回 200 OK，解析响应
      final data = jsonDecode(response.body);
      print('响应数据: $data');
    } else {
      // 处理错误情况
      print('请求失败，状态码: ${response.statusCode}');
    }
  } catch (e) {
    // 处理异常
    print('发生错误: $e');
  }
  print("endfun get()");
}

// String md5Hash(String s) {
//   // 将字符串转换为字节
//   final bytes = utf8.encode(s);
//
//   // 计算 MD5 哈希
//   final digest = md5.convert(bytes);
//
//   // 返回 MD5 哈希的十六进制字符串表示
//   return digest.toString();
// }



// String generateMnemonic(String hexPrivateKey) {
//   // 将十六进制密钥转换为字节数组
//   Uint8List privateKeyBytes = Uint8List.fromList(HEX.decode(hexPrivateKey));
//
//   // 使用前 16 字节作为熵（128 位熵）
//   Uint8List entropy = Uint8List.fromList(privateKeyBytes.sublist(0, 16));
//
//   // 生成助记词
//   List<String> mnemonic;
//   try {
//    // mnemonic = MnemonicCode().toMnemonic(entropy);
//   } catch (e) {
//     throw Exception('生成助记词时出错: $e');
//   }
//
//   return mnemonic.join(" ");
// }
