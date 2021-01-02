import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewExample extends StatefulWidget {
  String price;
  WebViewExample(this.price);
  @override
  WebViewExampleState createState() => WebViewExampleState(this.price);
}

class WebViewExampleState extends State<WebViewExample> {
  String price;
  WebViewExampleState(this.price);
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        debuggingEnabled: true,
        initialUrl: 'http://10.0.2.2:8000/getCheckOutId/'+this.price,
      ),
    );
  }
}
