// ignore_for_file: file_names

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/rme.dart';
import 'dashboard.dart';
import 'orders.dart';
import 'profileScreen.dart';
import 'returnRequestDetails.dart';
import 'rmePage.dart';
import 'select_item.dart';

class ReturnRequest extends StatefulWidget {
  const ReturnRequest({super.key});

  @override
  State<ReturnRequest> createState() => _ReturnRequestState();
}

class _ReturnRequestState extends State<ReturnRequest> {
  Future<List<ReturnRme>?> custormerListAPIResult =
      Future.value(List<ReturnRme>.from([ReturnRme()]));

  @override
  void initState() {
    custormerListAPIResult = callApi();
    super.initState();
  }

  Future<List<ReturnRme>?> callApi() async {
    _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('token');
    customerId = _prefs.getString('customerId') ?? "";

    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMApi/api/GetRmaByCustomerId/741258?CustomerId=$customerId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    if (kDebugMode) {
      print('Response status: ${response.statusCode}');
    }
    if (kDebugMode) {
      print('Response body: ${response.body}');
    }
    if (kDebugMode) {
      print('token : $token');
    }

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      var rme = RME.fromJson(result);
      return rme.data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String? invoiceNumber = '';
  dynamic trackingNumber = '';
  String? orderTypeId = '';
  String? status = '';
  String? orderNumber = '';
  String? customerId = '';
  String? paymentMethodId = '';
  double? subtotal = 0.0;
  double? taxAmount = 0.0;
  double? discountAmount = 0.0;
  dynamic total = '';
  double? orderQty = 0.0;
  dynamic itemId = 0;
  dynamic invoiceDate;
  String? token;

  late final SharedPreferences _prefs;

  var value = NumberFormat("#,##0.00");
  // var values = DateFormat("M/d/y,h:mm");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ReturnRme>?>(
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
                var invoiceDate = data[index].invoiceDate;
                // ignore: unused_local_variable
                var formattedDate =
                    DateFormat('yyyy-MM-dd').format(invoiceDate!);
                getQuote() {
                  if (data[index].posted == null ||
                      data[index].posted == false) {
                    status = 'Submitted';
                  } else if (data[index].posted == true &&
                      data[index].posted == true) {
                    status = 'Completed';
                  } else {
                    status = 'Flagged';
                  }
                  return status;
                }

                return SingleChildScrollView(
                  child: SizedBox(
                    height: 100,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ReturnRequestDetails(
                              orderNumber: data[index].orderNumber.toString(),
                              invoiceNumber: data[index].invoiceNumber,
                              trackingNumber: data[index].trackingNumber,
                              quote: getQuote().toString(),
                              invoiceDate: formattedDate =
                                  DateFormat('EEE, MMM dd yyyy')
                                      .format(invoiceDate),
                              total: data[index].total,
                              taxAmount: data[index].taxAmount,
                              discountAmount: data[index].discountAmount,
                              subtotal: data[index].subtotal,
                              rmaDetail: data[index].rmaDetail,
                              rmaData: data[index],
                            ),
                          ),
                        );
                      },
                      child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left: 22),
                          title: Stack(children: [
                            Positioned.fill(
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Row(
                                  children: [
                                    Text(
                                      '${getQuote()}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: status == 'Completed'
                                            ? Colors.green
                                            : status == 'Submitted'
                                                ? Colors.orange
                                                : status == 'Flagged'
                                                    ? Colors.red
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
                                  padding: const EdgeInsets.only(top: 30.0),
                                  child: Text(
                                      'Return: ${data[index].invoiceNumber.toString()}'),
                                ),
                              ],
                            ),
                          ]),
                          subtitle:
                              Text('${data[index].rmaDetail!.length} item(s)'),
                          trailing: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: Text(
                                  formattedDate = DateFormat('EEE, MMM dd yyyy')
                                      .format(invoiceDate),
                                  style:
                                      const TextStyle(color: Colors.blueGrey),
                                ),
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
                  ),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blueGrey,
        currentIndex: 3,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 23,
        // currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horizontal_circle_outlined),
            label: "Return",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 0:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DashBoard()),
              );
              break;
          }
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectItemScreen()),
              );
              break;
          }
          switch (index) {
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Orders()),
              );
              break;
          }
          switch (index) {
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ReturnRMA()),
              );
              break;
          }
          switch (index) {
            case 4:
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const profileScreen()));
              break;
            default:
          }
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
