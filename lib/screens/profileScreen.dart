// ignore_for_file: prefer_const_constructors, camel_case_types, must_call_super, avoid_unnecessary_containers, file_names
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sales_order/Screens/basketPage.dart';
import 'package:sales_order/Screens/dashboard.dart';
import 'package:sales_order/Screens/select_item.dart';
import 'package:sales_order/Store/MyStore.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/screens/login_screen.dart';
import 'package:sales_order/screens/passwordReset.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'orders.dart';
import 'rmePage.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final customerNamecontroller = TextEditingController();
  final customerIdcontroller = TextEditingController();
  final customerEmailcontroller = TextEditingController();
  final accountBalancecontroller = TextEditingController();
  final customerAddress1controller = TextEditingController();
  final customerAddress2controller = TextEditingController();
  final customerAddress3controller = TextEditingController();
  final customerCitycontroller = TextEditingController();
  final customerStatecontroller = TextEditingController();
  final customerCountrycontroller = TextEditingController();
  final customerPhonecontroller = TextEditingController();
  final customerTypeIdcontroller = TextEditingController();
  final availableCreditcontroller = TextEditingController();

  dynamic customerName;
  dynamic customerId;
  dynamic customerEmail;
  dynamic accountBalance = 0;
  dynamic availiableCredit = 0;
  dynamic customerAddress1;
  dynamic customerAddress2;
  dynamic customerAddress3;
  dynamic customerCity;
  dynamic customerState;
  dynamic customerCountry;
  dynamic customerPhone;
  dynamic customerTypeId;

  late final SharedPreferences prefs;

  @override
  void initState() {
    getStringValuesSF();
  }

  getStringValuesSF() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      customerName = prefs.getString('customerName') ?? "";
      customerId = prefs.getString('customerId') ?? "";
      customerEmail = prefs.getString('customerEmail') ?? "";
      accountBalance = prefs.getDouble('accountBalance') ?? 0;
      availiableCredit = prefs.getDouble('availiableCredit') ?? 0;
      customerAddress1 = prefs.getString('customerAddress1') ?? "";
      customerAddress2 = prefs.getString('customerAddress2') ?? "";
      customerAddress3 = prefs.getString('customerAddress3') ?? "";
      customerCity = prefs.getString('customerCity') ?? "";
      customerState = prefs.getString('customerState') ?? "";
      customerCountry = prefs.getString('customerCountry') ?? "";
      customerPhone = prefs.getString('customerPhone') ?? "";
      customerTypeId = prefs.getString('customerTypeId') ?? "";
    });
    return;
  }

  var value = NumberFormat('#,##0.00');

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 35.0),
          child: Center(
            child: Text('Profile'),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BasketPage()),
              );
            },
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blueGrey,
        currentIndex: 4,
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
        child: Column(
          children: [
            Container(
              child: Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.topLeft,
                children: [
                  Container(
                    height: 80,
                    color: Colors.blue[50],
                  ),
                  const Positioned(
                    left: 10,
                    bottom: -50,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 100,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 100),
              height: 90,
              child: Row(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.blue[300],
                      minimumSize: const Size(
                        140,
                        37,
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PasswordReset()),
                      );
                    },
                    child: Text('Change Password'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      backgroundColor: Colors.red,
                      fixedSize: const Size(
                        90,
                        30,
                      ),
                    ),
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                                child: CircularProgressIndicator());
                          });

                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen(),
                        ),
                        (Route route) => false,
                      );
                    },
                    child: Text('Sign Out'),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Customer ID',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: customerIdcontroller..text = '$customerId',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Customer Name',
                      // hintText: ' $customerName',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    readOnly: true,
                    controller: customerNamecontroller..text = '$customerName',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Customer Type',
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: customerTypeIdcontroller
                        ..text = '$customerTypeId'),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: null,
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Address',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: customerAddress1controller
                      ..text = '$customerAddress1'
                          ','
                          ' '
                          '$customerAddress2'
                          ','
                          ' '
                          '$customerAddress3'
                          '.'
                          ' '
                          '$customerCity'
                          ','
                          ' '
                          '$customerState'
                          ','
                          ' '
                          '$customerCountry'
                          '.',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: customerEmailcontroller
                      ..text = '$customerEmail',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    readOnly: true,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 20),
                      fillColor: Colors.white,
                      filled: true,
                      border: const OutlineInputBorder(),
                      labelText: 'Phone Number',
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(width: 2, color: Colors.blueAccent),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    controller: customerPhonecontroller
                      ..text = '$customerPhone',
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Account Balance',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: accountBalancecontroller
                        ..text = '₦${value.format(accountBalance! * -1)}'),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 20),
                        fillColor: Colors.white,
                        filled: true,
                        border: const OutlineInputBorder(),
                        labelText: 'Available Credit',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 2, color: Colors.blueAccent),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      controller: availableCreditcontroller
                        ..text = '₦${value.format(availiableCredit)}'),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 90,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
