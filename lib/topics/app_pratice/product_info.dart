import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/product_model.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/provider/products_provider.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/screen_end.dart';
import 'package:provider/provider.dart';

class ProductInfo extends StatefulWidget {
  ProductInfo({super.key, required this.productModel});

  ProductModel productModel;

  @override
  State<ProductInfo> createState() => _ProductInfoState();
}

class _ProductInfoState extends State<ProductInfo> {
int count = 1;

  late double ScreenWidth;
  late double ScreenHeight;

  void incCount() {
    setState(() {
      count++;
    });
  }

  void decCount() {
    setState(() {
      // if(count==1){
      //    count = count + 1;
      // }
      if (count > 1) {
        count--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenWidth = MediaQuery
        .of(context)
        .size
        .width;
    ScreenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Material(
        color: Color(0xfff1f1f1),
        child: Container(
          width: ScreenWidth,
          color: Color(0xfff1f1f1),
          height: ScreenHeight,
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // SizedBox(
                        //   width: 20,
                        //   height: 180,
                        // ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          padding: EdgeInsets.only(top: 55, left: 35),
                          icon: Icon(Icons.arrow_back_ios),
                        ),

                        Container(
                          padding: EdgeInsets.only(top: 55, right: 40),
                          child: IconButton(onPressed: () {
                            Provider.of<ProductProvider>(context, listen: false).addToCart(
                                productModel: widget.productModel, count: count);
                            ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                                content: new Text('added product succesfully')
                            ));
                            },
                              icon: Icon(Icons.add)),
                        ),
                      ],
                    ),
                  ),
                  Container(),
                  Container(
                    height: 450,
                    padding: EdgeInsets.only(top: 100, left: 60),
                    child: Image.asset("assets/product_info.jpeg"),
                  ),
                  Positioned(
                    left: ScreenWidth * 0.45,
                    top: ScreenHeight * 0.52,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 12,
                          height: 12,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 12,
                          height: 12,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 12,
                          height: 12,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            size: 60,
                          ),
                          Text("Vegan"),
                        ],
                      ),
                    ),

                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            size: 60,
                          ),
                          Text("Vegan"),
                        ],
                      ),
                    ),

                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.ac_unit_rounded,
                            size: 60,
                          ),
                          Text("Vegan"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              ScreenEnd(
                productModel: widget.productModel, count: count, incCount: () {
                incCount();
              }, decCount: () {
                decCount();
              },

              ),
            ],
          ),
        ),
      ),
    );
  }
}
