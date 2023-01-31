import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sales_order/Screens/basketPage.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Model/custormerorder.dart';
import 'order_listing.dart';
import 'quote_listing.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});


  @override
  State<Orders> createState() => _OrdersState();
}


// late final String? orderNumber;


class _OrdersState extends State<Orders> {

  // Future<List<Datum?>?> custormerListAPIResult =
  //     Future.value(List<Datum>.from([Datum()]));

  // @override
  // void initState() {
  //   custormerListAPIResult = callApi();
  //   super.initState();
  // }

  // Future<String?> getToken() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   token = prefs.getString('token');
  //   return null;
  // }

  // Future<List<Datum?>?> callApi() async {
  //   await getToken();
  //   final response = await http.get(
  //       Uri.parse(
  //           'https://powersoftrd.com/PEMApi/api/GetOrderByCustomer/741258?CustomerId=COMMPRINT 036'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Accept': 'application/json',
  //         'Authorization': 'Bearer $token',
  //       });
  //   print('Response status: ${response.statusCode}');
  //   print('Response body: ${response.body}');
  //   print('token : ${token}');
  //   print('orderNumber : $orderNumber');

  //   if (response.statusCode == 200) {
  //     final result = json.decode(response.body);
  //     // final itemModels = result["data"];
  //     var custormerOrder = CustormerOrder.fromJson(result);
  //     return custormerOrder.data;
  //     // return ItemModels.map((e) => ItemModelFromJson(e)).toList();

  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }

  // String? orderNumber = '';
  // String? token;

  // late final SharedPreferences _prefs;

  // getStringValues() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     orderNumber = (_prefs.getString('orderNumber') ?? "") ;
  //   });
  //   return;
  // }
 
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back, size: 25),
          ),
          title: const Center(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'Order Management',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
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
          bottom: const TabBar(tabs: [
            Tab(text: 'Orders'),
            Tab(text: 'Quotes'),
          ]),
        ),
        body: 
           const TabBarView(
            children: [
              Orderdetails(),
              Quotes(),
            ],
          ),
        ),
      
    );
  }
}
