import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/database_helper.dart';
import 'package:maulesh_flutter_practice/local_storage/sqflite/maulesh/model_2.dart';
// import 'database_helper.dart';
// import 'model.dart'; // Import the Product model


class ProductPage1 extends StatefulWidget {
  const ProductPage1({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage1> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _dbHelper = DatabaseHelper();

  List<Product2> _products = [];

  @override
  void initState() {
    super.initState();
    // _loadProducts();
  }

  // Load all products from the database


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            // Text fields to input product details
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: _priceController,
              decoration: const InputDecoration(labelText: 'Product Price'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: (){
                // addProduct(_products.length);
                print(_nameController.text);
                print(_priceController.text);
              },
              child: const Text('Add Product'),
            ),
            const SizedBox(height: 20),
            // Display list of products
            Expanded(
              child: ListView.builder(
                itemCount: _products.length,
                itemBuilder: (context, index) {
                  final product = _products[index];
                  return ListTile(
                    leading: IconButton(onPressed: () {
                      // _removeProduct(index);
                    },
                        icon: Icon(Icons.remove)),
                    title: Text(product.name),
                    subtitle: Text('\$${product.price}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}