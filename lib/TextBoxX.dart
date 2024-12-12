
// textboxx.dart


import 'package:flutter/material.dart';

class TextBoxX extends StatefulWidget {

  late TextBoxXState txtboxStat1;

  TextBoxX({Key? key}) : super(key: key);


  @override
  TextBoxXState createState() {
   txtboxStat1=TextBoxXState();
   // return txtboxStat1;

    return TextBoxXState();

  }
}

class TextBoxXState extends State<TextBoxX> {
  // 定义文本控制器
    TextEditingController _textController = TextEditingController();


    void setText(String newText) {
      setState(() {
        _textController.text = newText;
      });
    }

  @override
  Widget build(BuildContext context) {
    return newTextField();
  }

  TextField newTextField() {
     return   TextField(
        controller: _textController,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'Enter text here',
        ));
  }
}
