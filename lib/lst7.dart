import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('数据表格'),
        ),
        body: DataTableWidget(),
      ),
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final String jsonData = '''
  [
      {"date": "2024", "data": "1111"},
      {"date": "2025", "data": "2222"}
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    // 将 JSON 数据解析为对象
    List<dynamic> dataList = json.decode(jsonData);

    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(),
        children: [
          buildTableRowHead(),
          // 通过 map 方法将数据填充到表格中
          ...dataList.map((item) {
            return buildTableRowData(item);
          }).toList(),
        ],
      ),
    );
  }

  TableRow buildTableRowData(item) {
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


}
