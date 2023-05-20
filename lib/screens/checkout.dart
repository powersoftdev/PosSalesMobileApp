// ignore_for_file: unused_local_variable

import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'package:sales_order/screens/basketPage.dart';
import 'package:sales_order/screens/paystackwebview.dart';
import 'package:sales_order/screens/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/addOrder.dart';
import '../Model/addQuote.dart';
import '../Model/customerInfo.dart';
import '../Model/payment.dart';
import '../Model/products.dart';
import 'orders.dart';

enum PaymentOption { payOffline, payOnline }

enum AddressInfo { location }

// Initial Selected Value
String? dropdownvalue;
String? addressvalue;

// List of items in our dropdown menu
var items = ['Door', 'Walk-In'];

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  @override
  void initState() {
    getStringValuesAddress();
    super.initState();
  }

  PaymentOption _value = PaymentOption.payOnline;
  AddressInfo _values = AddressInfo.location;

  // final _qtyCtrl = TextEditingController();

  final GlobalKey<FormState> couponKey = GlobalKey<FormState>();
  final GlobalKey<FormState> formkeyCoupon = GlobalKey<FormState>();
  final couponController = TextEditingController();
  var value = NumberFormat("#,##0.00", "en_US");

  // getTotal() {
  //   int total = 0;
  //   total = getSubtotal() + getShippingCost() - getdiscount() + getTax();
  //   return total;
  // }

  // getAvailiableCrd() {
  //   dynamic availiableCrd = availiableCredit!;
  //   return availiableCrd;
  // }

  getShippingCost() {
    int shippingCost = 0;
    return shippingCost;
  }

  // getTotalAmount() {
  //   int totalAmount = 0;
  //   return totalAmount;
  // }

  // getdiscount() {
  //   int discount = 0;
  //   return discount;
  // }

  // getTax() {
  //   int tax = 0;
  //   return tax;
  // }

  // getSubtotal() {
  //   int subtotal = 0;
  //   return subtotal;
  // }

  String customerAddress1 = "";
  String customerAddress2 = "";
  String customerEmail = "";
  String? customerId = '';
  dynamic taxAmount = 0;
  String? detailMemo3 = "";
  dynamic coupon = "";
  dynamic total = 0;
  dynamic discountAmount = 0;
  dynamic subTotal = 0;
  String companyId = '';
  String? transactionTypeId = '';
  String customerName = '';
  String divisionId = '';
  String departmentId = '';
  dynamic accountBalance = 0;
  dynamic availiableCredit = 0;
  dynamic amountToPay = 0;
  var authorizationUrl = '';
  var reference = '';

  final emailcontroller = TextEditingController();

  late final SharedPreferences prefs;

  getStringValuesAddress() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      customerAddress1 = prefs.getString('customerAddress1') ?? "";
      customerAddress2 = prefs.getString('customerAddress2') ?? "";
      customerEmail = prefs.getString('customerEmail') ?? "";
      availiableCredit = prefs.getDouble('availiableCredit');
      accountBalance = prefs.getDouble('accountBalance') ?? 0.0;
      customerId = prefs.getString('customerId');
      customerName = prefs.getString('customerName') ?? "";
      subTotal = prefs.getInt('subTotal');
      taxAmount = prefs.getDouble('taxAmount');
      discountAmount = prefs.getInt('ddiscountAmount') ?? 0;
      total = prefs.getDouble('total');
      amountToPay = prefs.getDouble('amountToPay');

      String? tokenFromSP = prefs.getString('token');
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
        detailMemo3: coupon,
        invoicedDate: item.shipDate ?? DateTime.now(),
        orderQty: item.qty,
        itemUnitPrice: item.price,
        taxAmount: taxAmount,
        subTotal: subTotal,
        total: total,
      );
      orderDetails.add(myorderDetail);
    }
    var orderDate = DateTime.now();
    var truncatedDate = DateFormat('yyy-MM-dd').format(orderDate);

    // var total =subTotal;
    //var subtotal =subTotal;

    final orderCreated = Order(
      transactionTypeId: '',
      orderDate: truncatedDate,
      total: total,
      subtotal: subTotal,
      customerId: customerId,
      orderDetail: orderDetails,
    ).toJson();
    return orderCreated;
  }

  getQuoteCreated(MyStore store) {
    var totalBasket = store.baskets;
    var orderDetails = <QuoteDetail>[];

    for (Product item in totalBasket) {
      var myorderDetail = QuoteDetail(
        orderLineNumber: 0,
        itemId: item.id,
        orderQty: item.qty,
        taxAmount: taxAmount,
        invoicedDate: item.shipDate ?? DateTime.now(),
        itemUnitPrice: item.price,
        subTotal: subTotal,
        total: total,
      );
      orderDetails.add(myorderDetail);
    }
    var orderDate = DateTime.now();

    final quoteCreated = QuotesOrders(
      transactionTypeId: '',
      orderDate: orderDate,
      total: total,
      subtotal: subTotal,
      customerId: customerId,
      orderDetail: orderDetails,
    ).toJson();
    return quoteCreated;
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.add_shopping_cart_rounded),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BasketPage()),
              );
            },
            iconSize: 40,
          ),
          Text(
            store.getBasketQty().toString(),
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
        title: const Center(
          child: Center(
            child: Text(
              'Checkout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    width: 350,
                    height: 280,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 8.0,
                            color: Colors.grey,
                            offset: Offset(0, 5)),
                      ],
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: emailcontroller..text = customerEmail,
                            readOnly: true,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 290, top: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Text('Ship to'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 120.0),
                          child: RadioListTile(
                            subtitle: Text(customerAddress2),
                            value: AddressInfo.location,
                            title: Text(
                              customerAddress1,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            groupValue: _values,
                            onChanged: (AddressInfo? val) {
                              setState(() {
                                _values = val!;
                              });
                            },
                          ),
                        ),
                        Column(
                          children: [
                            DropdownButton(
                              hint: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Delivery Type:'),
                              ),
                              dropdownColor: Colors.white,
                              icon: const Icon(
                                Icons.arrow_drop_down,
                                color: Colors.blue,
                              ),
                              iconSize: 36,

                              isExpanded: true,
                              underline: const SizedBox(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                              // Initial Value
                              value: dropdownvalue,
                              // Array list of items
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(items),
                                  ),
                                );
                              }).toList(),
                              // After selecting the desired option,it will
                              // change button value to selected value
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownvalue = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: 355,
                    height: 656,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 8.0,
                            color: Colors.grey,
                            offset: Offset(0, 5)),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Subtotal:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      //color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₦ ${value.format(subTotal)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              dense: false,
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Discount:',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₦ ${value.format(discountAmount!)}',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              dense: false,
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Shipping Cost:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      //color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₦ ${value.format(getShippingCost())}',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              dense: false,
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Tax:',
                                    style: TextStyle(
                                      fontSize: 20,
                                      //color: Colors.green,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₦ ${value.format(taxAmount)}',
                                    style: TextStyle(
                                      color: taxAmount <= 0
                                          ? Colors.red
                                          : Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              dense: false,
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Total:',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₦ ${value.format(total)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              dense: false,
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Available Credit:',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₦ ${value.format(availiableCredit)}',
                                    style: TextStyle(
                                      color: availiableCredit >= 0
                                          ? Colors.green
                                          : Colors.red,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              dense: false,
                            ),
                            ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    'Amount To Pay:',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              trailing: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    '₦ ${value.format(amountToPay)}',
                                    style: const TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              dense: false,
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 2,
                            ),
                            Form(
                              key: formkeyCoupon,
                              child: TextFormField(
                                key: couponKey,
                                controller: couponController,
                                //  ..text = coupon,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                autofocus: false,
                                keyboardType: TextInputType.multiline,
                                readOnly: false,
                                decoration: const InputDecoration(
                                  contentPadding: EdgeInsets.only(left: 20),
                                  fillColor: Colors.white,
                                  filled: true,
                                  hintText: 'Coupon Code',
                                  border: OutlineInputBorder(),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 2, color: Colors.blueAccent),
                                  ),
                                ),
                                onChanged: (value) {
                                  coupon = value;
                                },
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Choose Payment Method',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                            RadioListTile(
                              value: PaymentOption.payOffline,
                              title: const Text('Pay Offline'),
                              groupValue: _value,
                              onChanged: (PaymentOption? val) {
                                setState(() {
                                  _value = val!;
                                });
                              },
                            ),
                            RadioListTile(
                              value: PaymentOption.payOnline,
                              title: const Text('Pay Online'),
                              groupValue: _value,
                              onChanged: (PaymentOption? val) {
                                setState(() {
                                  _value = val!;
                                });
                              },
                            ),
                          ])),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(
                      20.0,
                    ),
                    child: AnimatedButton(
                      height: 46,
                      width: 400,
                      text: 'Confirm',
                      animationDuration: const Duration(seconds: 2),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      onPress: () {
                        void clearCat() {
                          setState(
                            () {
                              store.baskets.clear();
                            },
                          );
                        }

                        var basket = getBasketItm(store);
                        if (PaymentOption.payOffline == _value) {
                          if (store.baskets.isEmpty) {
                            var powersoftdemos = const SnackBar(
                              content: Text(
                                  'Please select an item in the catalog before placing an order.'),
                              backgroundColor: Colors.red,
                              duration: Duration(seconds: 5),
                              behavior: SnackBarBehavior.floating,
                              margin: EdgeInsets.all(5),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(powersoftdemos);
                          } else {
                            var amount = amountToPay;
                            var quote = getQuoteCreated(store);
                            createQuote(quote);
                            clearCat();
                          }
                        } else if (store.baskets.isEmpty) {
                          var powersoftdemos = const SnackBar(
                            content: Text(
                                'Please select an item in the catalog before placing an order.'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 5),
                            behavior: SnackBarBehavior.floating,
                            margin: EdgeInsets.all(5),
                          );
                          ScaffoldMessenger.of(context)
                              .showSnackBar(powersoftdemos);
                          // } else if (availiableCredit >
                          //    subTotal) {
                          //   var amount = amountToPay;
                          //   Map<String, dynamic> orderCrd =
                          //       getOrderCreated(store);
                          //   createAvailiableCrdOrder(orderCrd);
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (context) => const Orders(),
                          //       ));
                          //   clearCat();
                          // } else if (subTotal >
                          //     availiableCredit) {
                          //   Map<String, dynamic> order = getOrderCreated(store);
                          //   var amount = amountToPay;
                          //   createPaystackData(order).then((value) => {
                          //         reference = value.reference.toString(),
                          //         Navigator.push(
                          //           context,
                          //           MaterialPageRoute(
                          //             builder: (context) =>
                          //                 WebViewPayment(data: value),
                          //           ),
                          //         ).then(
                          //             (value) => {createOrder(reference, order)})
                          //       });
                        } else {
                          Map<String, dynamic> order = getOrderCreated(store);
                          createPaystackData(order).then((value) => {
                                reference = value!.reference.toString(),
                                if (reference == "")
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Orders(),
                                      ),
                                    )
                                  }
                                else
                                  {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            WebViewPayment(data: value),
                                      ),
                                    ).then((value) =>
                                        {createOrder(reference, order)})
                                  }
                              });
                        }
                        clearCat();
                      },
                      gradient: const LinearGradient(
                        colors: [Colors.blueGrey, Colors.blue],
                      ),
                      selectedGradientColor: const LinearGradient(
                          colors: [Colors.blue, Colors.blueGrey]),
                      selectedTextColor: Colors.black,
                      transitionType: TransitionType.LEFT_BOTTOM_ROUNDER,
                      isReverse: true,
                      borderColor: Colors.white,
                      borderRadius: 45,
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }

//////// Get Customer"s current  Information.........
  Future<void> callApi() async {
    // showDialog(
    //     context: context,
    //     builder: (context) {
    //       return const Center(child: CircularProgressIndicator());
    //     });

    var url = Uri.parse(
        'http://powersoftrd.com/PemApi/api/GetCustomerById/741258?id=$customerId');
    var response = await http.get(url, headers: {
      "Access-Control-Allow-Origin": "*",
    }).timeout(
      const Duration(seconds: 15),
      onTimeout: () {
        Navigator.of(context).pop();
        return http.Response(
            customerToJson(CustomerInfo(
                status: "Failed",
                message: "Cannot Connect to Internet.",
                data: Info(),
                authToken: "")),
            408);
      },
    );

    final Map<String, dynamic> dataCheck = json.decode(response.body);

    if (dataCheck['status'].toString() == "Success") {
      final CustomerInfo responseData = customerFromJson(response.body);

      final SharedPreferences prefs = await SharedPreferences.getInstance();

      var customerInformation = responseData.data!;
      var customerName = customerInformation.customerName;
      var customerId = customerInformation.customerId;
      var customerEmail = customerInformation.customerEmail;
      var customerPhone = customerInformation.customerPhone;
      var accountBalance = customerInformation.accountBalance;
      var customerAddress1 = customerInformation.customerAddress1;
      var customerAddress2 = customerInformation.customerAddress2;
      var customerAddress3 = customerInformation.customerAddress3;
      var customerCity = customerInformation.customerCity;
      var customerState = customerInformation.customerState;
      var customerCountry = customerInformation.customerCountry;
      var customerTypeId = customerInformation.customerTypeId;
      var companyId = customerInformation.companyId;
      var departmentId = customerInformation.departmentId;
      var divisionId = customerInformation.divisionId;
      var availiableCrd =
          customerInformation.customerFinancials!.availibleCredit;

      double dAvaliableCredit =
          availiableCrd == null || availiableCrd == 0 || availiableCrd == 0.00
              ? 0.00
              : double.parse(availiableCrd.toString());


   double accountBal =
          accountBalance == null || accountBalance == 0 || accountBalance == 0.00
              ? 0.00
              : double.parse(accountBalance.toString());

      await prefs.setString('customerEmail', emailcontroller.text);
      await prefs.setString('customerName', customerName!);
      await prefs.setString('customerId', customerId!);
      await prefs.setDouble('availiableCredit', availiableCrd!);
      await prefs.setString('customerEmail', customerEmail!);
      await prefs.setString('customerPhone', customerPhone!);
      await prefs.setDouble('accountBalance', accountBal);
      await prefs.setString('customerAddress1', customerAddress1!);
      await prefs.setString('customerAddress2', customerAddress2!);
      await prefs.setString('customerAddress3', customerAddress3!);
      await prefs.setString('customerCity', customerCity!);
      await prefs.setString('customerTypeId', customerTypeId!);
      await prefs.setString('companyId', companyId!);
      await prefs.setString('divisionId', divisionId!);
      await prefs.setString('departmentId', departmentId!);
      await prefs.setString('customerCountry', customerCountry!);
      await prefs.setString('customerState', customerState!);
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(dataCheck['message'].toString()),
            );
          });
    }
  }

  //// CREATES ORDER FOR CUSTOMER WITH NOT ENOUGH AVAILIABLE CREDIT.....

  Future<List<Order>?> createOrder(reference, order) async {
    var orderEncode = jsonEncode(order);
    final response = await http.post(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            'https://powersoftrd.com/PEMApi/api/AddOrders/741258?reference=$reference'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: orderEncode);
    final Map<String, dynamic> orderCheck = json.decode(response.body);
    if (orderCheck['status'].toString() == "Success") {
      var order = json.decode(response.body);
      var orders = CreateOrder.fromJson(order);

      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Orders()));
      var powersoftdeimo = SnackBar(
        content: Row(
          children: const [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.lightGreenAccent,
            ),
            Text('Your Order has been created'),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(powersoftdeimo);
      callApi();
// ignore: use_build_context_synchronously

      var orderCrt = orders.data;

      return orderCrt;
    } else {
      // ignore: use_build_context_synchronously
      throw showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(orderCheck['message'].toString()),
            );
          });
    }
  }

  /// FOR CREATING QOUTE ............

  Future<List<QuotesOrders>?> createQuote(quote) async {
    var quoteEncode = jsonEncode(quote);
    final response = await http.post(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            'https://powersoftrd.com/PEMApi/api/AddQuotes/741258?'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: quoteEncode);
    final Map<String, dynamic> quoteCheck = json.decode(response.body);

    if (quoteCheck['status'].toString() == "Success") {
      var quote = json.decode(response.body);
      var qty = QuotesOrder.fromJson(quote);
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Orders()));
      var powersoftdeimo = SnackBar(
        content: Row(
          children: const [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.lightGreenAccent,
            ),
            Text('Your Quote has been created'),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(powersoftdeimo);
      callApi();
      var qtyCrt = qty.data;

      return qtyCrt;
    } else {
      // ignore: use_build_context_synchronously
      throw showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(quoteCheck['message'].toString()),
            );
          });
    }
  }

  /// CREATES ORDER FOR CUSTOMER WITH AVAILIABLE CREDIT...........

  Future<List<Order>?> createAvailiableCrdOrder(order) async {
    var orderEncode = jsonEncode(order);

    final response = await http.post(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            'https://powersoftrd.com/PEMApi/api/AddOrders/741258?'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: orderEncode);

    final Map<String, dynamic> availiableOrderCheck =
        json.decode(response.body);

    if (availiableOrderCheck['status'].toString() == "Success") {
      // ignore: use_build_context_synchronously
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => const Orders()));
      var order = json.decode(response.body);

      var orders = CreateOrder.fromJson(order);

      var powersoftdeimo = SnackBar(
        content: Row(
          children: const [
            Icon(
              Icons.check_circle_rounded,
              color: Colors.lightGreenAccent,
            ),
            Text('Your Order has been created'),
          ],
        ),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5),
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(5),
      );

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(powersoftdeimo);
      callApi();
      var orderCrt = orders.data;

      return orderCrt;
    } else {
      // ignore: use_build_context_synchronously
      throw showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(availiableOrderCheck['message'].toString()),
            );
          });
    }
  }

  // // // Defining a function that creates a Data data as a future
  Future<Data?> createPaystackData(Map<String, dynamic> order) async {
    // Making an HTTP POST request to the specified URL
    SharedPreferences prefs = await SharedPreferences.getInstance();
    customerEmail = prefs.getString('customerEmail') ?? "";

    // token = prefs.getString('auth_token');

    final response = await http.post(Uri.parse(
            // ignore: prefer_interpolation_to_compose_strings
            'https://powersoftrd.com/PEMApi/api/PaymentInitialization/741258?email=$customerEmail&amount=$amountToPay'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(order));

    // Checking the response status code
    if (response.statusCode == 200) {
      // Printing the response status code and body

      // Decoding the JSON response
      final result = json.decode(response.body);

      // Creating a Data object from the JSON result
      var result2 = Payment.fromJson(result);
      // if (result2.data != null) {
      var paystack = result2.data;
      if (result2.data!.reference == null || result2.data!.reference == "") {
        createAvailiableCrdOrder(order).then(
          (value) => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Orders()),
          ),
        );
      }
      return paystack;
    } else {
      throw Exception('Payment not Successful.');
    }
  }
}
