import 'package:timtrack/providers/db_provider.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityDao {
  final DBProvider dbProvider = DBProvider.db;

  Future<int> createActivity(Activity activityModel) async {
    final db = await dbProvider.database;
    final result = await db.insert('Activity', activityModel.toJson());
    return result;
  }

  Future<List<Activity>> getActivities() async {
    final db = await dbProvider.database;
    final result = await db.query('Activity');
    List<Activity> list = result.isNotEmpty
        ? result.map((scan) => Activity.fromJson(scan)).toList()
        : [];

    return list;
  }

  Future<Activity> getActivity(int id) async {
    final db = await dbProvider.database;
    final result = await db.query('Activity', where: 'id = ?', whereArgs: [id]);
    return result.isNotEmpty ? Activity.fromJson(result.first) : null;
  }

  Future<int> deleteActivity(String id) async {
    final db = await dbProvider.database;
    final result =
        await db.delete('Activity', where: 'id = ?', whereArgs: [id]);
    return result;
  }

  Future<int> updateActivity(Activity activityModel) async {
    final db = await dbProvider.database;
    final result = await db.update('Activity', activityModel.toJson(),
        where: 'id = ?', whereArgs: [activityModel.id]);
    return result;
  }
}
