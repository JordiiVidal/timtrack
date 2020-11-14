import 'package:equatable/equatable.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CycleLoaded extends CycleEvent {}

class CycleUpdated extends CycleEvent {
  final Cycle cycle;
  CycleUpdated(this.cycle);
}

class CycleAdded extends CycleEvent {
  final Cycle cycle;
  CycleAdded(this.cycle);
}
