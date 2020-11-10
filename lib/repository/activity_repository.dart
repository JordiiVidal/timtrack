import 'package:timtrack/dao/activity_dao.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityRepository {

  final ActivityDao activityDao = ActivityDao();

  Future getActivities() => activityDao.getActivities();

  Future createActivity(Activity activity) =>
      activityDao.createActivity(activity);

  Future deleteActivity(int id) => activityDao.deleteActivity(id);

  Future updateActivity(Activity activity) =>
      activityDao.updateActivity(activity);
}
