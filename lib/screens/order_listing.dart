import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:sales_order/screens/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Model/custormerorder.dart';
import 'orderDetails.dart';

class Orderdetails extends StatefulWidget {
  const Orderdetails({super.key});

  @override
  State<Orderdetails> createState() => _OrderdetailsState();
}

class _OrderdetailsState extends State<Orderdetails> {
  Future<List<Datum>?> custormerListAPIResult =
      Future.value(List<Datum>.from([Datum()]));

  @override
  void initState() {
    custormerListAPIResult = callApi();
    super.initState();
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return null;
  }

  Future<List<Datum>?> callApi() async {
    await getToken();
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMApi/api/GetOrderByCustomerId/741258?CustomerId=COMMPRINT 036'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
    }
    print('Response body: ${response.body}');
    print('token : $token');

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      var custormerOrder = CustormerOrder.fromJson(result);
      return custormerOrder.data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String? orderNumber;
  String? orderTypeId;
  String? status;
  String? customerId;
  String? paymentMethodId;
  double? subtotal;
  int? taxAmount;
  dynamic total;
  int? orderQty;
  dynamic orderDate;
  String? token;

  late final SharedPreferences _prefs;

  getStringValues() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      orderNumber = (_prefs.getString('orderNumber') ?? "");
      total = (_prefs.getInt('total') ?? 0);
      orderQty = (_prefs.getInt('orderQty') ?? 0);
      orderDate = (_prefs.getString('orderdate') ?? "");
      paymentMethodId = (_prefs.getString('paymentMethodId') ?? "");
      //itemId = (_prefs.getString('itemId') ?? "");
    });
    return;
  }

  var value = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Datum>?>(
        future: custormerListAPIResult,
        builder: (context, snapshot) {
          var data = snapshot.data;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 100,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetails(
                            orderNumber: data[index].orderNumber.toString(),
                            total: data[index].total,
                            orderDate: data[index].orderDate.toString(),
                            orderDetails: data[index].orderDetail,
                            paymentMethodId: data[index].paymentMethodId,
                            subtotal: data[index].subtotal,
                            taxAmount: data[index].taxAmount,
                            discountAmount: data[index].discountAmount,
                          ),
                        ),
                      );
                    },
                    child: Card(
                      
                      elevation: 1,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        title: Row(
                          children: [
                            Text(
                                'Order: ${data[index].orderNumber.toString()} '),
                          ],
                        ),
                        subtitle:
                            Text('${data[index].orderDetail!.length} item(s)'),
                        trailing: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                data[index].orderDate.toString(),
                                style: const TextStyle(color: Colors.blue),
                              ),
                            ),
                            Text(
                              '₦${value.format(data[index].total)}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
