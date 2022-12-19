import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';



String reference = 'npnks9fvzs';

class WebViewPayment extends StatelessWidget {
  const WebViewPayment({super.key});

  
  verifyTransaction(String reference) {
    if (reference == 'npnks9fvzs') {
      
    }
    return reference;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: 'https://checkout.paystack.com/bsem57tx0bxv4df',
        javascriptMode: JavascriptMode.unrestricted,
        userAgent: 'Flutter;Webview',
        navigationDelegate: (NavigationRequest navigation) {
          //Listen for callback URL
          if (navigation.url == "https://google.com") {
            verifyTransaction(reference);
            Navigator.of(context).pop(); //close webview
          }
          return NavigationDecision.navigate;
        },
      ),
    );
  }
}
