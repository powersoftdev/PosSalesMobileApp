// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Model/addOrder.dart';
import 'package:sales_order/Screens/basketPage.dart';
import 'package:sales_order/screens/rmePage.dart';
import '../Model/addQuote.dart';
import '../Store/MyStore.dart';
import 'checkout.dart';
import 'dashboard.dart';
import 'order_listing.dart';
import 'profileScreen.dart';
import 'quote_listing.dart';
import 'select_item.dart';

class Orders extends StatefulWidget {
  final Order? orderCrt;
  const Orders({super.key, this.orderCrt});

  @override
  State<Orders> createState() => _OrdersState();
}

late final String? orderNumber;

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 35.0),
                child: Text(
                  'Order Management',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
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
          bottom: const TabBar(tabs: [
            Tab(text: 'Orders'),
            Tab(text: 'Quotes'),
          ]),
        ),
        body: TabBarView(
          children: [
            Orderdetails(
              orderCrt: Order(),
            ),
            const Quotes(qtyCrt: <QuotesOrders>[]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blue[500],
          unselectedItemColor: Colors.blueGrey,
          currentIndex: 2,
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
      ),
    );
  }
}
