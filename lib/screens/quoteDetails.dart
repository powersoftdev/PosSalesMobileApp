// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'orderDetails.dart';
import 'profileScreen.dart';
import 'quotePopup.dart';
import 'select_item.dart';

// ignore: must_be_immutable
class QuoteDetails extends StatelessWidget {
  String? orderNumber = '';
  dynamic total = '';
  dynamic orderDate;

  QuoteDetails({super.key, this.orderNumber, this.orderDate, this.total});

  var value = NumberFormat('#,##0.00');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Center(child: Text('Quote Details')),
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
            label: 'View Catlog',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_outlined),
            label: 'Order',
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

          switch (index) {
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrderDetails()),
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
                        'Quote ID',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '12345',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Quote date',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '12/3/2023',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Status',
                        style: TextStyle(
                          fontSize: 20,
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
                              hintText: 'Quote Received',
                              hintStyle: TextStyle(
                                fontSize: 19,
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
                      color: Colors.grey[200],
                      child: ListTile(
                        leading: Icon(
                          Icons.print,
                          size: 34,
                        ),
                        title: Text(
                          'Print order details ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      trailing: InkWell(
                        child: Text(
                          'View Status History',
                          style: TextStyle(
                            color: Colors.blue[300],
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onTap: () {
                          showModalBottomSheet<void>(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) => SizedBox(
                              height: 400,
                              child: _popupQuotePopup(),
                            ),
                          );
                        },
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
                    ListTile(
                      leading: Text(
                        'Name',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        'Power Soft',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      leading: Text(
                        'Phone',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '08012345678',
                        style: TextStyle(
                          fontSize: 20,
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
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Ikeja Lagos.',
                                style: TextStyle(
                                  fontSize: 20,
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
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        'Pick up',
                        style: TextStyle(
                          fontSize: 20,
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
                        itemCount: 3,
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
                                'Product Name',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                'Qty: ',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              trailing: Text(
                                '₦${value.format(4500)}',
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
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        'Pay Online',
                        style: TextStyle(
                          fontSize: 20,
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
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(55000)}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Tax',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(000)}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Discount',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(000)}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Shipping Fee',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(000)}',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.only(left: 30, right: 30),
                      leading: Text(
                        'Total',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      trailing: Text(
                        '₦${value.format(55000)}',
                        style: TextStyle(
                          fontSize: 20,
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

  QuotePopup _popupQuotePopup() => QuotePopup();
}
