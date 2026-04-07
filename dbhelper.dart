
import 'package:app/model/mymodel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBHelper {
  static Database? _database;

  // Get database
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  // Initialize DB
  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'shoes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE shoes(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            image TEXT,
            price TEXT,
            name TEXT
          )
        ''');

       await db.execute('''
  CREATE TABLE cart(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    image TEXT,
    price TEXT,
    name TEXT,
    quantity INTEGER
  )
''');
      },
    );
  }

  // 🔹 Insert Shoe
  Future<int> insertShoe(Shoe shoe) async {
    final db = await database;
    return await db.insert('shoes', shoe.toMap());
  }

  // 🔹 Get All Shoes
  Future<List<Shoe>> getShoes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('shoes');

    return List.generate(maps.length, (i) {
      return Shoe.fromMap(maps[i]);
    });
  }

  // 🔹 Add to Cart
  Future<int> addToCart(Shoe shoe) async {
    final db = await database;
    return await db.insert('cart', shoe.toMap());
  }

  // 🔹 Get Cart Items
  Future<List<Shoe>> getCartItems() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('cart');

    return List.generate(maps.length, (i) {
      return Shoe.fromMap(maps[i]);
    });
  }

  // 🔹 Delete from Cart
  Future<int> removeFromCart(int id) async {
    final db = await database;
    return await db.delete('cart', where: 'id = ?', whereArgs: [id]);
  }
 
}