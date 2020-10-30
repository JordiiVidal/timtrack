import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timtrack/models/activity_model.dart';

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
          'CREATE TABLE Activity(id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(300),duration INT,active INT, deleted INT)');
      await db.execute(
          'INSERT INTO `activity` (`id`, `name`, `duration`,`active`,`deleted`) VALUES (NULL, "Sleep", 322,0,0), (NULL, "Read", 33,0,0), (NULL, "Water", 2,0,0), (NULL, "Eat", 2,0,0), (NULL, "Play", 245 ,0,0);');
    });
  }

  Future<int> createActivity(Activity activityModel) async {
    final db = await database;
    final result = await db.insert('Activity', activityModel.toJson());
    return result;
  }

  Future<List<Activity>> getActivities() async {
    final db = await database;
    final result = await db.query('Activity');
    List<Activity> list = result.isNotEmpty
        ? result.map((scan) => Activity.fromJson(scan)).toList()
        : [];

    return list;
  }

  Future<int> deleteActivity(int id) async {
    final db = await database;
    final result =
        await db.delete('Activity', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> updateActivity(Activity activityModel) async {
    final db = await database;
    final result = await db.update('Activity', activityModel.toJson(),
        where: 'id = ?', whereArgs: [activityModel.id]);
    return result;
  }
}
