import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLHelper{

  static const DB_NAME = "myDatabase.db";
  static const VERSION = 1;

  static final SQLHelper instance = SQLHelper();

  static Database? database;



  Future<Database?> getDatabase() async{
    if(database != null){
      return database;
    }

    database = await initDb();
    return database;
}

  Future<Database> initDb() async  {

    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,DB_NAME);

    return await openDatabase(path,version: VERSION, onCreate: onCreate);

  }

  Future onCreate(Database db,int version) async{
    db.execute("CREATE TABLE Person (id INTEGER PRIMARY KEY,name TEXT NOT NULL)");
  }



}