// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unnecessary_new, prefer_typing_uninitialized_variables, body_might_complete_normally_nullable, use_build_context_synchronously

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sales_order/Model/products.dart';

import 'package:sales_order/Screens/ProductDetailPage.dart';
import 'package:http/http.dart' as http;
import 'package:sales_order/screens/profileScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Store/MyStore.dart';
import '../Screens/dashboard.dart';
import '../Model/item.dart';
// import 'orders.dart';
// import 'rmePage.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:printing/printing.dart';

class SelectItemScreen extends StatefulWidget {
  const SelectItemScreen({super.key});

  @override
  State<SelectItemScreen> createState() => _SelectItemScreenState();


}



class _SelectItemScreenState extends State<SelectItemScreen> {
  // ignore: prefer_final_fields
  TextEditingController txtQuery = new TextEditingController();

  var itemId;
  late double minimumQty;
  late String itemName;
  late double price;
  late String pictureurl;
  late String itemFamilyId;
  String? token;
  dynamic customerId;
  dynamic total = 0;

  late final SharedPreferences prefs;

  getStringValuesAddress() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      customerId = prefs.getString('customerId');
      total = prefs.getDouble('total');
      token = prefs.getString('token');
    });
    return;
  }

  var value = NumberFormat('#,##0.00');

  Future<List<Datum>?> productListAPIResult =
      Future.value(List<Datum>.from([Datum()]));

  @override
  void initState() {
    productListAPIResult = callApi();
    super.initState();
  }


  Future<String?> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    customerId = prefs.getString('customerId') ?? "";
  }

  Future<List<Datum>?> callApi() async {
    await getToken();
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/GetSalesItemsByCustomerId/741258?CustomerId=$customerId'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      // final itemModels = result["data"];
      var itemModel = ItemModel.fromJson(result);
      return itemModel.data;
      // return ItemModels.map((e) => ItemModelFromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    //register for thr listener to listen for any notifications
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 35),
            child: Text('Catalog'),
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            padding: EdgeInsets.only(left: 25),
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue[50],
            ),
            child: TextField(
              onSubmitted: ((value) async {
                var myTemp = await SearchApi(value);
                productListAPIResult = Future.value(myTemp);
                setState(() {
                  productListAPIResult;
                });
              }),
              controller: txtQuery,
              decoration: InputDecoration(
                border: InputBorder.none,
                // contentPadding: EdgeInsets.all(5),
                hintText: 'Search Items',
                icon: Icon(
                  Icons.search,
                  size: 32,
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    txtQuery.clear();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SelectItemScreen()));
                    // search(txtQuery.text);
                  },
                ),
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 200),
            child: Text(
              'Total: ₦ ${value.format(store.getTotalAmount())}',
              style: TextStyle(fontSize: 40),
            ),
          ),
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {},
            iconSize: 50,
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
        currentIndex: 1,
        selectedItemColor: Colors.blue[500],
        unselectedItemColor: Colors.blueGrey,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        iconSize: 23,
        // currentIndex: 1,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.local_offer_outlined),
          //   label: 'Catalog',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.description),
          //   label: 'Order',
          // ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.swap_horizontal_circle_outlined),
          //   label: "Return",
          // ),
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
          // switch (index) {
          //   case 1:
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(
          //           builder: (context) => const SelectItemScreen()),
          //     );
          //     break;
          // }
          // switch (index) {
          //   case 2:
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const Orders()),
          //     );
          //     break;
          // }
          // switch (index) {
          //   case 3:
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => const ReturnRMA()),
          //     );
          //     break;
          // }
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
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.blue[200],
            child: FutureBuilder<List<Datum>?>(
              future: productListAPIResult,
              builder: (context, snapshot) {
                var data = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              'lib/images/cart.jpg',
                            ),
                          ),
                          title: Text(data[index].itemName.toString()),
                          subtitle: Text(data[index].itemFamilyId.toString()),
                          trailing: Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: Text('₦ ${data[index].price.toString()}'),
                          ),
                          onTap: () {
                            // set the item as the activeProduct
                            store.setActiveProduct(
                              Product(
                                  id: data[index].itemId,
                                  name: data[index].itemName,
                                  price: data[index].price,
                                  qty: _getQty(data[index].itemId, store)
                                      .toInt(),
                                  // qty: store.activeProduct!.qty ?? 1,
                                  totalPrice: 0),
                            );
                            //move to productDetail page
                            showModalBottomSheet<void>(
                              context: context,
                              isScrollControlled: true,
                              // ignore: sized_box_for_whitespace
                              builder: (context) => Container(
                                height: 450,
                                child: _popupProductDetails(),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 2,
            color: Colors.blue[100],
            child: ListView.builder(
              itemCount: store.baskets.length,
              itemBuilder: (context, i) {
                var shippingDate = store.baskets[i].shipDate ?? DateTime.now();
                // ignore: unused_local_variable
                var formattedDate =
                    DateFormat('yyy-MM-dd').format(shippingDate);
                return Card(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.asset(
                              'lib/images/cart.jpg',
                              width: 60,
                              height: 40,
                              fit: BoxFit.contain,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(
                              store.baskets[i].name!,
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(
                                () {
                                  store.baskets.removeAt(i);
                                },
                              );
                            },
                            icon: Icon(Icons.close),
                          ),
                        ],
                      ),
                      // ignore: sized_box_for_whitespace
                      Container(
                        height: 30,
                        child: Text(
                            "Shipping Date :  ${formattedDate = DateFormat('yyy-MM-dd').format(shippingDate)}"),
                      ),
                      Container(
                        height: 30,
                        padding: EdgeInsets.only(left: 40),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                store.removeOneItemFromBasket(store.baskets[i]);
                              },
                              icon: Icon(Icons.remove),
                              iconSize: 30,
                              color: Colors.redAccent,
                            ),
                            SizedBox(width: 10),
                            // ignore: sized_box_for_whitespace
                            Container(
                              height: 20,
                              width: 50,
                              child: TextFormField(
                                controller: TextEditingController()
                                  ..text = store.baskets[i].qty.toString()
                                  ..selection = TextSelection.collapsed(
                                      offset: store.baskets[i].qty
                                          .toString()
                                          .length),
                                onChanged: (text) {
                                  store.increaseItemQuantity(
                                      (int.tryParse(text) ?? 0),
                                      store.baskets[i]);
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),

                            IconButton(
                              onPressed: () {
                                store.addOneItemToBasket(store.baskets[i]);
                              },
                              icon: Icon(Icons.add),
                              iconSize: 30,
                              color: Colors.greenAccent,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: Text(
                                ('₦${value.format(store.baskets[i].totalPrice)}'),
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  ProductDetailpage _popupProductDetails() => ProductDetailpage();
  num _getQty(dynamic itemId, MyStore store) {
    var baskets = store.baskets;
    if (store.baskets.isNotEmpty) {
      var product =
          baskets.firstWhere((a) => a.id == itemId, orElse: () => Product());
      if (product.qty != null) {
        return product.qty!; // return current product qty if it exists.
      }
      return 0; // if basket is not empty but product not found, return 0
    }

    return 0; // if basket is empty return 0
  }

  Future<List<Datum>?> SearchApi(String searchParam) async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });
    final response = await http.get(
        Uri.parse(
            'https://powersoftrd.com/PEMAPI/api/GetInventoryItemByName/741258?itemName=$searchParam'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        });
    Navigator.of(context).pop();

    if (response.statusCode == 200) {
      final result = json.decode(response.body);
      // final itemModels = result["data"];
      var itemModel = ItemModel.fromJson(result);
      return itemModel.data;
      // return ItemModels.map((e) => ItemModelFromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
