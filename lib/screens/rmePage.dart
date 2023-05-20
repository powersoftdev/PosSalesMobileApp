// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/screens/returnRequest.dart';

import '../Store/MyStore.dart';
import 'basketPage.dart';

class ReturnRMA extends StatefulWidget {
  const ReturnRMA({super.key});

  @override
  State<ReturnRMA> createState() => _ReturnRMAState();
}

class _ReturnRMAState extends State<ReturnRMA> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Center(
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(left: 25.0),
                child: Center(
                  child: Text(
                    'Return Request',
                    style: TextStyle(
                      fontSize: 20,
                    ),
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
        ),
        body: const TabBarView(
          children: [ReturnRequest()],
        ),
      ),
    );
  }
}
