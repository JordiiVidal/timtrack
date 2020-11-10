import 'package:equatable/equatable.dart';
import 'package:timtrack/models/cycle_model.dart';

class CyclesEvent extends Equatable {
  const CyclesEvent();

  @override
  List<Object> get props => [];
}

class CyclesLoaded extends CyclesEvent {}

class CycleAdded extends CyclesEvent {
  final Cycle cycle;

  const CycleAdded(this.cycle);

  @override
  List<Object> get props => [cycle];
}

class CycleUpdated extends CyclesEvent {
  final Cycle cycle;

  const CycleUpdated(this.cycle);

  @override
  List<Object> get props => [cycle];
}

class CycleDeleted extends CyclesEvent {
  final Cycle cycle;
  const CycleDeleted(this.cycle);

  @override
  List<Object> get props => [cycle];
}

class CyclesGetAll extends CyclesEvent {}
