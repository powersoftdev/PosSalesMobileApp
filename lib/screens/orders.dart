import 'package:flutter/material.dart';
import 'package:sales_order/Screens/basketPage.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, size: 25),
        ),
        title: const Center(
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(right: 35.0),
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
        ],
      ),
    );
  }
}
