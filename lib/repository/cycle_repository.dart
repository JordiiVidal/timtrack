import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/providers/db_provider.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleRepository {
  Future getCycles() => DBProvider.db.getCycles();

  Future createCycle(Activity activity) => DBProvider.db.createCycle(activity);

  Future deleteCycle(int id) => DBProvider.db.deleteCycle(id);

  Future updateCycle(Cycle cycle) => DBProvider.db.updateCycle(cycle);
}
