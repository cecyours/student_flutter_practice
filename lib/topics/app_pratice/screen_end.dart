import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/product_model.dart';
import 'package:maulesh_flutter_practice/topics/app_pratice/shopping_cart.dart';

class ScreenEnd extends StatefulWidget {
  ScreenEnd(
      {super.key,
      required this.productModel,
      required this.count,
      required this.incCount,
      required this.decCount});

 int count;
  ProductModel productModel;

  void Function() incCount;
  void Function() decCount;

  @override
  State<ScreenEnd> createState() => _ScreenEndState();
}

class _ScreenEndState extends State<ScreenEnd> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
      width: 400,
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30, left: 20),
                child: Text(
                  widget.productModel.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20),
                ),
              ),
              SizedBox(
                width: 90,
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                child: Icon(Icons.star),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                child: Icon(Icons.star),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                child: Icon(Icons.star),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                child: Icon(Icons.star),
              ),
              Container(
                padding: EdgeInsets.only(top: 25),
                child: Icon(Icons.star),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Size: 7.60 fl oz / 225ml",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(
                width: 80,
              ),
              Container(
                child:
                    Text("(132 Reviews)", style: TextStyle(color: Colors.grey)),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 45, left: 20),
                child: Text(
                  "\$ ${widget.productModel.price}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                width: 70,
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: 120,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                    border: Border.fromBorderSide(
                        BorderSide(color: Colors.grey, width: 1))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        widget.incCount();
                      },
                    ),
                    Text("${widget.count}"),
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        widget.decCount(

                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ShoppingCart()));
                  },
                  child: Text(
                    "Cart",
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
