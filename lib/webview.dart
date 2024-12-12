import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// void main() {
//   runApp(MyApp());
// }

class MyAppWbvw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WebViewExample(),
    );
  }
}

class WebViewExample extends StatefulWidget {
  @override
  _WebViewExampleState createState() => _WebViewExampleState();
}

class _WebViewExampleState extends State<WebViewExample> {
  late WebViewController _webViewController;

  @override
  void initState() {
    super.initState();
    // 初始化 WebView 插件
    WebView.platform = SurfaceAndroidWebView();  // 支持安卓
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WebView Example")),
      body: WebView(
        initialUrl: 'https://www.google.com/', // 加载网页地址
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
        },
        javascriptMode: JavascriptMode.unrestricted,  // 允许使用 JavaScript
      ),
    );
  }
}
