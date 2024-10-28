import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maulesh_flutter_practice/app_pratice/product_info.dart';
import 'package:maulesh_flutter_practice/app_pratice/product_model.dart';

class ProductWidget extends StatefulWidget {
  ProductModel productModel;

  ProductWidget({super.key, required this.productModel});

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductInfo(
                      productModel: widget.productModel,
                    )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 260,
        width: 160,
        padding: EdgeInsets.only(bottom: 10),
        child: Column(
          children: [
            Container(
              child: Image.asset(widget.productModel.imageUrl),
              width: 120,
              height: 180,
            ),
            Container(
              padding: EdgeInsets.only(right: 50),
              // padding: EdgeInsets.only(right: 70, top: 180),
              child: Text(
                widget.productModel.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 6),
              child: Text(
                widget.productModel.description,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  // padding: EdgeInsets.only(left: 10, top: 70),
                  padding: EdgeInsets.only(right: 100),
                  child: Text(widget.productModel.price.toString()),
                ),
                InkWell(
                  onTap: () {
                    print("test...");
                  },
                  child: Container(
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
