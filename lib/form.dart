//import 'dart:html' as html;
import 'dart:convert';
import 'package:flutter/material.dart';

class MyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web Form',
      home: Scaffold(
        appBar: AppBar(
          title: Text('User Form'),
        ),
        body: UserForm(),
      ),
    );
  }
}

/**
 *  all control
 */
class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _submitForm() {
    String name = _nameController.text;
    String age = _ageController.text;

    if (name.isNotEmpty && age.isNotEmpty) {
      // 创建用户数据
      Map<String, dynamic> userData = {
        'name': name,
        'age': age,
      };

      // 转换为 JSON
      String jsonString = json.encode(userData);


      //使用http提交请求
      _showAlertDialog(context1);

      // 清空输入框
      _nameController.clear();
      _ageController.clear();
    }
  }


  // 弹出 alert 弹窗
  void _showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('警告'),
          content: Text('这是一个警告消息！'),
          actions: [
            TextButton(
              child: Text('确认'),
              onPressed: () {
                Navigator.of(context).pop();  // 关闭弹窗
              },
            ),
          ],
        );
      },
    );
  }
late  BuildContext context1;
  @override
  Widget build(BuildContext context) {
    context1=context;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Name'),
          ),
          TextField(
            controller: _ageController,
            decoration: InputDecoration(labelText: 'Age'),
            keyboardType: TextInputType.number,
          ),
          SizedBox(height: 20),
          buildElevatedButton(),
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
          onPressed: _submitForm,
          child: Text('Submit'),
        );
  }
}
