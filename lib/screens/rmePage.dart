import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sales_order/screens/returnRequest.dart';

import 'basketPage.dart';

class ReturnRMA extends StatefulWidget {
  const ReturnRMA({super.key});

  @override
  State<ReturnRMA> createState() => _ReturnRMAState();
}

class _ReturnRMAState extends State<ReturnRMA> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
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
                padding: EdgeInsets.only(right: 20.0),
                child: Text(
                  'Return Requests',
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
          bottom: const TabBar(tabs: [
            Tab(text: 'Return Requests'),
          
          ]),
        ),
        body: 
          const TabBarView(
            children: [
             ReturnRequest()
            ],
          ),
        ),
      
    );
  }
}