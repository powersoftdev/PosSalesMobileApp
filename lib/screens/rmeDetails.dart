// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'dashboard.dart';
import 'orders.dart';
import 'profileScreen.dart';
import 'rmePage.dart';
import 'select_item.dart';

class RmeDetail extends StatefulWidget {
  final String? invoiceNumber;
  final String? orderNumber;
  final DateTime? invoiceDate;

  const RmeDetail(
      {this.invoiceNumber,
      this.orderNumber,
      this.invoiceDate,
      super.key,
      required String quote});

  @override
  State<RmeDetail> createState() => _RmeDetailState();
}

class _RmeDetailState extends State<RmeDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Center(child: Text('Return Merchandise')),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blue[500],
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
        physics: const ScrollPhysics(),
        child: SafeArea(
          child: Column(
            children: [
              const ListTile(
                leading: Text(
                  'General info',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Text(
                  'RMA ID:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Text(
                  '${widget.invoiceNumber}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Text(
                  'RMA Date:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    '${widget.invoiceDate}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const ListTile(
                leading: Text(
                  'Original Order ID:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                // trailing: Text(
                //   '${widget.orderNumber}',
                //   style: const TextStyle(
                //     fontSize: 16,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
              ListTile(
                leading: const Text(
                  'Original Order ID:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                trailing: Text(
                  '${widget.orderNumber}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
