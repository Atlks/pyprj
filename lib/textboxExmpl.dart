import 'package:flutter/material.dart';
import 'TextBoxX.dart'; // 导入新的页面

//textboxExmpl.dart

 late TextBoxX textBox1;
// 定义一个 GlobalKey，用于访问 TextBoxX 的状态
final GlobalKey<TextBoxXState> textBoxKey = GlobalKey<TextBoxXState>();

//must   MaterialApp when use textbox
MaterialApp textboxExample() {
    textBox1 = TextBoxX();
  return MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 文本框
            textBox1,
            SizedBox(height: 20),
            // 按钮
            newElevatedButton(),
          ],
        ),
      ),
    ),
  );
}

// TextField newTextField() {
//   return TextField(
//       // controller: _textController,
//       decoration: InputDecoration(
//     border: OutlineInputBorder(),
//     labelText: 'Enter text here',
//   ));
// }

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
  // List<dynamic> lst= await getData();
  textBoxKey?.currentState?.setText("newText");
  textBox1.txtboxStat1.setText("settttttt");
  // dtCtrlr.setState(() {
  //   dtCtrlr. listData =lst;
  //   dtCtrlr. _isLoading = false;
  // });
}
