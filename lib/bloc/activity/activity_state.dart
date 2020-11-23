import 'package:equatable/equatable.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityState extends Equatable {
  const ActivityState();
  @override
  List<Object> get props => [];
}

class ActivityLoadFailure extends ActivityState {}

class ActivityLoadInProgress extends ActivityState {}

class ActivityLoadSuccess extends ActivityState {
  final Activity activity;

  const ActivityLoadSuccess([this.activity]);

  @override
  List<Object> get props => [activity];
}
