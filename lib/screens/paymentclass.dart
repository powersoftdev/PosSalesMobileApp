import 'package:flutter/material.dart';

import '../Model/paystackdata.dart';
import 'paymentcheckout.dart';


class PaymentsData extends ChangeNotifier {
 // Data post = Data();
  Payment? post;
  bool loading = false;

  getPostData() async {
    loading = true;
    post = await getApiPostData();
    loading = false;

    notifyListeners();
  }
 
}
