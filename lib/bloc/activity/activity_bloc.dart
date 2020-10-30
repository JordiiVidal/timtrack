import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/repository/activity_repository.dart';

part 'activity_events.dart';
part 'activity_state.dart';

class ActivityBloc extends Bloc<ActivityEvents, ActivityState> {
  final _activityRepository = ActivityRepository();
  ActivityBloc() : super(ActivityState());

  @override
  Stream<ActivityState> mapEventToState(ActivityEvents event) async* {
    if (event is GetActivities) {
      List<Activity> activities = await _activityRepository.getActivities();
      yield state.copyWith(list: activities);
    } else if (event is UpdateActivity) {
      ///todo try catch loading loaded ...
      await _activityRepository.updateActivity(event.activity);
      List<Activity> activities = await _activityRepository.getActivities();
      yield state.copyWith(list: activities);
    }
     else if (event is AddActivity) {
      ///todo try catch loading loaded ...
      await _activityRepository.createActivity(event.activity);
      List<Activity> activities = await _activityRepository.getActivities();
      yield state.copyWith(list: activities);
    }
    // else if (event is AddActivity) {
    //   yield state.copyWith(
    //     user: state.user.copyWith(
    //       activities: [...state.user.activities, event.activity],
    //     ),
    //   );
    // } else if (event is DeleteActivity) {
    //   List<Activity> _activities = state.user.activities;
    //   _activities.removeWhere((activity) => activity.id == event.activity.id);
    //   yield state.copyWith(
    //     user: state.user.copyWith(
    //       activities: _activities,
    //     ),
    //   );
    // }
  }
}
