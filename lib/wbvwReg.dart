
 import 'package:flutter_web_plugins/flutter_web_plugins.dart';
//import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void regWbvw()
{
  //For Flutter Web, register the WebView factory
  if (WebView.platform == SurfaceAndroidWebView()) {
    setUrlStrategy(PathUrlStrategy()); // Optional: to enable Path URL strategy in web
  }

// Register the WebView platform view for Flutter Web
  registerWebView();
}



void registerWebView() {
  // This function registers the WebView platform view for the Web platform
  WebView.platform = SurfaceAndroidWebView();  // Required on Android (if needed)
  // Register the WebView factory (required for Web platform)
  setWebViewFactory();
}

void setWebViewFactory() {
  // Register the WebView platform view in web
  final factory = PlatformViewRegistry();
  factory.registerViewFactory(
    'plugins.flutter.io/webview',
        (int viewId) {
      return WebViewWidget(
        key: Key('webview_$viewId'),
      );
    },
  );
}
