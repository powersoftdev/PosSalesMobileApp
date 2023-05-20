// ignore_for_file: prefer_final_fields, prefer_is_empty, file_names

import 'package:flutter/material.dart';

import 'package:sales_order/Model/products.dart';

class MyStore extends ChangeNotifier {
  List<Product> _products = [];
  List<Product> _baskets = [];
  Product _activeProduct = Product();

  //create getter function
  List<Product> get products => _products;
  List<Product> get baskets => _baskets;
  Product? get activeProduct => _activeProduct;
  // Product? get allProduct => _allProduct;

  setActiveProduct(Product p) {
    _activeProduct = p;

    notifyListeners();
  }

  increaseItemQuantity(int? quantity, Product p) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());
      Product found = Product();
      if (foundItem.id != null) {
        found = _baskets.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        found.qty = found.qty == null ? 0 : quantity!;
        found.totalPrice = found.qty! * found.price!;
      } else {
        p.qty = p.qty == null ? 0 : quantity!;
        p.totalPrice = p.qty! * p.price!;
        _baskets.add(p);
      }
    } else {
      p.qty = p.qty == null ? 0 : quantity!;
      p.totalPrice = p.qty! * p.price!;
      _baskets.add(p);
    }
    notifyListeners();
  }

  assignDeliveryDate(DateTime preferedDate, Product p) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());
      Product found = Product();
      if (foundItem.id != null) {
        found = _baskets.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        found.shipDate = preferedDate;
      } else {
        p.shipDate = preferedDate;
        _baskets.add(p);
      }
    } else {
      p.shipDate = preferedDate;
      _baskets.add(p);
    }
    notifyListeners();
  }

  addOneItemToBasket(Product p) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());

      Product found = Product();

      if (foundItem.id != null) {
        found = _baskets.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        found.qty = found.qty == null ? 0 : found.qty! + 1;
        found.totalPrice = found.qty! * found.price!;

        int index = _baskets.indexWhere((b) => b.id == found.id);
        _baskets[index].qty = found.qty;
        _baskets[index].totalPrice = found.totalPrice;
        _baskets[index].shipDate = found.shipDate;
      } else {
        p.qty = 1;
        _baskets.add(p);
      }
    } else {
      p.qty = 1;
      _baskets.add(p);
    }

    notifyListeners();
  }

  removeOneItemFromBasket(Product p) {
    if (_baskets.length > 0) {
      var foundItem =
          _baskets.firstWhere((a) => a.id == p.id, orElse: () => Product());

      Product found = Product();

      if (foundItem.id != null) {
        found = _baskets.firstWhere((a) => a.id == p.id);
      }
      if (found.id != null) {
        if (found.qty! > 1 && found.id != null) {
          found.qty = found.qty! - 1;
          found.totalPrice = found.qty! * found.price!;

          int index = _baskets.indexWhere((b) => b.id == found.id);
          _baskets[index].qty = found.qty;
          _baskets[index].totalPrice = found.totalPrice;
        } else {
          _baskets.remove(p);
        }
      } else {
        _baskets.remove(p);
      }
    }
    notifyListeners();
  }

  getTotalAmount() {
    double subTotal = 0;
    dynamic itemTot = 0;
    for (int i = 0; i < _baskets.length; i++) {
      itemTot = _baskets[i].totalPrice!;

      subTotal += itemTot;
    }
    return subTotal;
  }

  getBasketQty() {
    double total = 0;
    for (int i = 0; i < baskets.length; i++) {
      total += baskets[i].qty!;
    }
    return total;
  }
}
