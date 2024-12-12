//  lib/main.dart
// ignore_for_file: duplicate_import
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
//import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:your_project_name/list.dart';
import 'package:your_project_name/textboxExmpl.dart';
import 'package:your_project_name/util.dart';
import 'second_page.dart'; // 导入新的页面
import 'form.dart'; // 导入新的页面
import 'list.dart'; // 导入新的页面
import 'list2.dart'; // 导入新的页面
import 'listSmp.dart'; // 导入新的页面
import 'im.dart'; // 导入新的页面
//import 'wbvwReg.dart'; // 导入新的页面
import 'webview.dart'; // 导入新的页面
// 定义一个全局静态变量
int globalCounter = 88;

//main.dart
Future<void> main() async {
  //  C:\flutter\bin\flutter.bat run -d chrome

//  flutter  run -d chrome -t  lib/main.dart
 //

 // runApp(MyApp());
//  runApp(SecondPage());

   //runApp(MyForm());
runApp(MyAppWbvw());
//regWbvw();  only for web prj
 // runApp(MyList2());
 // List<dynamic> dataRows = [];
 // runApp(ListSmpPageWidgetsApp());
 // runApp(textboxExample());
 // Widget page = (await newPageListSmpPage()) ;
 // runApp(newRootCmpktWidgetsAppV2(page));
//  runApp( ImApp());


}



/**
 * home: 应用启动时显示的第一个页面（Widget）。
 */
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(title: Text('app title11')),
        body: Center(child: Text('Hello, Flutter Web!')),
      ),
    );
  }
}
