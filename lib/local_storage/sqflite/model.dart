class Product {
  int? id;
  int newId;
  String name;
  String price;

  Product({this.id, required this.name, required this.price, required this.newId});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'newId': newId,
      'price': price,
    };
  }


  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      newId: map['newId'],
      price: map['price'],
    );
  }
}
