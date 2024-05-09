import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;
import 'model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'sale');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
      "CREATE TABLE supplier (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT NOT NULL, phone INTEGER NOT NULL,email TEXT NOT NULL,address TEXT NOT NULL,password TEXT NOT NULL)",
    );
  }

  Future<SaleItems> insert(SaleItems saleItems) async {
    var dbSupplier = await db;
    dbSupplier!.insert("supplier", saleItems.toMap());
    return saleItems;
  }

  Future<List<SaleItems>> getSaleItems() async {
    var dbSupplier = await db;
    final List<Map<String, Object?>> queryResult =
        await dbSupplier!.query('supplier');
    return queryResult.map((e) => SaleItems.fromMap(e)).toList();
  }
}
