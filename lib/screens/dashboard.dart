import 'package:flutter/material.dart';
import 'package:sales_order/screens/orders.dart';
import 'package:sales_order/screens/profileScreen.dart';
import '../../Screens/login_screen.dart';
import '../../Screens/select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  String customerName = "";
  late final SharedPreferences _prefs;

  @override
  void initState() {
    getStringValuesSF();
    super.initState();
  }

  getStringValuesSF() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      customerName = _prefs.getString('customerName') ?? "";
    });
    return customerName;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('DashBoard')),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                  top: 15,
                  left: 15,
                  right: 15,
                ),
                child: Text(
                  'Welcome ,$customerName',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Text(
                  'Sales Bookings',
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.blue[900],
                  ),
                ),
              ),
              Stack(children: [
                
                   Container(
                    height: 350,
                    //  width: 100,
                    decoration: BoxDecoration(
                      color: Colors.blue[700],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(100),
                        topRight: Radius.circular(100),
                        bottomLeft: Radius.circular(0),
                        bottomRight: Radius.circular(0),
                      ),
                    ),
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 20, bottom: 300),
                    //margin: const EdgeInsets.only(top: 80),
                    child: const Center(
                      child: Text(
                        'What would you like to do?',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 20, bottom: 400),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SelectItemScreen(),
                          ),
                        );
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 70,
                        child: Icon(
                          Icons.local_offer_outlined,
                          size: 60,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(children: [
                  const Padding(
                    padding: EdgeInsets.only(right: 210, bottom: 400),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const profileScreen(),
                        ),
                      );
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 70,
                      child: Icon(
                        Icons.account_circle_sharp,
                        size: 60,
                      ),
                    ),
                  ),
                ]),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 300, left: 25, right: 200),
                    child: Text(
                      "View Catlog",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 300, left: 225, right: 20),
                    child: Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
                MaterialPageRoute(builder: (context) => const LoginScreen()),
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
                MaterialPageRoute(
                    builder: (context) => const profileScreen()),
              );
              break;
          }
          switch (index) {
            case 3:
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Orders()));
              break;
            default:
          }
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
