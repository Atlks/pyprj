// lib/list.dart
import 'dart:convert';
import 'second_page.dart'; // 导入新的页面
import 'package:flutter/material.dart';

class MyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MaterialApp tit',
      home: UserListPage(),
    );
  }
}

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<dynamic> _users = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  Future<void> fetchUsers() async {
    // final response = await http.get(Uri.parse('https://example.com/users')); // 替换为你的 AJAX URL

    // if (response.statusCode == 200) {

    String responsebody = '''
 [{
      "name": "nm222",
      "age": 3022
    },
    {
      "name": "Alicexxx",
      "age": 301
    }]
      ''';
    if (5 > 0) {
      setState(() {
        _users = json.decode(responsebody); // 直接解析 JSON
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load users');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Scaffold appbar ttle'),
        ),
        body: Column(
          children: [
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : buildListView(),
            buildElevatedButton(),
          ],
        ));
  }

  ElevatedButton buildElevatedButton() {
    return ElevatedButton(
            onPressed: () {
              // 按钮点击事件
              runApp(SecondPage());
            },
            child: Text('goto form'),
          );
  }

  ListView buildListView() {
    return ListView.builder(
                  shrinkWrap: true, // 让 ListView 根据内容自动调整高度
                  physics: NeverScrollableScrollPhysics(), // 禁用滚动
                  itemCount: _users.length,
                  itemBuilder: (context, index) {
                    // 直接使用解析后的 JSON 数据
                    return ListTile(
                      title: Text(_users[index]['name']), // 直接访问字段
                      subtitle: Text('Age: ${_users[index]['age']}'),
                    );
                  },
                );
  } //endbuild
}
