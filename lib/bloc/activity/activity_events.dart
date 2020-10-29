part of 'activity_bloc.dart';

@immutable
abstract class ActivityEvents {}

class AddActivity extends ActivityEvents {
  final Activity activity;
  AddActivity(this.activity);
}

class DeleteActivity extends ActivityEvents {
  final Activity activity;
  DeleteActivity(this.activity);
}
