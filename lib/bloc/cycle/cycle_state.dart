part of 'cycle_bloc.dart';

class CycleState {
  final List<Cycle> list;
    CycleState({List<Cycle> listC}) : list = listC ?? [];

    CycleState copyWith({List<Cycle> list}) => CycleState(
        listC: list ?? this.list,
      );
}
