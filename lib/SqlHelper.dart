import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper {
  static const DB_NAME = "myDatabase.db";
  static const VERSION = 1;

  static final SQLHelper instance = SQLHelper();

  static  Database? database;

  Future<Database?> getDatabase() async {
    if (database != null) {
      return database;
    }

    database = await initDb();
    return database;
  }

  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, DB_NAME);

    return await openDatabase(path, version: VERSION, onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    db.execute(
        "CREATE TABLE Person (id INTEGER PRIMARY KEY,name TEXT NOT NULL)");
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database? db = await getDatabase();
    return await db!.insert("Person", row);
  }

  Future<List<Map<String, dynamic>>> read() async {
    Database? db = await getDatabase();
    return await db!.query("Person");
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database? db = await getDatabase();
    int id = row['id'];
    //print(id);
    //var id;
    return await db!.update("Person", row, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async{
    Database? db = await instance.getDatabase();

    return await db!.delete("Person",where: 'id = ?',whereArgs: [id]);

  }

}



