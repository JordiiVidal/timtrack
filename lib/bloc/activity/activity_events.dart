part of 'activity_bloc.dart';

@immutable
abstract class ActivityEvents {}

class GetActivities extends ActivityEvents {
  GetActivities({String query});
}

class UpdateActivity extends ActivityEvents {
  final Activity activity;
  UpdateActivity(this.activity);
}

class AddActivity extends ActivityEvents {
  final Activity activity;
  AddActivity(this.activity);
}

class DeleteActivity extends ActivityEvents {
  final Activity activity;
  DeleteActivity(this.activity);
}