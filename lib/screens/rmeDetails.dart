import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dashboard.dart';
import 'profileScreen.dart';
import 'select_item.dart';

class RmeDetail extends StatefulWidget {

 final String? invoiceNumber;
  final String? orderNumber;
   final DateTime? invoiceDate;

   const RmeDetail({this.invoiceNumber, this.orderNumber, this.invoiceDate,super.key});

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
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  '${widget.invoiceNumber}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                leading: const Text(
                  'RMA Date:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Padding(
                  padding: const EdgeInsets.only(left: 18.0),
                  child: Text(
                    '${widget.invoiceDate}',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
               const ListTile(
                leading: Text(
                  'Original Order ID:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                // trailing: Text(
                //   '${widget.orderNumber}',
                //   style: const TextStyle(
                //     fontSize: 18,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
              ),
               ListTile(
                leading: const Text(
                  'Original Order ID:',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
                trailing: Text(
                  '${widget.orderNumber}',
                  style: const TextStyle(
                    fontSize: 18,
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