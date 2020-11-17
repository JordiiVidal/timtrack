import 'package:equatable/equatable.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivitiesEvent extends Equatable {
  const ActivitiesEvent();
  @override
  List<Object> get props => [];
}

class ActivitiesLoaded extends ActivitiesEvent {}

class ActivitiesGetAll extends ActivitiesEvent {}

class ActivityAdded extends ActivitiesEvent {
  final Activity activity;
  ActivityAdded(this.activity);
  @override
  List<Object> get props => [activity];
}

class ActivityDeleted extends ActivitiesEvent {
  final Activity activity;
  ActivityDeleted(this.activity);
  @override
  List<Object> get props => [activity];
}

class ActivitiesUpdated extends ActivitiesEvent {
  final Activity activity;
  ActivitiesUpdated(this.activity);
  @override
  List<Object> get props => [activity];
}
