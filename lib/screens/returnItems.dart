// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, must_be_immutable, body_might_complete_normally_nullable, sized_box_for_whitespace, prefer_is_empty, unused_local_variable, file_names, use_key_in_widget_constructors, duplicate_ignore

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:sales_order/Model/addRMA.dart';
import 'package:sales_order/Model/custormerorder.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/products.dart';
import 'dashboard.dart';
import 'orders.dart';
import 'profileScreen.dart';
import 'rmePage.dart';
import 'select_item.dart';

class ReturnItems extends StatefulWidget {
  // List? orderDetails;
  Datum? orderData;

  ReturnItems({this.orderData});

  @override
  State<ReturnItems> createState() => _ReturnItemsState();
}

class _ReturnItemsState extends State<ReturnItems> {
  final GlobalKey<FormState> formkeyRma = GlobalKey<FormState>();
  final GlobalKey<FormState> reasonformKey = GlobalKey<FormState>();

  // final _qtyCtrl = TextEditingController();
  final reasoncontroller = TextEditingController();

  String reason = '';

  var value = NumberFormat('#,##0.00');
  final List<Product> _itemsToReturn = [];

  @override
  void initState() {
    // _itemsToReturn.addAll(widget.orderData!.orderDetail ?? []);

    for (var item in (widget.orderData!.orderDetail ?? [])) {
      var orderProd = Product(
        id: item.itemId,
        name: item.itemId,
        qty: item.orderQty,
        price: item.itemUnitPrice,
        totalPrice: item.total,
      );

      _itemsToReturn.add(orderProd);
    }

    super.initState();
  }

  String? token;
  String? invoiceNumber;
  DateTime? invoiceDate;
  dynamic customerId;
  String? headerMemo4 = '';
  String? itemId;
  dynamic orderQty;
  dynamic invoiceLineNumber;
  dynamic orderNumber;

  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    customerId = prefs.getString('customerId');
  }

  List<RmaDetail> populateRMADetails(List<Product> itemsToReturn) {
    List<RmaDetail> rmaDetails = [];

    for (Product item in itemsToReturn) {
      RmaDetail rmaDetail = RmaDetail();

      rmaDetail.itemId = item.id;
      rmaDetail.orderQty = item.qty;
      rmaDetail.invoiceLineNumber = 0;
      rmaDetail.itemUnitPrice = item.price;

      rmaDetails.add(rmaDetail);
    }

    return rmaDetails;
  }

  //   //1.loop through list of products
  //   //2. set each product value, qt, id etc to the single rmaDetail object
  //   //3. add the single rma detail object to the rmaDetails list object
  //   //4. return rmaDetails
  // }

  void addRmaApi() async {
    await getToken();

    AddRma rmaModel = AddRma();

    String invoiceNumber = widget.orderData!.invoiceNumber;

    rmaModel.orderNumber = widget.orderData!.invoiceNumber;
    rmaModel.invoiceDate = widget.orderData!.invoiceDate;
    rmaModel.customerId = customerId;
    rmaModel.headerMemo4 = reason;
    rmaModel.rmaDetail = populateRMADetails(_itemsToReturn);

    var rrr = jsonEncode(rmaModel);

    http.Response response = await http.post(
        Uri.parse('https://powersoftrd.com/PEMAPI/api/AddRMA/741258'),
        body: jsonEncode(rmaModel),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => ReturnRMA()));
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('RMA Unsuccessful'),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(
          child: const Text('Return Items'),
        ),
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
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        padding: EdgeInsets.only(
          top: 0,
          right: 0,
          left: 0,
          bottom: MediaQuery.of(context).viewInsets.bottom + 10,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 10,
                ),
                child: Text('Select Items to Return',
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _itemsToReturn.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: Image.asset(
                                'lib/images/newsp.jpg',
                                width: 30,
                                height: 70,
                                fit: BoxFit.contain,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                '${_itemsToReturn[index].id}',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  _itemsToReturn.removeAt(index);
                                });
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        ),
                        Container(
                          height: 70,
                          padding: EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  removeOneitemsToReturn(_itemsToReturn[index]);
                                  setState(() {
                                    _itemsToReturn[index];
                                  });
                                },
                                icon: Icon(Icons.remove),
                                iconSize: 32,
                                color: Colors.redAccent,
                              ),
                              SizedBox(width: 10),
                              Container(
                                height: 20,
                                width: 60,
                                child: TextFormField(
                                  controller: TextEditingController()
                                    ..text =
                                        _itemsToReturn[index].qty.toString(),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  addOneitemsToReturn(_itemsToReturn[index]);
                                  setState(() {
                                    _itemsToReturn[index];
                                  });
                                },
                                icon: Icon(Icons.add),
                                iconSize: 30,
                                color: Colors.greenAccent,
                              ),
                              // ignore: avoid_unnecessary_containers
                              Container(
                                child: Text(
                                  ('₦${value.format(_itemsToReturn[index].totalPrice)}'),
                                  style: TextStyle(
                                    fontSize: 16,
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
              SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: Text(
                  '₦${value.format(getTotalAmount())}',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Form(
                    key: formkeyRma,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Reason:',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: TextFormField(
                            key: reasonformKey,
                            controller: reasoncontroller,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            autofocus: false,
                            keyboardType: TextInputType.multiline,
                            maxLines: 5,
                            readOnly: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 20),
                              fillColor: Colors.white,
                              filled: true,
                              border: const OutlineInputBorder(),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 2, color: Colors.blueAccent),
                              ),
                            ),
                            onChanged: (value) {
                              reason = value;
                            },
                            validator: MultiValidator(
                              [
                                RequiredValidator(errorText: 'Required'),
                                MaxLengthValidator(50,
                                    errorText: 'Not more than 50 Characters'),
                                MinLengthValidator(3,
                                    errorText:
                                        'Should be at least 3 Characters')
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.blue[300],
                      fixedSize: const Size(
                        300,
                        45,
                      )),
                  onPressed: () {
                    if (_itemsToReturn.length == 0) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('No Items to return'),
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
                    } else if (formkeyRma.currentState!.validate()) {
                      addRmaApi();
                    }
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.redAccent,
                      fixedSize: const Size(
                        300,
                        45,
                      )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Orders()));
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }

  addOneitemsToReturn(Product p) {
    if (_itemsToReturn.isNotEmpty) {
      var foundItem = _itemsToReturn.firstWhere((a) => a.id == p.id,
          orElse: () => Product());

      Product found = Product();

      if (foundItem.id != null) {
        found = _itemsToReturn.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        var orderDetails = widget.orderData!.orderDetail ?? [];
        int widgetIndex = orderDetails.indexWhere((b) => b.itemId == found.id);
        if (widgetIndex < 0) {
          return;
        }
        if (found.qty! >= (orderDetails[widgetIndex].orderQty ?? 0)) {
          return;
        }

        found.qty = found.qty == null ? 0 : found.qty! + 1;
        found.totalPrice = found.qty! * found.price!;

        // ignore: unused_local_variable
        int index = _itemsToReturn.indexWhere((b) => b.id == found.id);
        // this.setState(() {
        //   _itemsToReturn[index].qty = found.qty;
        //   _itemsToReturn[index].totalPrice = found.totalPrice;
        // });
      } else {
        p.qty = 1;
        _itemsToReturn.add(p);
      }
    } else {
      p.qty = 1;
      _itemsToReturn.add(p);
    }
  }

  removeOneitemsToReturn(Product p) {
    if (_itemsToReturn.length > 0) {
      var foundItem = _itemsToReturn.firstWhere((a) => a.id == p.id,
          orElse: () => Product());

      Product found = Product();

      if (foundItem.id != null) {
        found = _itemsToReturn.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        if (found.qty! > 1 && found.id != null) {
          found.qty = found.qty! - 1;
          found.totalPrice = found.qty! * found.price!;

          int index = _itemsToReturn.indexWhere((b) => b.id == found.id);
          // setState(() {
          //   _itemsToReturn[index].qty = found.qty;
          //   _itemsToReturn[index].totalPrice = found.totalPrice;
          // });
        } else {
          _itemsToReturn.remove(p);
        }
      } else {
        _itemsToReturn.remove(p);
      }
    }
  }

  getTotalAmount() {
    double subTotal = 0;
    double itemTot = 0;
    for (int i = 0; i < _itemsToReturn.length; i++) {
      itemTot = _itemsToReturn[i].totalPrice!;

      subTotal += itemTot;
    }
    return subTotal;
  }
}
