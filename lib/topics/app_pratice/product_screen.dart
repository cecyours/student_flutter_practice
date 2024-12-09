import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/product_widget.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/provider/products_provider.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatefulWidget {
  @override
  _ProductScreen createState() => _ProductScreen();
}

class _ProductScreen extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductProvider>(
      builder: (BuildContext context, ProductProvider provider, Widget? child) {
        return Scaffold(
          body: Material(
            color: Color(0xfff1f1f1),
            child: Column(
              children: [
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Icon(Icons.arrow_back_ios),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 85),
                      child: Text(
                        "Search Product",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 70,
                    ),
                    Container(
                      /**/
                      child: Image.asset(
                        "assets/pfp.jpg",
                        height: 50,
                      ),
                    ),
                    Container(
                      height: 100,
                    ),
                  ],
                ),
                Container(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.transparent),
                          height: 60,
                          width: 270,
                          // color: Colors.white60,
                          child: Row(
                            children: [
                              Container(
                                width: 20,
                              ),
                              Container(
                                child: Icon(Icons.search),
                              ),
                              Container(
                                width: 15,
                              ),
                              Container(
                                padding: EdgeInsets.only(),
                                child: Text(
                                  "Cleansers",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.filter),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: GridView.builder(

                      itemCount: provider.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 10.0,
                          childAspectRatio: 0.65
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return ProductWidget(productModel: provider.products[index], );
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
