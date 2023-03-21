// ignore: file_names
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, non_constant_identifier_names

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sales_order/Screens/dashboard.dart';
import 'package:sales_order/Screens/select_item.dart';
import 'package:sales_order/screens/profileScreen.dart';
import 'package:sales_order/screens/orderPopup.dart';
import 'package:sales_order/screens/rmePage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'basketPage.dart';
import 'checkout.dart';
import 'orders.dart';

// ignore: must_be_immutable
class OrderDetails extends StatefulWidget {
  String? orderNumber;
  dynamic total;
  dynamic orderDate;
  List? orderDetails;
  String? paymentMethodId;
  double? subtotal;
  double? taxAmount;
  double? discountAmount;

  OrderDetails({super.key, 
    this.orderNumber,
    this.total,
    this.orderDate,
    this.orderDetails,
    this.paymentMethodId,
    this.subtotal,
    this.taxAmount,
    this.discountAmount,
  });

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  var value = NumberFormat('#,##0.00');

  String customerName = "";
  dynamic customerAddress1;
  dynamic customerAddress2;
  dynamic customerAddress3;
  dynamic customerCity;
  dynamic customerState;
  dynamic customerCountry;
  dynamic customerPhone;

  late final SharedPreferences _prefs;

  @override
  void initState() {
    super.initState();
    getStringValuesSF();
  }

  getStringValuesSF() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      customerName = _prefs.getString('customerName') ?? "";
      customerAddress1 = _prefs.getString('customerAddress1') ?? "";
      customerAddress2 = _prefs.getString('customerAddress2') ?? "";
      customerAddress3 = _prefs.getString('customerAddress3') ?? "";
      customerCity = _prefs.getString('customerCity') ?? "";
      customerState = _prefs.getString('customerState') ?? "";
      customerCountry = _prefs.getString('customerCountry') ?? "";
      customerPhone = _prefs.getString('customerPhone') ?? "";
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('Order Details')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blue[500],
        selectedFontSize: 18,
        unselectedFontSize: 18,
        iconSize: 32,
        // currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Catlog',
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
            default:
          }
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SelectItemScreen()),
              );
              break;
            default:
          }

          switch (index) {
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const profileScreen()),
              );
              break;
            default:
          }
        },
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'OrderID ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '${widget.orderNumber}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Order date ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '${widget.orderDate}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 18,
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
                              hintText: 'Order Received',
                              hintStyle: TextStyle(
                                fontSize: 18,
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
                      height: 30,
                    ),
                    Container(
                      height: 60,
                      color: Colors.grey[100],
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text('Print Order Details'),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              InkWell(
                                child: Text(
                                  'View Status History',
                                  style: TextStyle(
                                    color: Colors.blue[300],
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                onTap: () {
                                  showModalBottomSheet<void>(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => SizedBox(
                                      height: 400,
                                      child: _popupOrderPopup(),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                             
                            ],
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Shipping details',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              "Name",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                customerName,
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textWidthBasis: TextWidthBasis.longestLine,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Phone ',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        "$customerPhone",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                              "Address",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                '$customerAddress1'
                                ','
                                ' '
                                '$customerAddress2'
                                ','
                                ' '
                                '$customerCity'
                                ','
                                ' '
                                '$customerState '
                                ','
                                ' '
                                '$customerCountry'
                                '.',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                                textWidthBasis: TextWidthBasis.longestLine,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Delivery Option',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListTile(
                      leading: Text(
                        'Items In your order',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: widget.orderDetails!.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Image.asset(
                                  'lib/images/newsp.jpg',
                                ),
                              ),
                              title: Text(
                                widget.orderDetails![index].itemId,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                widget.orderDetails![index].orderQty.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                '₦${value.format(widget.orderDetails?[index].total)}',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
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
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Payment method',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        '${widget.paymentMethodId}',
                        style: TextStyle(
                          fontSize: 18,
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
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.subtotal)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Tax',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.taxAmount)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.discountAmount)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Shipping Fee',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(000)}',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(widget.total)}',
                        style: TextStyle(
                          fontSize: 18,
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'Sales Mobile',
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
            ListTile(
              title: Text('DashBoard'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DashBoard()),
                );
              },
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              title: Text('Catlog'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SelectItemScreen()),
                );
              },
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const profileScreen()),
                );
              },
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              title: Text('Cart'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BasketPage()),
                );
              },
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              title: Text('Checkout'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Checkout()),
                );
              },
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              title: Text('Order Management'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Orders()),
                );
              },
            ),
            Divider(
              color: Colors.black54,
            ),
            ListTile(
              title: Text('Return Merchandise'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ReturnRMA()),
                );
              },
            ),
            Divider(
              color: Colors.black54,
            ),
          ],
        ),
      ),
    );
  }

  OrderPopup _popupOrderPopup() => OrderPopup();
}
