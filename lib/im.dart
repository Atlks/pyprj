import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'util.dart';
//import '../im/';
//import '../im/';
//  flutter run -d windows
//  flutter build apk --debug
//  adb install C:\0prj\paymentJava2024\build\app\outputs\apk\debug\app-debug.apk
//要更新已经安装的应用，请使用 -r 参数：
//adb install -r C:\0prj\paymentJava2024\build\app\outputs\apk\debug\app-debug.apk

class ImApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UDP Listener v2',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: UdpListenerPage(),
    );
  }
}

class UdpListenerPage extends StatefulWidget {
  @override
  _UdpListenerPageState createState() => _UdpListenerPageState();
}

class _UdpListenerPageState extends State<UdpListenerPage> {
  List<String> _messages = [];
  RawDatagramSocket? _socket;

  @override
  void initState() {
    super.initState();
    _startListening();
  }

  void _startListening() async {
    // 在 5555 端口上绑定 UDP 套接字
    _socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 18888);
    print('Listening for UDP messages on port 88888...');

    _socket!.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        Datagram? datagram = _socket!.receive();
        if (datagram != null) {
          String message = utf8.decode(datagram.data);
          print(
              'Received message: $message from ${datagram.address.address}:${datagram.port}');
          _addMessage(message);
        }
      }
    });
  }

  void _addMessage(String message) {
    setState(() {
      //   List<String> _messages = [];
      _messages.add(message); // 添加新消息到顶部
    });
  }

  @override
  void dispose() {
    _socket?.close(); // 关闭套接字
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var verx = 'UDP Listener v6';
    return Scaffold(
        appBar: AppBar(title: Text(verx)),
        body: Column(children: [
          Expanded(
            //其他组件可使用固定的高度
            // 使用 Expanded 来占用剩余空间.让 ListView 占用剩余空间
            child: buildListView(),
          ),

          SizedBox(height: 20), // 添加间隔，20 像素的高度
          newTextbox(),

          newElevatedButton(),
          SizedBox(height: 20), // 添加间隔，20 像素的高度
        ]));
  }


  Container buildListView() {
    return Container(
      color: Colors.lightBlueAccent, // 设置淡蓝色背景
      child: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(_messages[index]),
          );
        },
      ),
    );
  }


  ElevatedButton newElevatedButton() {
    return ElevatedButton(
      onPressed: () {
        // 按钮点击事件
        // runApp(SecondPage());
        // runApp(SecondPage());
        _addMessage(_controllerTextField.text);
        var port = 18888;
        String   address = "127.0.0.1";
      //  address="255.255.255.255";
        address="192.168.100.255";

        sendMsg(_controllerTextField.text,address,port);
        sendMsg(_controllerTextField.text,"255.255.255.255",port);

//mlt boad
        for(int i=1;i<=255;i++){
          for(int pt=28888;pt<=28888;pt++) {
          //  sendMsg(_controllerTextField.text, "255.255.255.255", i);
            sendMsg(_controllerTextField.text, "192.168.100."+i.toString(), pt);
          }
          sendMsg(_controllerTextField.text, "192.168.100."+i.toString(), port);

        }

        _controllerTextField.text="";

      },
      child: Text('send发送'),
    );
  }
  TextEditingController _controllerTextField = TextEditingController();


  newTextbox() {

    return TextField(
      controller: _controllerTextField,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: '输入消息',
      ),
    );
  }

  Future<void> sendMsg(String text,String address, int port) async {

    await   send(text,address,port);
    // try {
    //
    //   // 创建一个 UDP 套接字
    //   RawDatagramSocket socket = await RawDatagramSocket.bind(InternetAddress.anyIPv4, 0);
    //
    //   // 将消息转换为字节
    //   List<int> data = text.codeUnits;
    //
    //   // 发送消息到指定的地址和端口
    //   socket.send(data, InternetAddress(address), port);
    //
    //   print('Message sent: $text to $address:$port');
    //
    //   // 关闭套接字
    //   socket.close();
    // } catch (e) {
    //   print('Error sending message: $e');
    // }

  }
}
