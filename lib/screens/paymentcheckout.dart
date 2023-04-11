// // import 'dart:convert';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/payment.dart';

// Declaring variables 'name' and 'qty'
String? name;
int? qty;
String customerEmail = "";
double accountBalance = 0;
double amount = 0;
String? token;


 
// // // Defining a function that creates a Data data as a future
Future<Data> createData(dynamic amount,Map<String, dynamic> basket) async {
 
  // Making an HTTP POST request to the specified URL
  SharedPreferences prefs = await SharedPreferences.getInstance();
  customerEmail = prefs.getString('customerEmail') ?? "";
  // token = prefs.getString('auth_token');
 

  final response = await http.post(
    Uri.parse(
        // ignore: prefer_interpolation_to_compose_strings
        'https://powersoftrd.com/PEMApi/api/PaymentInitialization/741258?email=$customerEmail&amount=$amount'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      
    },
    body: jsonEncode(basket));

  // Checking the response status code
  if (response.statusCode == 200) {
    // Printing the response status code and body
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    // Decoding the JSON response
    final result = json.decode(response.body);

    // Creating a Data object from the JSON result
    var result2 = Payment.fromJson(result);
    // if (result2.data != null) {
    var paystack = result2.data ??
        Data(accessCode: null, authorizationUrl: null, reference: null);
    print('accessCode: ${result2.data!.accessCode}');
    print('authorizationUrl: ${result2.data!.authorizationUrl}');
    print('referene: ${result2.data!.reference}');
  
    // }

    return paystack;
  } else {
    // Throwing an exception if the request was not successful
    throw Exception('Failed to create data for Data.');
  }
}
