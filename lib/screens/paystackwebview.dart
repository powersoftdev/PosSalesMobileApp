import 'package:flutter/material.dart';
import 'package:sales_order/screens/login_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Model/payment.dart';

class WebViewPayment extends StatefulWidget {
  final Data? data;
  const WebViewPayment({super.key, required this.data});
  @override
  State<WebViewPayment> createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: widget.data!.authorizationUrl,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
        navigationDelegate: (navigation) {
          if (navigation.url == navigation.url) {
            Navigator.pop(context); //close webview
          }
          if (navigation.url == '') {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginScreen(),
              ),
            ); //close webview
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
