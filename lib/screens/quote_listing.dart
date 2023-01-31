import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Model/quote.dart';
import 'quoteDetails.dart';

class Quotes extends StatefulWidget {
  const Quotes({super.key});

  @override
  State<Quotes> createState() => _QuotesState();
}

String? token;

class _QuotesState extends State<Quotes> {
  Future<List<QuotesOrders>?> quoteListAPIResult =
      Future.value(List<QuotesOrders>.from([QuotesOrders()]));

  @override
  void initState() {
    quoteListAPIResult = callApi();
    super.initState();
  }

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return null;
  }

  Future<List<QuotesOrders>?> callApi() async {
    await getToken();
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMApi/api/GetQuotesByCustomerId/741258?CustomerId=COMMPRINT 036'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    print('token : $token');

    if (response.statusCode == 200) {
      final result = json.decode(response.body);

      var quotesorders = QuotesOrder.fromJson(result);
      return quotesorders.data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String? orderNumber = '';
  dynamic total = '';
  double? orderQty = 0.0;
  dynamic itemId = 0;
  dynamic orderDate;
  String? token;

  late final SharedPreferences _prefs;

  getStringValues() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      orderNumber = (_prefs.getString('orderNumber') ?? "");
      total = (_prefs.getDouble('total') ?? 0);
      orderQty = (_prefs.getDouble('total') ?? 0);
      orderDate = (_prefs.getString('orderdate') ?? "");
    });
    return;
  }

  var value = NumberFormat("#,##0.00", "en_US");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<QuotesOrders>?>(
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
                return SizedBox(
                  height: 100,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuoteDetails(
                            orderNumber: data[index].orderNumber.toString(),
                            total: data[index].total,
                            orderDate: data[index].orderDate,
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
