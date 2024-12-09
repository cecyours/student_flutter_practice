import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/product_model.dart';


class CustomWidget extends StatelessWidget {
  double screenWidth;
  String namee;
  String description;
  double price;
  String imageUrl;
  ProductModel? productModel;

  CustomWidget(
      {super.key,
      required this.namee,
      required this.screenWidth,
      required this.imageUrl,
      required this.price,
      required this.description,
      this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      width: screenWidth,
      child: Column(
        children: [
          Text(namee),
          Text(description),
          Text(price.toString()),
          Text(imageUrl),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

