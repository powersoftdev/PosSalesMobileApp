// ignore: file_names
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import '../Model/quote.dart';



Future<List<QuotesOrders>?> createQuote(quote) async {
  var quoteEncode = jsonEncode(quote);
  print(quoteEncode);
  final response = await http.post(Uri.parse(
          // ignore: prefer_interpolation_to_compose_strings
          'https://powersoftrd.com/PEMApi/api/AddQuotes/741258?'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: quoteEncode);

  if (response.statusCode == 200) {
    print('Response status: ${response.statusCode}');
    print('Response body: ${response. body}');
     

    Map<String, dynamic> quote = json.decode(response.body);
    var qty = QuotesOrder.fromJson(quote);

    var qtyCrt = qty.data;

    return qtyCrt;
  } else {
    throw Exception('Failed to create data for Data.');
  }
}
