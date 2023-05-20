// ignore_for_file: prefer_const_constructors, file_names

import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Screens/select_item.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/addOrder.dart';
import '../Model/computeOrderCustomer.dart';
import '../Model/products.dart';
import 'checkout.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  @override
  void initState() {
    getStringValuesAddress();
    super.initState();
  }

  final DateFormat formatter = DateFormat('MM-dd-yyyy');
  var orderDate = DateTime.now();
  var truncatedDate = DateFormat('yyy-MM-dd');
  String pickeddate = "";
  String? customerId = "";
  dynamic customerEmail;
  dynamic availableCredit;

  computeAvCrd(availableCredit) {
    if (availableCredit == 0) {
      availableCredit = 0.0;
    } else {
      availableCredit = availableCredit;
    }
    return availableCredit;
  }

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

  var value = NumberFormat('#,##0.00');

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('Cart')),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            iconSize: 40,
          ),
          Text(
            store.getBasketQty().toString(),
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: AnimatedButton(
            height: 46,
            width: 400,
            text: 'Check Out',
            animationDuration: const Duration(seconds: 2),
            textStyle: const TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
            gradient: const LinearGradient(
              colors: [Colors.blueGrey, Colors.blue],
            ),
            selectedGradientColor:
                const LinearGradient(colors: [Colors.blue, Colors.blueGrey]),
            selectedTextColor: Colors.black,
            transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
            isReverse: true,
            borderColor: Colors.white,
            borderRadius: 45,
            onPress: () {
              //// Call the api for checking out .......
              if (store.baskets.isEmpty) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text(
                          'Add at least 1 item before proceeding to checkout'),
                      actions: <Widget>[
                        TextButton(
                          child: const Text('Ok'),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SelectItemScreen(),
                              ),
                            );
                          },
                        )
                      ],
                    );
                  },
                );
              } else {
                Map<String, dynamic> orderCrd = getOrderCreated(store);
                computeOrder(orderCrd);
              }
            },
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 0,
          right: 0,
          left: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: ListView.builder(
          itemCount: store.baskets.length,
          itemBuilder: (context, i) {
            var shippingDate = store.baskets[i].shipDate ?? DateTime.now();
            // ignore: unused_local_variable
            var formattedDate = DateFormat('yyy-MM-dd').format(shippingDate);
            return Card(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Image.asset(
                          'lib/images/cart.jpg',
                          width: 60,
                          height: 70,
                          fit: BoxFit.contain,
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          store.baskets[i].name!,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(
                            () {
                              store.baskets.removeAt(i);
                            },
                          );
                        },
                        icon: Icon(Icons.close),
                      ),
                    ],
                  ),
                  // ignore: sized_box_for_whitespace
                  Container(
                    height: 30,
                    child: Text(
                        "Shipping Date :  ${formattedDate = DateFormat('yyy-MM-dd').format(shippingDate)}"),
                  ),
                  Container(
                    height: 40,
                    padding: EdgeInsets.only(left: 40),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            store.removeOneItemFromBasket(store.baskets[i]);
                          },
                          icon: Icon(Icons.remove),
                          iconSize: 32,
                          color: Colors.redAccent,
                        ),
                        SizedBox(width: 10),
                        // ignore: sized_box_for_whitespace
                        Container(
                          height: 20,
                          width: 50,
                          child: TextFormField(
                            controller: TextEditingController()
                              ..text = store.baskets[i].qty.toString()
                              ..selection = TextSelection.collapsed(
                                  offset:
                                      store.baskets[i].qty.toString().length),
                            onChanged: (text) {
                              store.increaseItemQuantity(
                                  (int.tryParse(text) ?? 0), store.baskets[i]);
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        IconButton(
                          onPressed: () {
                            store.addOneItemToBasket(store.baskets[i]);
                          },
                          icon: Icon(Icons.add),
                          iconSize: 30,
                          color: Colors.greenAccent,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        // ignore: avoid_unnecessary_containers
                        Container(
                          child: Text(
                            ('₦${value.format(store.baskets[i].totalPrice)}'),
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
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
