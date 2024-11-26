import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'products.db');
    return await openDatabase(path,
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, newId INTEGER, name TEXT, price TEXT)");
    },
    version: 1);
  }


   // insert

  Future<void> insertProduct(Product product) async {
    final db = await database;
    await db.insert(
      'products',
      product.toJson(),
    );
  }

  // get all product
  Future<List<Product>> getProducts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('products');
    return List.generate(maps.length, (i) {
      return Product.fromMap(maps[i]);
    });
  }

   // Remove product based on index
  Future<bool> removeProduct(int index) async {
    final db = await database;

    try {
      int digit =
          await db.rawDelete('DELETE FROM products WHERE newId = ${index}');
      print(' test $digit');
      if (digit == -1 || digit == 0) {
        return false;
      }
    } catch (e) {
      print('error is $e');
      return false;
    }
    return true;
  }
}
