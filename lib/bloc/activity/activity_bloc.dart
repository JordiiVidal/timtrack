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
    ///LIST ACTIVITIES
    if (event is GetActivities) {
      List<Activity> activities = await _activityRepository.getActivities();
      yield state.copyWith(list: activities);
    }

    ///UPDATE ACTIVITY OF LIST
    else if (event is UpdateActivity) {
      ///todo try catch loading loaded ...
      await _activityRepository.updateActivity(event.activity);
      List<Activity> activities = await _activityRepository.getActivities();
      yield state.copyWith(list: activities);
    }

    /// ADD ACTIVITY IN LIST
    else if (event is AddActivity) {
      ///todo try catch loading loaded ...
      await _activityRepository.createActivity(event.activity);
      List<Activity> activities = await _activityRepository.getActivities();
      yield state.copyWith(list: activities);
    }

    ///DELETE ACTIVITY OF LIST
    else if (event is DeleteActivity) {
      List<Activity> _activities = state.list;
      await _activityRepository.deleteActivity(event.id);
      _activities.removeWhere((activity) => activity.id == event.id);
      yield state.copyWith(
        list: _activities,
      );
    }
  }
}
