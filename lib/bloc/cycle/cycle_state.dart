part of 'cycle_bloc.dart';

class CycleState extends Equatable{
  final List<Cycle> list;
  final int totalCycles;
  final int completedCycles;
  CycleState({
    List<Cycle> listC,
    int totalCyclesC,
    int completedCyclesC,
  })  : list = listC ?? [],
        totalCycles = totalCyclesC ?? 0,
        completedCycles = completedCyclesC ?? 0;

  CycleState copyWith({
    List<Cycle> list,
    int totalCycles,
    int completedCylces,
  }) =>
      CycleState(
        listC: list ?? this.list,
        totalCyclesC: totalCycles ?? this.totalCycles,
        completedCyclesC: completedCycles ?? this.completedCycles,
      );

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class InitiaCycleState extends CycleState {
  InitiaCycleState();
}
