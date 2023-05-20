// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Model/addQuote.dart';
import '../Model/quoteOrder.dart';
import 'quoteDetails.dart';

class Quotes extends StatefulWidget {
  final List<QuotesOrders>? qtyCrt;
  const Quotes({super.key, required this.qtyCrt});

  @override
  State<Quotes> createState() => _QuotesState();
}

String? token;

class _QuotesState extends State<Quotes> {
  Future<List<QuoteOrders>?> quoteListAPIResult =
      Future.value(List<QuoteOrders>.from([QuoteOrders()]));

  @override
  void initState() {
    quoteListAPIResult = callApi();
    super.initState();
  }

  Future<List<QuoteOrders>?> callApi() async {
    _prefs = await SharedPreferences.getInstance();
    token = _prefs.getString('token');
    customerId = _prefs.getString('customerId') ?? "";
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMApi/api/GetQuotesByCustomerId/741258?CustomerId=$customerId'),
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

      var quoteorders = QuoteOrder.fromJson(result);
      return quoteorders.data;
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
  int? discountAmount;
  dynamic total;
  int? orderQty;
  dynamic orderDate;
  String? token;
  bool? posted;
  bool? picked;
  DateTime? postedDate;
  bool? invoiced;

  late final SharedPreferences _prefs;

  var value = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QuoteOrders>?>(
        future: quoteListAPIResult,
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
                var formattedDate = DateFormat('yyyy-MM-dd').format(orderDate!);
                getQuoteStatus() {
                  if (data[index].picked == true &&
                      data[index].invoiced == true &&
                      data[index].posted == true) {
                    status = 'Completed';
                  } else if (data[index].picked == true &&
                      data[index].invoiced == false &&
                      data[index].posted == false) {
                    status = 'Ready for PickUp';
                  } else {
                    status = 'Quote Received';
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
                            builder: (context) => QuoteDetails(
                                  orderNumber:
                                      data[index].orderNumber.toString(),
                                  total: data[index].total,
                                  orderDate: formattedDate =
                                      DateFormat('EEE, MMM dd yyyy')
                                          .format(orderDate),
                                  orderDetails: data[index].orderDetail,
                                  statusQuote: getQuoteStatus().toString(),
                                  paymentMethodId: data[index].paymentMethodId,
                                  subtotal: data[index].subtotal,
                                  taxAmount: data[index].taxAmount,
                                  discountAmount: data[index].discountAmount,
                                  posted: data[index].posted,
                                  postedDate: data[index].postedDate,
                                  picked: data[index].picked,
                                  orderData: data[index],
                                )),
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
                                    '${getQuoteStatus()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: status == 'Ready for Pickup'
                                          ? Colors.blue
                                          : status == 'Completed'
                                              ? Colors.green
                                              : status == 'Quote Received'
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
                                    'Quote: ${data[index].orderNumber.toString()} '),
                              ),
                            ],
                          ),
                        ]),
                        subtitle:
                            Text('${data[index].orderDetail!.length} item(s)'),
                        trailing: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 2.0),
                              child: Text(
                                formattedDate = DateFormat('EEE, MMM dd yyyy')
                                    .format(orderDate),
                                style: const TextStyle(color: Colors.blueGrey),
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
                );
              },
            );
          }
        },
      ),
    );
  }
}
