part of 'activity_bloc.dart';

@immutable
abstract class ActivityEvents {}

class GetActivities extends ActivityEvents {
  GetActivities({String query});
}

class ChangeActiveActivity extends ActivityEvents {
  final int id;
  ChangeActiveActivity(this.id);
}

class AddActivity extends ActivityEvents {
  final Activity activity;
  AddActivity(this.activity);
}

class DeleteActivity extends ActivityEvents {
  final Activity activity;
  DeleteActivity(this.activity);
}
