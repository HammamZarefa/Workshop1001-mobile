import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._init();
  static Database? _database;

  DBHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB("Cart.db");
    return _database!;
  }

  Future<Database> _initDB(String fileName) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, fileName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE Cart(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
                image TEXT NOT NULL,
               count INTEGER,
               price REAL NOT NULL
      )
    ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert("Cart", row);
  }

  Future<List<Map<String, dynamic>>> getAll() async {
    final db = await instance.database;
    return await db.query("Cart");
  }

  Future<int> update(Map<String, dynamic> row, int id) async {
    final db = await instance.database;
    return await db.update("Cart", row, where: "id = ?", whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete("Cart", where: "id = ?", whereArgs: [id]);
  }
}
