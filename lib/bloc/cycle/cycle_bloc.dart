import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycle/cycle.dart';
import 'package:timtrack/bloc/cycle/cycle_state.dart';

class CycleBloc extends Bloc<CycleEvent, CycleState> {
  CycleBloc() : super(CycleState());

  @override
  Stream<CycleState> mapEventToState(CycleEvent event) async* {
    if (event is CycleLoaded) {
      yield* _mapCycleLoadedToState();
    } else if (event is CycleUpdated) {
      yield* _mapCycleUpdatedToState();
    }
  }

   Stream<CycleState> _mapCycleLoadedToState() async*  {
    //  try{

    //  }catch( _ ){
    //    yield* 
    //  }
   }

  Stream<CycleState> _mapCycleUpdatedToState() async* {}

}
