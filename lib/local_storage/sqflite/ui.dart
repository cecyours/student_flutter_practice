import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'database_helper.dart';
import 'model.dart'; // Import the Product model


class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _dbHelper = DatabaseHelper();

  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  // Load all products from the database
  void _loadProducts() async {
    List<Product> products = await _dbHelper.getProducts();
    setState(() {
      _products = products;
    });
  }

  // Add a new product to the database
  void addProduct(int index) async {
    if (_nameController.text.isNotEmpty && _priceController.text.isNotEmpty) {
      final product = Product(
        name: _nameController.text,
        price: _priceController.text, newId: index,
      );
      await _dbHelper.insertProduct(product);
      _nameController.clear();
      _priceController.clear();
      _loadProducts();
    } else {
      // Show an error message if fields are empty
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter product name and price')),
      );
    }
  }

  void _removeProduct(int index) async{
    bool success = await _dbHelper.removeProduct(index);
    _loadProducts();
    if(success){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product removed')),
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('something went wrong')),
      );
    }

  }

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
                addProduct(_products.length);
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
                      _removeProduct(index);
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
