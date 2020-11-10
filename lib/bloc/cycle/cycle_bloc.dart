import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/repository/cycle_repository.dart';
part 'cycle_state.dart';

part 'cycle_events.dart';

class CycleBloc extends Bloc<CycleEvents, CycleState> {
  final _cycleRepository = CycleRepository();

  CycleBloc() : super(CycleState());
  


  @override
  Stream<CycleState> mapEventToState(CycleEvents event) async* {
    /// ADD ACTIVITY IN LIST
    if (event is AddCycle) {
      await _cycleRepository.createCycle(event.activty);
      List<Cycle> cycles = await _cycleRepository.getCycles();
      int total = await _cycleRepository.totalCycles();
      int completed = await _cycleRepository.completedCycles(2);
      print(' total : $total');
      print(' completed : $completed');
      yield state.copyWith(
        list: cycles,
        totalCycles: total,
        completedCylces: completed,
      );
    } else if (event is UpdateCycle) {
      await _cycleRepository.updateCycle(event.cycle);
      List<Cycle> cycles = await _cycleRepository.getCycles();
      int total = await _cycleRepository.totalCycles();
      int completed = await _cycleRepository.completedCycles(2);
      yield state.copyWith(
        list: cycles,
        totalCycles: total,
        completedCylces: completed,
      );
    } else if (event is DeleteCycle) {
      await _cycleRepository.deleteCycle(event.id);
      List<Cycle> cycles = await _cycleRepository.getCycles();
      int total = await _cycleRepository.totalCycles();
      int completed = await _cycleRepository.completedCycles(2);
      yield state.copyWith(
        list: cycles,
        totalCycles: total,
        completedCylces: completed,
      );
    } else if (event is UpdateTotalsCompleted) {
      int total = await _cycleRepository.totalCycles();
      int completed = await _cycleRepository.completedCycles(2);

      yield state.copyWith(
        totalCycles: total,
        completedCylces: completed,
      );
    }
  }
}
