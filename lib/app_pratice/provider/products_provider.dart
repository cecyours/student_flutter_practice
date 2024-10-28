import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/app_pratice/product_model.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> products = [
    ProductModel(
        name: 'name',
        price: 10.19,
        imageUrl: 'assets/product.png',
        description: 'description',
        isFavourite: false),
    ProductModel(
        name: 'name2',
        price: 20.19,
        imageUrl: 'assets/product.png',
        description: 'description',
        isFavourite: false),
    ProductModel(
        name: 'name3',
        price: 30.19,
        imageUrl: 'assets/product.png',
        description: 'description',
        isFavourite: false),
    // ProductModel(
    //     name: 'name3',
    //     price: 19.19,
    //     imageUrl: 'imageUrl',
    //     description: 'description',
    //     isFavourite: false),
  ];

  List<Map<String, dynamic>> addedProducts = [];
      double shippingCharge=4.99;
  void addToCart({
    required ProductModel productModel,
    required int count,
  }) {
    Map<String, dynamic> addedProduct = {
      "itemcount": count,
      "product": productModel,
    };
    addedProducts.add(addedProduct);
    notifyListeners();
  }

  void incCount(int index) {
    addedProducts[index]['itemcount']++;
    print(addedProducts[index]['itemcount']);
    notifyListeners();
  }

  void decCount(int index) {
    if (addedProducts[index]['itemcount'] > 1) {
      addedProducts[index]['itemcount']--;
      notifyListeners();
    }
  }

  void removeItem(int index) {
    addedProducts.removeAt(index);
    notifyListeners();
  }

  double subTotal() {
    double total = 0;
    for (int i = 0; i < addedProducts.length; i++) {
      ProductModel productModel = addedProducts[i]['product'];
      int count = addedProducts[i]['itemcount'];
      total += (productModel.price * count);
    }

    print(total);
    return total;
  }

  double totalReduce() {

    return subTotal() - shippingCharge;
  }
}
