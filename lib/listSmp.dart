// lib/listsmp.dart

//flutter run -d chrome
import 'dart:convert';
import 'second_page.dart'; // 导入新的页面
import 'package:flutter/material.dart';
import 'table2.dart'; // 导入新的页面


//listsmp.dart
//-------------------画主界面
//构建根app组件，必须的
WidgetsApp ListSmpPageWidgetsApp(  ) {
 // var column = ;
  return WidgetsApp(
    builder: (context, child) {
      // 返回您的主页面  newPage
      return newPageListSmpPage( );
    },
    color: const Color(0xFF42A5F5), // 应用的主题颜色
  );
}

//绘制page doc
Column newPageListSmpPage( ) {
  return Column(children: [
    DataTableWidget( ),
    SizedBox(height: 20), // 添加间隔，20 像素的高度

    DataTableWidget2( ),
    newElevatedButton(),
    newElevatedButton2(),
  ]);
}
//------------start table
 late _DataTableWidgetState dtCtrlr;


class DataTableWidget extends StatefulWidget {
  //createState fun ,return a  _DataTablePageState
  @override
  _DataTableWidgetState createState(){

    dtCtrlr=_DataTableWidgetState();
    return dtCtrlr;
  }

}


class _DataTableWidgetState extends State<DataTableWidget> {
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
          child: Text('日期', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('数据', style: TextStyle(fontWeight: FontWeight.bold)),
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


///------------end table
///
//------------ table2


///
///

ElevatedButton newElevatedButton() {
  return ElevatedButton(
    onPressed: () async {
      // 按钮点击事件
      btnClick();
     /// List<dynamic> list1 = await getData();
    //  runApp(SecondPage());
    //  runApp(ListSmpPageWidgetsApp(list1));
    },
    child: Text('goto form'),
  );
}

Future<void> btnClick() async {
  List<dynamic> lst= await getData();

  dtCtrlr.setState(() {
    dtCtrlr. listData =lst;
    dtCtrlr. _isLoading = false;
  });
}

//-------------end btn


ElevatedButton newElevatedButton2() {
  return ElevatedButton(
    onPressed: () async {
      // 按钮点击事件
      btnClick22();
      /// List<dynamic> list1 = await getData();
      //  runApp(SecondPage());
      //  runApp(ListSmpPageWidgetsApp(list1));
    },
    child: Text('btn222'),
  );
}
Future<void> btnClick22() async {
  List<dynamic> lst= await getData22();

  dtCtrlr2.setState(() {
    dtCtrlr2. listData =lst;
   // dtCtrlr. _isLoading = false;
  });
}

Future<List> getData22() async {
  // _users = json.decode(responsebody);
  var s = '''
[
    {"date": "2030", "data": "2030"},
    {"date": "2031", "data": "203120312031"}
]
    ''';

  List<dynamic> dataList = json.decode(s);
  await sleep2024(2);

  return dataList;
}

//---------------获取数据
Future<List> getData() async {
  // _users = json.decode(responsebody);
  var s = '''
[
    {"date": "2024", "data": "1111"},
    {"date": "2025", "data": "2222"}
]
    ''';

  List<dynamic> dataList = json.decode(s);
  await sleep2024(2);

  return dataList;
}

Future<void> sleep2024(int sec) async {
  await Future.delayed(Duration(seconds: sec));
}