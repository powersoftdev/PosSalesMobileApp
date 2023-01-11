// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';



// String reference = '79rt84dic2';

// class WebViewPayment extends StatelessWidget {
//   const WebViewPayment({super.key});

  
 
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WebView(
//         initialUrl: 'https://checkout.paystack.com/795itp7i1aphb6g',
//         javascriptMode: JavascriptMode.unrestricted,
//         userAgent: 'Flutter;Webview',
//         navigationDelegate: (NavigationRequest navigation) {
//           //Listen for callback URL
//           if (navigation.url == "https://google.com") {
//            // verifyTransaction(reference);
//             Navigator.of(context).pop(); //close webview
//           }
//           return NavigationDecision.navigate;
//         },
//       ),
//     );
//   }
// }
