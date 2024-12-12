// lib/second_page.dart
import 'package:flutter/material.dart';

import 'main.dart';

class SecondPage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'MaterialApp tt2',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Center(
          child: Text(
            'Welcome to the Second Page!'+toStr(globalCounter),
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );

  }

  String toStr(int globalCounter) {  return globalCounter.toString();}

}
