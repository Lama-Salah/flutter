import 'dart:io';

import 'package:juiceapplication/models/Cart.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static DBHelper helper = DBHelper._();
  Database database;
  DBHelper._();

  static final String tableName = 'Cart';
  static final String idColumn = 'id';
  static final String nameColumn = 'name';
  static final String priceName = 'price';
  static final String literColumn = 'liter';
  static final String countColumn = 'count';
  static final String qualityColumn = 'quality';
  static final String iconColumn = 'icon';

  initDataBase() async {
    database = await createDataBase();
  }

  Future<Database> createDataBase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'Juice.db';
    Database database = await openDatabase(path, version: 2, onCreate: (db, v) {
      db.execute(
          '''CREATE TABLE $tableName ($idColumn INTEGER PRIMARY KEY AUTOINCREMENT,$nameColumn TEXT,
           $priceName TEXT , $literColumn TEXT, $countColumn INTEGER ,$iconColumn TEXT ,$qualityColumn TEXT
          )''');
    });
    return database;
  }

  getTasks() async {
    List<Map> result = await database.query(tableName);
    print(result);
  }

   insertNewTask(Cart taskDb) async {
    int rowIndex = await database.insert(tableName, taskDb.toMap());
    print(rowIndex);
  }

  // getOneTask(int id) async {
  //   List<Map> result = await database.query(tableName, where: 'taskId=$id');
  //   print(result);
  // }

  // deleteTask(int id) async {
  //   int deletedRows = await database.delete(tableName, where: 'taskId=$id');
  //   print(deletedRows);
  // }

  // updateTasks(TaskDb taskDb) async {
  //   database.update(tableName, taskDb.toMap(), where: 'taskId=${taskDb.id}');
  // }
}
