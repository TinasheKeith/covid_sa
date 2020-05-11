import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class AppWebView extends StatelessWidget {
  final String url;

  /*
    Note: using key to identify close btn in test instead of find.byIcon()
    because Icon may change in future.
  */

  static const closeWebViewKey = Key("closeWebView");

  AppWebView({@required this.url})
      : assert(url != null, "website url cannot be left null");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          key: closeWebViewKey,
          icon: const Icon(Icons.close),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: WebView(
        initialUrl: url,
      ),
    );
  }
}
