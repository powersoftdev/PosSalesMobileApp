import 'package:flutter/rendering.dart';

class Product {
  String? id;
  String? name;
  double? price;
  dynamic qty;
  String? pic;
  double? totalPrice;
//construcctor
  Product(
      {this.id, this.name, this.price, this.qty, this.pic, this.totalPrice});
}
