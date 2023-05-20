class Product {
  String? id;
  String? name;
  double? price;
  int? qty;
  String? pic;
  dynamic totalPrice;
  DateTime? shipDate;
//constructor
  Product(
      {this.id, this.name, this.price, this.qty, this.pic, this.totalPrice, this.shipDate});
}
