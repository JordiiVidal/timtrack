import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timtrack/bloc/activities/activities.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/repository/activity_repository.dart';

class ActivitiesBloc extends Bloc<ActivitiesEvent, ActivitiesState> {
  final ActivityRepository activityRepository;
  ActivitiesBloc({this.activityRepository}) : super(ActivitiesLoadInProgress());

  @override
  Stream<ActivitiesState> mapEventToState(ActivitiesEvent event) async* {
    if (event is ActivitiesLoaded) {
      yield* _mapActivitiesLoadedToState();
    } else if (event is ActivityAdded) {
      yield* _mapActivitiesAddedToState(event);
    }
  }

  Stream<ActivitiesState> _mapActivitiesLoadedToState() async* {
    try {
      final List<Activity> activities =
          await activityRepository.getActivities();///DB
      print(activities);
      yield ActivitiesLoadSuccess(activities);
    } catch (_) {
      yield ActivitiesLoadFailure();
    }
  }

  Stream<ActivitiesState> _mapActivitiesAddedToState(
      ActivityAdded event) async* {
    if (state is ActivitiesLoadSuccess) {
      final Activity activity = event.activity;
      await activityRepository.createActivity(activity);///DB
      final List<Activity> list =
          List.from((state as ActivitiesLoadSuccess).activities)..add(activity);
      yield ActivitiesLoadSuccess(list);
    }
  }
}
