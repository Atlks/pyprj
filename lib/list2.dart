// lib/list.dart
// ignore_for_file: unused_import

import 'dart:convert';
import 'second_page.dart'; // 导入新的页面
import 'package:flutter/material.dart';

//---------------获取数据
List<dynamic> getData() {
  // _users = json.decode(responsebody);
  var s = '''
[
    {"date": "2024", "data": "1111"},
    {"date": "2025", "data": "2222"}
]
    ''';

  List<dynamic> dataList = json.decode(s);
  return dataList;
}

//---------画主界面
class MyList2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MaterialApp tit2',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Scaffold appbar ttle2'),
            ),
            body: Column(
              children: [
                Table(
                  border: TableBorder.all(),
                  children: [
                    buildTableRowHead(),
                    // 通过 map 方法将数据填充到表格中
                    ...getData().map((item) {
                      return newTableRowWzData(item);
                    }).toList(),
                  ],
                )
              ],
            )));
  }
}

TableRow buildTableRowHead() {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('日期', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('数据', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
    ],
  );
}

//------------绑定data到表格
TableRow newTableRowWzData(item) {
  return TableRow(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(item['date']),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(item['data']),
      ),
    ],
  );
}
