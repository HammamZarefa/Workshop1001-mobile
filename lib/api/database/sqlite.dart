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
  version: 2,
  onCreate: _createDB,
  onUpgrade: (db, oldVersion, newVersion) async {
    if (oldVersion < 2) {
      await db.execute('''
        CREATE TABLE IF NOT EXISTS Notifications(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          title TEXT NOT NULL,
          body TEXT NOT NULL,
          dateTime TEXT NOT NULL
        )
      ''');
    }
  },
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
    await db.execute('''
      CREATE TABLE Notifications(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        body TEXT NOT NULL,
        dateTime TEXT NOT NULL
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
   Future<int> insertNotification(Map<String, dynamic> row) async {
    final db = await instance.database;
    return await db.insert("Notifications", row);
  }

  Future<List<Map<String, dynamic>>> getAllNotifications() async {
    final db = await instance.database;
        return await db.query("Notifications");

  }

  Future<int> deleteNotification(int id) async {
    final db = await instance.database;
    return await db.delete("Notifications", where: "id = ?", whereArgs: [id]);
  }
}
