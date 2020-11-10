import 'package:equatable/equatable.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivitiesState extends Equatable {
  const ActivitiesState();

  @override
  List<Object> get props => [];
}

class ActivitiesLoadInProgress extends ActivitiesState {}

class ActivitiesLoadSuccess extends ActivitiesState {
  final List<Activity> activities;
  const ActivitiesLoadSuccess([this.activities = const []]);
  @override
  List<Object> get props => [activities];
}

class ActivitiesLoadFailure extends ActivitiesState {}
