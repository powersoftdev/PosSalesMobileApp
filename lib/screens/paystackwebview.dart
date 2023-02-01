import 'dart:convert';
import 'package:http/http.dart' as http;
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
 
  //  double amountToPay = 0;
  // final List<Payment> writersList = [];

  // String? authorizationUrl;
  // dynamic token;

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // @override
  // void initState() {
  //   super.initState();
  // }

  // void callApi() async {
  //   final SharedPreferences prefs = await _prefs;

  //   // final customerID = prefs.getString('CustomerID') ?? "";
  //   final customerEmail = prefs.getString('CustomerEmail') ?? "";
  //   // final currencyId = prefs.getString('CurrencyId') ?? "";
  //   // final premiumAmount = prefs.getDouble('premiumAmount') ?? "";
  //   token = prefs.getString('token');

  //   if (customerEmail != null && customerEmail != "")
  //   // if (customerEmail != null && customerEmail != "")
  //   {
  //     // dynamic data = {};
  //     var url = Uri.parse(
  //         'https://powersoftrd.com/PEMApi/api/PaymentInitialization/741258');

  //     var response = await http.post(url,
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer $token',
  //         },
  //         body: jsonEncode({
  //           "email": customerEmail,
  //           "amount": amountToPay,
  //         }));

  //     final Map<String, dynamic> responseData = json.decode(response.body);

  //     if (responseData == null) {
  //       showDialog(
  //           context: context,
  //           builder: (context) {
  //             return AlertDialog(
  //               content: Text(responseData['Message']),
  //             );
  //           });
  //     } else if (responseData != null && responseData['status'] == true) {
  //       final paystackIntialize = paymentFromJson(response.body);
  //       authorizationUrl = paystackIntialize.data!.authorizationUrl;

  //       setState(() {
  //         authorizationUrl = authorizationUrl == "" ? "" : authorizationUrl;
  //         Navigator.push(
  //             context,
  //             MaterialPageRoute(
  //                 builder: (context) =>
  //                     WebViewPayment(pageData: authorizationUrl)));
  //       });
  //       print(authorizationUrl);
  //       // setState(() {
  //       //   var initialUrl = authorizationUrl;
  //       // });
  //     }
  //   }
  // }

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
