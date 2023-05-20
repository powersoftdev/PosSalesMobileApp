// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_call_super, file_names

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sales_order/screens/checkout.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/addOrder.dart';
import '../Model/computeOrderCustomer.dart';
import '../Store/MyStore.dart';

import 'basketPage.dart';
import 'package:sales_order/Model/products.dart';

class ProductDetailpage extends StatefulWidget {
  const ProductDetailpage({super.key});

  @override
  State<ProductDetailpage> createState() => _ProductDetailpageState();
}

class _ProductDetailpageState extends State<ProductDetailpage> {
  final _date = TextEditingController();
  final _qtyCtrl = TextEditingController();
  String qtyStr = '';
  late String price;
  String itemName = "";
  //late final SharedPreferences _prefs;

  computeAvCrd(availableCredit) {
    if (availableCredit == 0) {
      availableCredit = 0.0;
    } else {
      availableCredit = availableCredit;
    }
    return availableCredit;
  }

  @override
  void dispose() {
    _date.dispose();
    _qtyCtrl.dispose();
    super.dispose();
  }

  @override
  void initState() {
    getStringValuesAddress();
    super.initState();
  }

  // getStringValuesSF() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     itemName = _prefs.getString('itemName') ?? "";
  //   });

  //   return itemName;
  // }

  String pickeddate = "";
  String? customerId = "";
  dynamic customerEmail;
  dynamic availableCredit;

  late final SharedPreferences prefs;

  getStringValuesAddress() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      customerEmail = prefs.getString('customerEmail') ?? "";
      customerId = prefs.getString('customerId') ?? "";
      availableCredit = prefs.getDouble('availableCredit');
    });
    return;
  }

  getBasketItm(MyStore store) {
    var totalBasket = store.baskets;
    var orderDetails = [];

    for (Product item in totalBasket) {
      var orderDetail = <String, dynamic>{
        'ItemID': item.id,
        'OrderQty': item.qty,
      };
      orderDetails.add(orderDetail);
    }

    final orderDTO = <String, dynamic>{"orderDetail": orderDetails};
    return orderDTO;
  }

  getOrderCreated(MyStore store) {
    var totalBasket = store.baskets;
    var orderDetails = <OrderDetail>[];

    for (Product item in totalBasket) {
      var myorderDetail = OrderDetail(
        orderLineNumber: 0,
        itemId: item.id,
        invoicedDate: item.shipDate ?? DateTime.now(),
        orderQty: item.qty,
        itemUnitPrice: item.price,
        subTotal: item.totalPrice,
        total: item.totalPrice,
      );
      orderDetails.add(myorderDetail);
    }
    var orderDate = DateTime.now();
    var truncatedDate = DateFormat('yyy-MM-dd').format(orderDate);

    var total = store.getTotalAmount();
    var subtotal = store.getTotalAmount();

    final orderCreated = Order(
      transactionTypeId: '',
      orderDate: truncatedDate,
      total: total,
      subtotal: subtotal,
      customerId: customerId,
      orderDetail: orderDetails,
    ).toJson();
    return orderCreated;
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    // String qtyStr = store.activeProduct!.qty.toString();
    qtyStr = _getQty(store);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xFF737373),
          child: Container(
            padding: EdgeInsets.only(top: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Center(
                  child: TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 100),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: (store.activeProduct!.name),
                      enabledBorder: UnderlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  readOnly: true,
                  decoration: InputDecoration(
                    suffixIcon:
                        Text('₦ ${store.activeProduct!.price.toString()}'),
                    contentPadding: EdgeInsets.only(left: 30),
                    suffixIconConstraints:
                        BoxConstraints(minWidth: 100, minHeight: 0),
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                    labelText: ('Price: '),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _date,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 30),
                    fillColor: Colors.white,
                    filled: true,
                    border: const OutlineInputBorder(),
                    suffixIcon: Icon(Icons.calendar_today_rounded),
                    labelText: 'Select Preferred Delivery Date:',
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(width: 2, color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onTap: () async {
                    DateTime? pickeddate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050));

                    if (pickeddate != null) {
                      setState(
                        () {
                          _date.text = DateFormat.yMMMEd().format(pickeddate);
                        },
                      );

                      // final SharedPreferences prefs =
                      //     await SharedPreferences.getInstance();
                      // await prefs.setString('pickeddate', _date.text);

                      store.assignDeliveryDate(
                          pickeddate, store.activeProduct!);
                    }
                  },
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  width: 200,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _qtyCtrl.text =
                                ((int.tryParse(_qtyCtrl.text) ?? 0) - 1)
                                    .toString();
                          });
                          store.removeOneItemFromBasket(store.activeProduct!);
                        },
                        icon: Icon(Icons.remove),
                        iconSize: 32,
                        color: Colors.redAccent,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                        height: 25,
                        width: 50,
                        child: TextFormField(
                          // controller: _date,
                          controller: TextEditingController()
                            ..text = qtyStr
                            ..selection =
                                TextSelection.collapsed(offset: qtyStr.length),
                          onChanged: (text) {
                            // setState(() {
                            //   qtyStr = '10';
                            // });
                            store.increaseItemQuantity(
                                (int.tryParse(text) ?? 0),
                                store.activeProduct!);
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                          ),
                          // onChanged: (text) {},
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _qtyCtrl.text =
                                ((int.tryParse(_qtyCtrl.text) ?? 0) + 1)
                                    .toString();
                          });
                          store.addOneItemToBasket(store.activeProduct!);
                        },
                        icon: Icon(Icons.add),
                        iconSize: 32,
                        color: Colors.greenAccent,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.blue[300],
                      fixedSize: const Size(
                        350,
                        45,
                      )),
                  onPressed: () {
                    if (_qtyCtrl.text == "" && qtyStr == "0") {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title:
                                const Text('Add at least 1 item to the cart'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      /////////////////

                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BasketPage()));
                    }
                  },
                  child: Text('Go To Cart'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.blue[300],
                    fixedSize: const Size(
                      350,
                      45,
                    ),
                  ),
                  onPressed: () {
                    if (_qtyCtrl.text == "") {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                                'Add at least 1 item before placing an order'),
                            actions: <Widget>[
                              TextButton(
                                child: const Text('Ok'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      Map<String, dynamic> orderCrd = getOrderCreated(store);
                      computeOrder(orderCrd);
                    }
                  },
                  child: Text('Place Order'),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    backgroundColor: Colors.red[300],
                    fixedSize: const Size(
                      350,
                      45,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Select More Items'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getQty(MyStore store) {
    var baskets = store.baskets;
    var activeItem = store.activeProduct;
    if (store.baskets.isNotEmpty) {
      var product = baskets.firstWhere((a) => a.id == activeItem!.id,
          orElse: () => Product());
      if (product.qty != null) {
        return product.qty!
            .toString(); // return current product qty if it exists.
      }
      return '0'; // if basket is not empty but product not found, return 0
    }

    return '0'; // if basket is empty return 0
  }

  Future<void> computeOrder(orderCrd) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    var orderEncode = jsonEncode(orderCrd);
    var url = Uri.parse(
        'https://powersoftrd.com/PEMApi/api/ComputeOrderSummary/741258');
    var response = await http
        .post(url,
            headers: {
              "Access-Control-Allow-Origin": "*",
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
            body: orderEncode)
        .timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        Navigator.of(context).pop();
        return http.Response(
            computeToJson(Compute(
                status: "Failed",
                message: "Cannot Connect to Internet.",
                data: OrderCompute(),
                authToken: "")),
            408);
      },
    );

    final order = json.decode(response.body);

    if (order['status'].toString() == "Success") {
      final Compute responseData = computeFromJson(response.body);

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var customerInformation = responseData.data!;

      var customerId = customerInformation.customerId;
      var customerEmail = customerInformation.customerEmail;
      var companyId = customerInformation.companyId;
      var departmentId = customerInformation.departmentId;
      var availiableCrd = customerInformation.availableCredit;
      var divisionId = customerInformation.divisionId;
      var amountToPay = customerInformation.amountToPay;
      var discountAmount = customerInformation.discountAmount;
      var subTotal = customerInformation.subtotal;
      var taxAmount = customerInformation.taxAmount;
      var total = customerInformation.total;

      double dAvaliableCredit =
          availiableCrd == null || availiableCrd == 0 || availiableCrd == 0.00
              ? 0.00
              : double.parse(availiableCrd.toString());


              

      await prefs.setString('departmentId', departmentId!);
      await prefs.setString('customerId', customerId!);
      await prefs.setDouble('availiableCredit', dAvaliableCredit);
      await prefs.setString('customerEmail', customerEmail!);
      await prefs.setString('companyId', companyId!);
      await prefs.setString('divisionId', divisionId!);
      await prefs.setDouble('amountToPay', amountToPay!);
      await prefs.setInt('discountAmount', discountAmount!);
      await prefs.setInt('subTotal', subTotal!);
      await prefs.setDouble('taxAmount', taxAmount!);
      await prefs.setDouble('total', total!);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Checkout(),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(order['message'].toString()),
            );
          });
    }
  }
}
