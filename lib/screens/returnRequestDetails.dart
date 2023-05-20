// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, avoid_print, unused_element, file_names

import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/rmaReport.dart';
import '../Model/rme.dart';
import 'returnRequestPopup.dart';

class ReturnRequestDetails extends StatefulWidget {
  String? invoiceNumber;
  String? orderNumber;
  dynamic trackingNumber;
  DateTime? postedDate;
  String? quote;
  String? paymentMethodId;
  double? subtotal;
  double? taxAmount;
  dynamic total;
  double? discountAmount;
  ReturnRme? rmaData;
  List? rmaDetail;
  dynamic invoiceDate;

  ReturnRequestDetails(
      {this.orderNumber,
      this.invoiceNumber,
      this.trackingNumber,
      this.quote,
      this.paymentMethodId,
      this.subtotal,
      this.postedDate,
      this.taxAmount,
      this.rmaDetail,
      this.discountAmount,
      this.rmaData,
      this.total,
      this.invoiceDate});

  @override
  State<ReturnRequestDetails> createState() => _ReturnRequestDetailsState();
}

class _ReturnRequestDetailsState extends State<ReturnRequestDetails> {
  var value = NumberFormat('#,##0.00');
  dynamic customerId;
  String? token;
  String? orderNumber;
  List? rmaDetail;

  late final SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  getStringValuesSF() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      token = _prefs.getString('token');
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('Return Request Details')),
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 10,
                  right: 10,
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: Text(
                        'General info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Return ID ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '${widget.invoiceNumber}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Return Date ',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '${widget.invoiceDate}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Original Order ID',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '${widget.trackingNumber}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Original Invoice ID',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '${widget.orderNumber}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: SizedBox(
                        width: 170,
                        child: SizedBox(
                          height: 30,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(left: 20, right: 5),
                              filled: true,
                              fillColor: Colors.orange[50],
                              border: OutlineInputBorder(),
                              hintText: '${widget.quote}',
                              hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(35),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 75,
                      color: Colors.grey[100],
                      child: Row(
                        children: [
                          SizedBox(
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                final box =
                                    context.findRenderObject() as RenderBox?;
                                RmaReportApi(box);
                              },
                              child: Text('Print Return Details'),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              SizedBox(
                                height: 45,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green),
                                  onPressed: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (context) => SizedBox(
                                        height: 400,
                                        child: _popupReturnRequestPopup(
                                            widget.rmaData!),
                                      ),
                                    );
                                  },
                                  child: Text('View Status'),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Items to Return',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.rmaDetail!.length,
                        itemBuilder: (context, index) {
                          // ignore: unused_local_variable
                          String? formattedDate;
                          return Card(
                            elevation: 2,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'lib/images/cart.jpg',
                                ),
                              ),
                              title: Text(
                                widget.rmaDetail![index].itemId,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.rmaDetail![index].orderQty.toString(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              trailing: Column(
                                children: [
                                  Text(
                                    formattedDate = DateFormat('yyyy-MM-dd')
                                        .format(widget
                                            .rmaDetail![index].invoicedDate),
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      '₦${value.format(widget.rmaDetail?[index].total)}',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: Text(
                        'Payment Info',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Payment method',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '${widget.paymentMethodId}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Subtotal',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.subtotal)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.discountAmount)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Shipping Fee',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(000)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Tax',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.taxAmount)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.total)}',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ReturnRequestPopup _popupReturnRequestPopup(ReturnRme rmaData) =>
      ReturnRequestPopup(rmaData: rmaData);

  // ignore: non_constant_identifier_names
  void RmaReportApi(RenderBox? box) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/GetRmaReportById/741258?Id=${widget.invoiceNumber}'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      var rmaReport = RmaReport.fromJson(result);
      rmaReport.data!.fileContents;
      // ignore: unused_local_variable
      final shareResult = await Share.shareXFiles(
        [
          XFile.fromData(
            Uint8List.fromList(
                base64.decode(rmaReport.data!.fileContents ?? '')),
            name: 'rma-${widget.invoiceNumber}',
            mimeType: rmaReport.data!.contentType ?? 'application/pdf',
          ),
        ],
        sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
      );

      // scaffoldMessenger.showSnackBar(getResultSnackBar(shareResult));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
