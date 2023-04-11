import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/rme.dart';
import 'rmeDetails.dart';

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

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    return null;
  }

  Future<List<ReturnRme>?> callApi() async {
    await getToken();
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMApi/api/GetRmaByCustomerId/741258?CustomerId=COMMPRINT 036'),
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

      var rme = RME.fromJson(result);
      return rme.data;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String? invoiceNumber = '';
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

  getStringValues() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      invoiceNumber = (_prefs.getString('invoiceNumber') ?? "");
      invoiceDate = (_prefs.getString('invoiceDate') ?? "");
      total = (_prefs.getDouble('total') ?? 0);
      orderQty = (_prefs.getDouble('orderQty') ?? 0);
      invoiceDate = (_prefs.getString('invoiceDate') ?? "");
      orderNumber = (_prefs.getString('orderNumber') ?? "");
    });
    return;
  }

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
                return SingleChildScrollView(
                  child: SizedBox(
                    height: 100,
                    child: GestureDetector(
                      onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RmeDetail(
                            orderNumber: data[index].orderNumber.toString(),
                            invoiceNumber: data[index].invoiceNumber,
                            invoiceDate: data[index].invoiceDate,
                          ),
                        ),
                      );
                      },
                      child: Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(left: 22),
                          title: Row(
                            children: [
                              Text(
                                  'RMA: ${data[index].invoiceNumber.toString()} '),
                            ],
                          ),
                          subtitle:
                              Text('${data[index].rmaDetail!.length} item(s)'),
                          trailing: Column(
                            children: [
                              Text(
                                data[index].invoiceDate.toString(),
                                style: const TextStyle(color: Colors.blue),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(11.0),
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
    );
  }
}
