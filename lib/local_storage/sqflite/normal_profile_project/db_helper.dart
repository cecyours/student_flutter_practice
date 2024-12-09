import 'package:maulesh_flutter_practice/local_storage/sqflite/normal_profile_project/struct_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelp {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'profile.db');
    return await openDatabase(path, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE profile(name Text, address Text, bod Text, village Text)');
    }, version: 1);
  }

  Future<void> insertProfile(Struct1 struct) async {
    final db = await database;

    await db.insert('profile', struct.toJson());
  }

  Future<Struct1> getProfile() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('profile');
    print("abs sadfsadf");
    return Struct1(
        name: maps[0]['name'],
        address: maps[0]['address'],
        bod: maps[0]['bod'],
        village: maps[0]['village']);
  }
}
