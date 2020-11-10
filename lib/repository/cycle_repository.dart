import 'package:timtrack/dao/cycle_dao.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleRepository {
  final cycleDao = CycleDao();

  Future getCycles() => cycleDao.getCycles();

  Future createCycle(Activity activity) => cycleDao.createCycle(activity);

  Future deleteCycle(int id) => cycleDao.deleteCycle(id);

  Future updateCycle(Cycle cycle) => cycleDao.updateCycle(cycle);

  Future totalCycles() => cycleDao.totalCycles();

  Future completedCycles(int status) => cycleDao.totalStatusCycles(status);
}
