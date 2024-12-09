import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/product_model.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/provider/products_provider.dart';
import 'package:provider/provider.dart';

class ShoppingCart extends StatefulWidget {
  const ShoppingCart({super.key});

  @override
  State<ShoppingCart> createState() => _ShoppingCartState();
}

class _ShoppingCartState extends State<ShoppingCart> {
  late double screenWidth;
  late double screenHeight;

  // List<ProductCartModel> model = [
  //   ProductCartModel(
  //       imageUrl: "assets/product.png",
  //       name: "Facial Cleaner",
  //       prise: 9.99,
  //       quantity: 1),
  //   ProductCartModel(
  //       imageUrl: "assets/product.png",
  //       name: "Cream Cleaner",
  //       prise: 12.99,
  //       quantity: 1),
  //   ProductCartModel(
  //       imageUrl: "assets/product.png",
  //       name: "Cleaning Oil",
  //       prise: 12.99,
  //       quantity: 1),
  // ];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;

    return Consumer<ProductProvider>(
      builder: (BuildContext context, ProductProvider provider, Widget? child) {
        return Scaffold(
          body: Container(
            width: screenWidth,
            height: screenHeight,
            color: Color(0xfff1f1f1),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back_ios)),
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
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: provider.addedProducts.length,
                    itemBuilder: (context, index) {
                      ProductModel productmodel =
                          provider.addedProducts[index]['product'];

                      return Container(
                          height: 120,
                          width: 50,
                          color: Colors.white,
                          margin: EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Image.asset("assets/product.png"),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(
                                          productmodel.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 120,
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            provider.removeItem(index);
                                          }, icon: Icon(Icons.cancel),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 2,
                                  ),
                                  Container(
                                    child: Text(
                                      productmodel.description,
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    // padding: EdgeInsets.only(left: 20),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        child: Text(
                                          productmodel.price.toString(),
                                          style: TextStyle(fontSize: 15),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 100,
                                      ),
                                      Container(
                                        // margin: EdgeInsets.only(top: 30),
                                        width: 120,

                                        height: 40,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.fromBorderSide(
                                                BorderSide(
                                                    color: Colors.grey,
                                                    width: 1))),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconButton(
                                              icon: Icon(Icons.add),
                                              onPressed: () {
                                                // print("hahahhahahha");
                                                provider.incCount(index);
                                              },
                                            ),
                                            Text(provider.addedProducts[index]
                                                    ['itemcount']
                                                .toString()),
                                            IconButton(
                                              icon: Icon(Icons.remove),
                                              onPressed: () {
                                                provider.decCount(index);
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ));
                    },
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    width: 330,
                    height: 80,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Promo Code",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                            child: FilledButton(
                              onPressed: () {},
                              child: Text(
                                "Apply",
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.black),
                                  shape: WidgetStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    // side: BorderSide(color: Colors.red)
                                  ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Subtotal",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )),
                      SizedBox(
                        width: 200,
                      ),
                      Text(
                        "\$ ${provider.subTotal().toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text("USD",
                          style: TextStyle(fontSize: 12, color: Colors.grey))
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Shipping",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )),
                      SizedBox(
                        width: 200,
                      ),
                      Text(
                        "\$ ${provider.shippingCharge}",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text("USD",
                          style: TextStyle(fontSize: 12, color: Colors.grey))
                    ],
                  ),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 30,
                      ),
                      Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            "Bag Total",
                            style: TextStyle(fontSize: 15, color: Colors.black),
                          )),
                      SizedBox(
                        width: 100,
                      ),
                      Text(
                        provider.addedProducts.length.toString(),
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Text(
                        "\$ ${provider.totalReduce().toStringAsFixed(2)}",
                        style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text("USD",
                          style: TextStyle(fontSize: 12, color: Colors.grey))
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    width: 280,
                    height: 50,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text(
                        "Proceed To Checkout",
                        style: TextStyle(color: Colors.white),
                      ),
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.black),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            // side: BorderSide(color: Colors.red)
                          ))),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
