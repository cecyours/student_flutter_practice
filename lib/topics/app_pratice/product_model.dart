class ProductModel {
  String imageUrl;
  String name;
  String description;
  double price;
  bool isFavourite;

  ProductModel(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.description,
      required this.isFavourite});
}

class AddedProductModel {
  String imageUrl;
  String name;
  String description;
  double price;
  bool isFavourite;

  AddedProductModel(
      {required this.name,
      required this.price,
      required this.imageUrl,
      required this.description,
      required this.isFavourite});
}
