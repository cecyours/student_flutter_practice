import 'package:maulesh_flutter_practice/local_storage/sqflite/maulesh/model_2.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper2 {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initdatabase();
    return _database!;
  }

  Future<Database> _initdatabase() async {
    String path = join(await getDatabasesPath(), 'prod.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE products(id INTEGER PRIMARY KEY AUTOINCREMENT, newId INTEGER, name TEXT, price TEXT)");
    }, version: 1);
  }
//
  Future<void> insertProduct(Product2 product) async {
    final db = await database;
    await db.insert('products', product.toJson());
  }

  Future<List<Product2>> getAllProduct() async{
    final db = await database;
    final List<Map<String, dynamic>>map = await db.query('products');
    return List.generate(map.length ,  (index){
      return Product2.fromJson(json: map[index]);
    });
  }
}
