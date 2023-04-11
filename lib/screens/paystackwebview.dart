import 'package:flutter/material.dart';
import 'package:sales_order/screens/checkout.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../Model/payment.dart';
import 'basketPage.dart';

class WebViewPayment extends StatefulWidget {
  final Data data;
  const WebViewPayment({super.key, required this.data});
  @override
  State<WebViewPayment> createState() => _WebViewPaymentState();
}

class _WebViewPaymentState extends State<WebViewPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Powersoft Payment')),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BasketPage()),
              );
            },
            iconSize: 40,
          ),
         
        ],
      ), 
      body: WebView(
        initialUrl: widget.data.authorizationUrl,
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
        navigationDelegate: (navigation) {
          if (navigation.url ==
              'https://checkout.paystack.com/${widget.data.reference}') {
             Navigator.pop(
                context,
                MaterialPageRoute(builder: (context) => const Checkout()),
              ); //close webview
          }
          if (navigation.url == 'https://standard.paystack.co/close') {
            //  Navigator.of(context).pop(); //close webview
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
