
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/material.dart';

class Browser extends StatelessWidget {

   String url;
   String title;

  Browser({ required this.url, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
