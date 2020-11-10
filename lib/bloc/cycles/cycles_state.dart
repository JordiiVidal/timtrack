import 'package:equatable/equatable.dart';
import 'package:timtrack/models/cycle_model.dart';

class CyclesState extends Equatable {
  const CyclesState();

  @override
  List<Object> get props => [];
}

class CyclesLoadFailure extends CyclesState {}

class CylcesLoadInProgress extends CyclesState {}

class CyclesLoadSuccess extends CyclesState {
  final List<Cycle> cycles;

  const CyclesLoadSuccess([this.cycles = const []]);

  @override
  List<Object> get props => [cycles];
}
