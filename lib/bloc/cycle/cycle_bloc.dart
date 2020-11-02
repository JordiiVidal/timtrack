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
      ///TODO try catch loading loaded ...
      ///TODO CHECK IF ACTIVITY HAVE BEEN CREATED CYCLE
      await _cycleRepository.createCycle(event.activty);
      List<Cycle> cycles = await _cycleRepository.getCycles();
      yield state.copyWith(list: cycles);
    }
  }
}
