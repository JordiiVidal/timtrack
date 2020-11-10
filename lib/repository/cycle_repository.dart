import 'package:timtrack/dao/cycle_dao.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleRepository {
  final cycleDao = CycleDao();

  Future getCycles() => cycleDao.getCycles();

  Future createCycle(Cycle cycle) => cycleDao.createCycle(cycle);

  Future deleteCycle(String id) => cycleDao.deleteCycle(id);

  Future updateCycle(Cycle cycle) => cycleDao.updateCycle(cycle);

  Future totalCycles() => cycleDao.totalCycles();

  Future completedCycles(int status) => cycleDao.totalStatusCycles(status);
}
