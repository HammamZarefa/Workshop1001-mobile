import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class FavoriteHelper {
  static final FavoriteHelper instance = FavoriteHelper._init();
  static Database? _database;

  FavoriteHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("favorites.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE favorites (
      id INTEGER PRIMARY KEY,
      title TEXT,
      price TEXT,
      image TEXT
    )
    ''');
  }

 
  Future<int> addFavorite(Map<String, dynamic> product) async {
    final db = await instance.database;
    return await db.insert('favorites', product);
  }

 
  Future<int> removeFavorite(int id) async {
    final db = await instance.database;
    return await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

 
  Future<List<Map<String, dynamic>>> getFavorites() async {
    final db = await instance.database;
    return await db.query('favorites');
  }

 
  Future<bool> isFavorite(int id) async {
    final db = await instance.database;
    final res =
        await db.query('favorites', where: 'id = ?', whereArgs: [id]);
    return res.isNotEmpty;
  }
}