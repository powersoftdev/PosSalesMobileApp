import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Model/payment.dart';
import 'quote_listing.dart';



class WebViewPayment extends StatefulWidget {
  
  const WebViewPayment({super.key, String? pageData});

  @override
  State<WebViewPayment> createState() => _WebViewPaymentState();
}
String? reference;


class _WebViewPaymentState extends State<WebViewPayment> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://checkout.paystack.com/$reference',
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
        navigationDelegate: (NavigationRequest navigation) {
          //Listen for callback URL
          if (navigation.url == "https://google.com") {
            // verifyTransaction(reference);
            Navigator.of(context).pop(); //close webview
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
