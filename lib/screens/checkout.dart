import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Constant/pubkey.dart';

import 'package:sales_order/Store/MyStore.dart';
import 'package:sales_order/screens/paymentclass.dart';
import 'package:sales_order/screens/size_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Payment/paystackpayment.dart';
import 'dashboard.dart';
import 'paystackwebview.dart';
import 'select_item.dart';

enum PaymentOption { payOffline, payOnline }

enum AddressInfo { location }

// Initial Selected Value
String? dropdownvalue;
String? addressvalue;

// List of items in our dropdown menu
var items = ['Door', 'Walk-In'];

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
Future<void> showInformationDialog(BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          //  SizeConfig().init(context);
          return Center(
            child: AlertDialog(
              title: const Text('Address Information'),
              scrollable: true,
              content: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      // mainAxisSize: MainAxisSize.max,

                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'First Name',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.account_box),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field First Name';
                            },
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Last Name',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.account_box),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Last Name';
                            },
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Country/Region',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.flag),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Country/Region';
                            },
                            keyboardType: TextInputType.name,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Address',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.location_city_outlined),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Address';
                            },
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'City',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.location_city_sharp),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field City';
                            },
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'State',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.satellite_alt_outlined),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field State';
                            },
                            keyboardType: TextInputType.streetAddress,
                            inputFormatters: [
                              FilteringTextInputFormatter.singleLineFormatter,
                            ],
                          ),
                        ),
                        TextFormField(
                          autofocus: false,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Postal Code',
                            prefixIcon: Padding(
                              padding: EdgeInsets.only(top: 0),
                              child: Icon(Icons.add_call),
                            ),
                          ),
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : 'Invalid field Postal Code';
                          },
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: TextFormField(
                            autofocus: false,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Phone (optional)',
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(top: 0),
                                child: Icon(Icons.add_call),
                              ),
                            ),
                            validator: (value) {
                              return value!.isNotEmpty
                                  ? null
                                  : 'Invalid field Phone';
                            },
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Navigator.of(context).pop();
                    }
                  },
                  child: const Text(
                    'Save Address',
                    style: TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Checkout(),
                      ),
                    );
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20, color: Colors.red),
                  ),
                ),
              ],
            ),
          );
        });
      });
}

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

getTotal() {
  int total = 0;
  total = getSubtotal() + getShippingCost() - getdiscount() + getTax();
  return total;
}

getAmountToPay() {
  int amountToPay = 0;
  amountToPay = getTotal() - getAvailiableCrd();
  return amountToPay;
}

getAvailiableCrd() {
  int availiableCrd = 0;
  return availiableCrd;
}

getShippingCost() {
  int shippingCost = 0;
  return shippingCost;
}

getdiscount() {
  int discount = 0;
  return discount;
}

getTax() {
  int tax = 0;
  return tax;
}

getSubtotal() {
  int subtotal = 0;
  return subtotal;
}

class _CheckoutState extends State<Checkout> {
  PaymentOption _value = PaymentOption.payOffline;
  AddressInfo _values = AddressInfo.location;

  String customerAddress1 = "";
  String customerAddress2 = "";
  String customerEmail = "";
  int accountBalance = 0;
  final emailcontroller = TextEditingController();

  late final SharedPreferences _prefs;

  @override
  void initState() {
    getStringValuesAddress();
    super.initState();
  }

  getStringValuesAddress() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      customerAddress1 = _prefs.getString('customerAddress1') ?? "";
      customerAddress2 = _prefs.getString('customerAddress2') ?? "";
      customerEmail = _prefs.getString('customerEmail') ?? "";
      accountBalance = _prefs.getInt('accountBalance') ?? 0;
      
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    var payment = Provider.of<PaymentsData>(context);
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DashBoard(),
                  ),
                );
              },
              icon: const Icon(Icons.arrow_back, size: 25),
            ),
            title: const Center(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 35.0),
                  child: Text(
                    'Checkout',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
                        width: getProportionateScreenWidth(350),
                        height: getProportionateScreenHeight(330),
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
                                controller: emailcontroller
                                  ..text = customerEmail,
                                readOnly: true,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 290, top: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text('Ship to'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 140.0),
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
                            //  Padding(
                            //   padding: const EdgeInsets.only(left:9.0),
                            //   child: Text ('My Address ,$customerAddress1',
                            //   style: const TextStyle(
                            //   fontSize: 18,
                            //   ),
                            //   ),
                            // ),

                            GestureDetector(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.add,
                                      size: 27,
                                      color: Colors.blue,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: GestureDetector(
                                        onTap: () async {
                                          await showInformationDialog(context);
                                        },
                                        child: const Text(
                                          'Use a diffrent address',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              onTap: () async {
                                await showInformationDialog(context);
                              },
                            ),
                            const Divider(
                              color: Colors.grey,
                              thickness: 1,
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
                    SizedBox(
                      height: getProportionateScreenHeight(15),
                    ),
                    Center(
                      child: Container(
                        width: getProportionateScreenWidth(355),
                        height: getProportionateScreenHeight(540),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                     Text('₦ ${store.getTotalAmount().toString()}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                       Text(
                                        'Shipping Cost:',
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
                                     Text('₦ ${getShippingCost()}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                       Text(
                                        'Discount:',
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
                                     Text('₦ ${getdiscount()}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                     Text('₦ ${getTax()}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                     Text('₦${store.getTotalAmount() + getTotal()}',
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                       Text(
                                        'Availiable Credit:',
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
                                    // ignore: prefer_const_literals_to_create_immutables
                                    children: [
                                     Text( accountBalance.toString(),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                       Text(
                                        'Amount To Pay:',
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
                                     Text('₦${getTotal() + getAvailiableCrd()}',
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
                                const Text(
                                  'Choose Payment Method',
                                  style: TextStyle(fontSize: 20),
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
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(
                          20.0,
                        ),
                        child: AnimatedButton(
                          height: getProportionateScreenHeight(46),
                          width: getProportionateScreenWidth(136),
                          text: 'Confirm',
                          animationDuration: const Duration(seconds: 2),
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                          onPress: () {
                            if (PaymentOption.payOffline == _value) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WebViewPayment(),
                                ),
                              );
                              payment.getPostData();
                            } else {
                              // MakePayment(
                              //         ctx: context,
                              //         email: email,
                              //         amount: amount,
                              //         accessCode: accessCode)
                              //     .chargeCardAndMakePayment();
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const DashBoard(),
                              //   ),
                              // );
                            }
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
        ),
      ),
    );
  }
}
