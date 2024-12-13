
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'model.dart';

class DatabaseHelper4 {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'fact.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE facts(id INTEGER PRIMARY KEY AUTOINCREMENT, length INTEGER, fact TEXT)");
    }, version: 1);
  }

  Future<void> insertOrUpdateProduct(FactModel fact) async {
    final db = await database;

    try{
      List<Map<String, dynamic>> facts = await db.query('facts');

      if (facts.isEmpty) {
        await db.insert(
          'facts',
          fact.toJson(),
        );
      } else {
        await db.rawUpdate('''
          UPDATE facts
          SET length = ?, fact = ?
          WHERE id = ?
          ''', [fact.factLength, fact.fact, 1]);
      }
    }catch(e){
      print('something went wrong in local database $e');
    }
  }

  Future<FactModel> getFacts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('facts');
    if(maps.isEmpty){
      throw Exception();
    }
    return FactModel.fromJson(json: maps.first);
  }

}
