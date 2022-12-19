import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';

import '../Model/paystackdata.dart';
import 'package:http/http.dart' as http;     




Future<Payment?> getApiPostData() async {
  Payment? result;

  try {
    final response = await http.get(
        Uri.parse(
            'https://api.paystack.co/transaction/initialize/bsem57tx0bxv4df'),
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
          "Access-Contol-Allow-Origin": "*",
          "Access-Contol-Allow-Methods": "GET",
        });

    if (response.statusCode == 200) {
      final payment = json.decode(response.body);
      result = Payment?.fromJson(payment);
    } else {
      print('err');
     
    }
    
  } catch (err) {
    log(err.toString());
  }
  print(result);
  return result;
  
}
