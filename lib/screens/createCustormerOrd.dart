import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'package:sales_order/Model/createOrder.dart';

// handleCheckout() async {
//   var responseFromCreate = await createOrder();
//   await getOrder(myOrderNum);
// }

Future<List<Order>?> createOrder(reference, Map<String, dynamic> order) async {
  var orderEncode = jsonEncode(order);
  print(orderEncode);
  print(reference);
  final response = await http.post(Uri.parse(
          // ignore: prefer_interpolation_to_compose_strings
          'https://powersoftrd.com/PEMApi/api/AddOrders/741258?reference=$reference'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: orderEncode);

  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response. body}');
     

    Map<String, dynamic> order = json.decode(response.body);
    var orders = CreateOrder.fromJson(order);

    var orderCrt = orders.data;

    return orderCrt;
  } else {
    throw Exception('Failed to create data for Data.');
  }
}
