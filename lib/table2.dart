//flutter run -d chrome
import 'dart:convert';

import 'second_page.dart'; // 导入新的页面
import 'package:flutter/material.dart';

late DataTableWidgetState2 dtCtrlr2;
class DataTableWidget2 extends StatefulWidget {
  //createState fun ,return a  _DataTablePageState
  @override
  DataTableWidgetState2 createState(){

    dtCtrlr2=DataTableWidgetState2();
    return dtCtrlr2;
  }

}


class DataTableWidgetState2 extends State {
  List<dynamic> listData = [];
  bool _isLoading = false;



  @override
  Widget build(BuildContext context) {
    return newTable();
  }

  Table newTable( ) {
    // var list1 =await getData();
//  List<dynamic> dataRows = [];
    // 通过 map 方法将数据填充到表格中
    List<TableRow> listDataRows = listData.map((item) {
      return newTableRowWzData(item);
    }).toList();
    return Table(
      border: TableBorder.all(),
      children: [
        buildTableRowHead(),
        ...listDataRows,
      ],
    );
  }



  TableRow buildTableRowHead() {
    return TableRow(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('日期2', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('数据2', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

// 绑定data到表格
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


}

