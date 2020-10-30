import 'package:timtrack/providers/db_provider.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityRepository {
  Future getActivities() => DBProvider.db.getActivities();

  Future createActivity(Activity activity) =>
      DBProvider.db.createActivity(activity);

  Future deleteActivity(int id) => DBProvider.db.deleteActivity(id);

  Future updateActivity(Activity activity) =>
      DBProvider.db.updateActivity(activity);
}
