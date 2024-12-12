// ignore_for_file: unused_import

import 'dart:typed_data';
import 'package:hex/hex.dart';
import 'package:mnemonic/mnemonic.dart';
import 'dart:typed_data';
import 'package:hex/hex.dart';
import 'package:bip39/bip39.dart' as bip39;
import 'package:your_project_name/exmpl.dart';
import 'package:your_project_name/util.dart';

String generateMnemonic(String hexPrivateKey) {
  // 将十六进制密钥转换为字节数组
  List<int> privateKeyBytes = HEX.decode(hexPrivateKey);

  // 使用前 16 字节作为熵（128 位熵）
  List<int> entropyBytes = privateKeyBytes.sublist(0, 16);

  // 将字节数组转换为十六进制字符串
  String entropyHex = HEX.encode(entropyBytes);

  // 生成助记词
  String mnemonic = bip39.entropyToMnemonic(entropyHex);
  return mnemonic;

}

void main() {
  String hexPrivateKey = md5Hash("888") ; // 替换为您的十六进制私钥
  String mnemonic = generateMnemonic(hexPrivateKey);
  print('Generated Mnemonic: $mnemonic');
}
