part of 'cycle_bloc.dart';

@immutable
abstract class CycleEvents {}

class GetCycles extends CycleEvents {
  GetCycles({String query});
}

class UpdateCycle extends CycleEvents {
  final Cycle cycle;

  UpdateCycle(this.cycle);
}

class AddCycle extends CycleEvents {
  final Activity activty;

  AddCycle(this.activty);
}

class DeleteCycle extends CycleEvents {
  final int id;

  DeleteCycle(this.id);
}
