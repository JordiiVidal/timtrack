part of 'activity_bloc.dart';

class ActivityState {
  final List<Activity> list;

  ActivityState({List<Activity> listC}) : list = listC ?? [];

  ActivityState copyWith({List<Activity> list}) => ActivityState(
        listC: list ?? this.list,
      );
}
