import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timtrack/models/activity_model.dart';

part 'activity_events.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvents, ActivityState> {
  ActivityBloc() : super(ActivityState());
  @override
  Stream<ActivityState> mapEventToState(ActivityEvents event) async* {
  
    if(event is AddActivity){
      
    }
  }
}
