class Product2 {
  int? id;
  int newId;
  String name;
  String price;

  Product2(
      {this.id,
      required this.newId,
      required this.name,
      required this.price});

  factory Product2.fromJson({required Map<String, dynamic> json}) {
    return Product2(
        id: json['id'],
        newId: json['newId'],
        name: json['name'],
        price: json['price']);
  }

  Map<String, dynamic> toJson(){
   return {
     'id': id,
     'newId': newId,
     'name': name,
     'price': price
   };
  }
}
