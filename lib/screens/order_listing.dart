import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
// import 'package:sales_order/screens/orders.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Model/addOrder.dart';
import '../Model/custormerorder.dart';
import 'orderDetails.dart';

class Orderdetails extends StatefulWidget {
  final Order? orderCrt;
  const Orderdetails({
    super.key,
    required this.orderCrt,
  });

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

  late final SharedPreferences prefss;
  Future<List<Datum>?> callApi() async {
    prefss = await SharedPreferences.getInstance();
    token = prefss.getString('token');
    customerId = prefss.getString('customerId') ?? "";
     

    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMApi/api/GetOrderByCustomerId/741258?CustomerId=$customerId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
    }
    // if (kDebugMode) {
    //   print('Response body: ${response.body}');
    // }
    if (kDebugMode) {
      print('token : $token');
    }

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
  dynamic invoicedDate;
  String? status;
  dynamic customerId;
  String? paymentMethodId;
  double? subtotal;
  int? taxAmount;
  bool? posted;
  bool? picked;
  dynamic total;
  bool? invoiced;
  int? orderQty;
  dynamic orderDate;
  String? token;

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
                var orderDate = data[index].orderDate;
                // ignore: unused_local_variable
                var formattedDate = DateFormat('yyyy-MM-dd').format(orderDate!);
                getOrderStatus() {
                  if (data[index].picked == true &&
                      data[index].invoiced == true &&
                      data[index].posted == true) {
                    status = 'Completed';
                  } else if (data[index].posted == true &&
                      data[index].invoiced == false &&
                      data[index].picked == true) {
                    status = 'Ready for PickUp';
                  } else {
                    status = 'Order Received';
                  }
                  return status;
                }

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
                            statusOrder: getOrderStatus().toString(),
                            orderDetails: data[index].orderDetail,
                            paymentMethodId: data[index].paymentMethodId,
                            orderDate: formattedDate =
                                DateFormat('EEE, MMM dd yyyy')
                                    .format(orderDate),
                            subtotal: data[index].subtotal,
                            taxAmount: data[index].taxAmount,
                            discountAmount: data[index].discountAmount,
                            posted: data[index].posted,
                            postedDate: data[index].postedDate,
                            picked: data[index].picked,
                            orderData: data[index],
                          ),
                        ),
                      );
                    },
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: ListTile(
                        title: Stack(children: [
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Row(
                                children: [
                                  Text(
                                    '${getOrderStatus()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: status == 'Ready for Pickup'
                                          ? Colors.blue
                                          : status == 'Completed'
                                              ? Colors.green
                                              : status == 'Order Received'
                                                  ? Colors.orange
                                                  : Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Text(
                                    'Order: ${data[index].orderNumber.toString()} '),
                              ),
                            ],
                          ),
                        ]),
                        subtitle:
                            Text('${data[index].orderDetail!.length} item(s)'),
                        trailing: Column(
                          children: [
                            Text(
                              DateFormat('EEE, MMM dd yyyy').format(orderDate),
                              style: const TextStyle(color: Colors.blueGrey),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '₦${value.format(data[index].total)}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
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
