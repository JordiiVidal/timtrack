import 'package:sqflite/sqflite.dart';

import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/providers/db_provider.dart';

import 'package:timtrack/models/cycle_model.dart';

class CycleDao {
  final dbProvider = DBProvider.db;

  Future<int> createCycle(Activity activity) async {
    final db = await dbProvider.database;
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
    final db = await dbProvider.database;
    final result = await db.rawQuery(
        'select Activity.id as id_activity, Activity.name, Cycle.* from Cycle left join Activity where Activity.id = Cycle.id_activity order by Cycle.date_start DESC');
    List<Cycle> list = result.isNotEmpty
        ? result.map((scan) => Cycle.fromJsonJoin(scan)).toList()
        : [];

    return list;
  }

  Future<int> deleteCycle(int id) async {
    final db = await dbProvider.database;
    final result = await db.delete('Cycle', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> updateCycle(Cycle cycleModel) async {
    final db = await dbProvider.database;
    final result = await db.update('Cycle', cycleModel.toJson(),
        where: 'id = ?', whereArgs: [cycleModel.id]);
    return result;
  }

  Future<int> totalCycles() async {
    final db = await dbProvider.database;
    final result = await db.rawQuery('select count(*) from Cycle');
    return Sqflite.firstIntValue(result);
  }

  Future<int> totalStatusCycles(int status) async {
    final db = await dbProvider.database;
    final result =
        await db.rawQuery('select count(*) from Cycle where status = $status');
    print(result);
    return Sqflite.firstIntValue(result);
  }
}
