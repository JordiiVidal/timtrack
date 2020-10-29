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

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'TimTrackDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Activity(id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(300),duration INT)');
      await db.execute(
          'INSERT INTO `activity` (`id`, `name`, `duration`) VALUES (NULL, "Sleep", "322"), (NULL, "Read", "33"), (NULL, "Water", "2"), (NULL, "Eat", "2"), (NULL, "Play", "2");');
    });
  }
}
