import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import '../Model/payment.dart';

import 'package:http/http.dart' as http;

import 'quote_listing.dart';







//  String customerEmail = "";
// dynamic amount;

//  Future<String?> getToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     token = prefs.getString('token');
//      customerEmail = prefs.getString('customerEmail') ?? "";

//     return null;
//   }
// Future<dynamic> callApi() async {
//     await getToken();
//     final response = await http.post(
//         Uri.parse(
//             'https://powersoftrd.com/PEMApi/api/PaymentInitialization/741258?' ),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });
//         body:
//     jsonEncode({
//       "email": customerEmail,
//       "amount": amount,
//     });
//     print('Response status: ${response.statusCode}');
//     print('Response body: ${response.body}');
//     print('token : $token');

//     if (response.statusCode == 200) {
//       final result = json.decode(response.body);

//       var payment = Payment.fromJson(result);
//       return payment.data;
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

// Future<dynamic> makePayment() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     token = prefs.getString('token');
//     customerId = prefs.getString('customerId');

//     print('token : ${token}');
//     print(customerId);
//   }
//    void changePwdApi() async 
//     await getToken();

//     http.Response response = await http.post(
//           Uri.parse(
//             'https://powersoftrd.com/PEMApi/api/PaymentInitialization/741258?'),
//         headers: {
//           HttpHeaders.contentTypeHeader: 'application/json',
//           "Access-Contol-Allow-Origin": "*",
//           "Bearer: sk_test_78ba02aeb10444af8d6927c951f5eb9c774c1bf7"
//           "Access-Contol-Allow-Methods": "POST",
//        });
//     body:
//     jsonEncode({
//       "email": CustomerEmail,
//       "amount": "10000",
//       "currency": 'NGN',
//     });

//     print(response.body);
  // try {
  //   final response = await http.post(
  //       Uri.parse(
  //           'https://powersoftrd.com/PEMApi/api/PaymentInitialization/741258?'),
  //       headers: {
  //         HttpHeaders.contentTypeHeader: 'application/json',
  //         "Access-Contol-Allow-Origin": "*",
  //         "Bearer: sk_test_78ba02aeb10444af8d6927c951f5eb9c774c1bf7"
  //         "Access-Contol-Allow-Methods": "POST",
  // //       });
  //   body:
  //   jsonEncode({
  //     "email": CustomerEmail,
  //     "amount": "10000",
  //     "currency": 'NGN',
  //   });

  //   if (response.statusCode == 200) {
  //     final payment = json.decode(response.body);
  //     result = Payment.fromJson(payment);
  //   } else {
  //     print('err');
  //   }
  //  catch (err) {
  //   log(err.toString());
  // }
  // // print(result);
  // // return result;




// Future<String?> getToken() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     token = prefs.getString('token');
//     customerId = prefs.getString('customerId');

//     print('token : ${token}');
//     print(customerId);
//   }

//   void changePwdApi() async {
//     await getToken();

//     http.Response response = await http.post(
//         Uri.parse(
//             'https://powersoftrd.com/PEMAPI/api/ChangePasswordCustomer/741258?'),
//         body: jsonEncode(changePassword(
//             username: customerId,
//             oldPassword: currentPassword,
//             newPassword: password)),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//           'Authorization': 'Bearer $token',
//         });

//     print(response.body);
