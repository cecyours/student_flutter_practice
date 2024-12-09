import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/product_model.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/widget.dart';


class ShowProduct extends StatefulWidget {
  const ShowProduct({super.key});

  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  List<ProductModel> products = [
    ProductModel(
        name: 'name',
        price: 19.19,
        imageUrl: 'imageUrl',
        description: 'description',
        isFavourite: false),
    ProductModel(
        name: 'name2',
        price: 19.19,
        imageUrl: 'imageUrl',
        description: 'description',
        isFavourite: false),
    ProductModel(
        name: 'name3',
        price: 19.19,
        imageUrl: 'imageUrl',
        description: 'description',
        isFavourite: false),
    ProductModel(
        name: 'name3',
        price: 19.19,
        imageUrl: 'imageUrl',
        description: 'description',
        isFavourite: false),
  ];
  late double screeHeight;
  late double screenWidth;

  @override
  Widget build(BuildContext context) {
    screeHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: screeHeight,
        width: screenWidth,
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print('clicked');
                      },
                      child: CustomWidget(
                        namee: products[index].name,
                        screenWidth: screenWidth,
                        imageUrl: products[index].imageUrl,
                        price: products[index].price,
                        description: 'descrption',
                      ));
                })
          ],
        ),
      ),
    );
  }
}
