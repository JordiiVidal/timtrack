import 'package:equatable/equatable.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleState extends Equatable {
  const CycleState();
  @override
  List<Object> get props => [];
}

class CycleLoadInProgress extends CycleState {}

class CycleLoadSuccess extends CycleState {
  final Cycle cycle;
  const CycleLoadSuccess([this.cycle]);

  @override
  List<Object> get props => [cycle];
}

class CycleLoadFailure extends CycleState {}
