import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._private();
  DBProvider._private();
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  void onUpgrade(
    Database database,
    int oldVersion,
    int newVersion,
  ) {
    if (newVersion > oldVersion) {}
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'TimTrackDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Activity(id VARCHAR(300) PRIMARY KEY,name VARCHAR(300),color VARCHAR(100), tags VARCHAR(600), deleted INT)');
      await db.execute(
          'CREATE TABLE Cycle(id VARCHAR(300) PRIMARY KEY,id_activity VARCHAR(300),date_start INT(100),date_end INT(100) NULL, status INT, duration INT(100) NULL)');
    });
  }
}
