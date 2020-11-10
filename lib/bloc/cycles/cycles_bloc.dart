import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timtrack/bloc/cycles/cycles.dart';
import 'package:timtrack/repository/cycle_repository.dart';
import 'package:timtrack/models/cycle_model.dart';

class CyclesBloc extends Bloc<CyclesEvent, CyclesState> {
  final CycleRepository cycleRepository;
  CyclesBloc({this.cycleRepository}) : super(CylcesLoadInProgress());

  @override
  Stream<CyclesState> mapEventToState(CyclesEvent event) async* {
    if (event is CyclesLoaded) {
      yield* _mapCyclesLoadedToState();
    } else if (event is CycleAdded) {
      yield* _mapCycleAddedToState(event);
    } else if (event is CycleDeleted) {
      yield* _mapCycleDeletedToState(event);
    } else if (event is CycleUpdated) {
      yield* _mapCycleUpdatedToState(event);
    } else if (event is CyclesGetAll) {}
  }

  Stream<CyclesState> _mapCyclesLoadedToState() async* {
    try {
      final List<Cycle> cycles = await cycleRepository.getCycles();
      yield CyclesLoadSuccess(cycles);
    } catch (_) {
      yield CyclesLoadFailure();
    }
  }

  Stream<CyclesState> _mapCycleAddedToState(CycleAdded event) async* {
    if (state is CyclesLoadSuccess) {
      await cycleRepository.createCycle(event.cycle);
      final List<Cycle> updatedTodos =
          List.from((state as CyclesLoadSuccess).cycles)..add(event.cycle);
      yield CyclesLoadSuccess(updatedTodos);
    }
  }

  Stream<CyclesState> _mapCycleDeletedToState(CycleDeleted event) async* {
    if (state is CyclesLoadSuccess) {
      print(event.cycle.id);
      int res = await cycleRepository.deleteCycle(event.cycle.id);
      print(res);
      final List<Cycle> updatedTodos = (state as CyclesLoadSuccess)
          .cycles
          .where((element) => element.id != event.cycle.id)
          .toList();
      yield CyclesLoadSuccess(updatedTodos);
    }
  }

  Stream<CyclesState> _mapCycleUpdatedToState(CycleUpdated event) async* {
    if (state is CyclesLoadSuccess) {
      await cycleRepository.updateCycle(event.cycle);
      final List<Cycle> updatedTodos =
          (state as CyclesLoadSuccess).cycles.map((element) {
        return element.id == event.cycle.id ? event.cycle : element;
      }).toList();
      yield CyclesLoadSuccess(updatedTodos);
    }
  }
}
