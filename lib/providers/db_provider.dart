import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';

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
          'CREATE TABLE Activity(id INTEGER PRIMARY KEY AUTOINCREMENT,name VARCHAR(300), deleted INT)');
      await db.execute(
          'CREATE TABLE Cycle(id INTEGER PRIMARY KEY AUTOINCREMENT,id_activity INT,date_start INT(100),date_end INT(100) NULL, status INT, duration INT(100) NULL)');
    });
  }

////ACTIVITY

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

  Future<Activity> getActivity(int id) async {
    final db = await database;
    final result = await db.query('Activity', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Activity.fromJson(result.first) : null;
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

  ///CYCLE

  Future<int> createCycle(Activity activity) async {
    final db = await database;
    final result = await db.insert(
      'Cycle',
      Cycle(
        activity: activity,
        dateStart: new DateTime.now().millisecondsSinceEpoch,
        dateEnd: null,
        status: StatusCycle.ongoing,
      ).toJson(),
    );
    return result;
  }

  Future<List<Cycle>> getCycles() async {
    final db = await database;
    final result = await db.rawQuery(
        'select Activity.id as id_activity, Activity.name, Cycle.* from Cycle left join Activity where Activity.id = Cycle.id_activity order by Cycle.date_start DESC');
    List<Cycle> list = result.isNotEmpty
        ? result.map((scan) => Cycle.fromJsonJoin(scan)).toList()
        : [];

    return list;
  }

  Future<int> deleteCycle(int id) async {
    final db = await database;
    final result = await db.delete('Cycle', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> updateCycle(Cycle cycleModel) async {
    final db = await database;
    final result = await db.update('Cycle', cycleModel.toJson(),
        where: 'id = ?', whereArgs: [cycleModel.id]);
    return result;
  }

  Future<int> totalCycles() async {
    final db = await database;
    final result = await db.rawQuery('select count(*) from Cycle');
    return Sqflite.firstIntValue(result);
  }

  Future<int> totalStatusCycles(int status) async {
    final db = await database;
    final result =
        await db.rawQuery('select count(*) from Cycle where status = $status');
    print(result);
    return Sqflite.firstIntValue(result);
  }
}
