part of 'user_bloc.dart';

@immutable
abstract class UserEvents {}

class ActivateUser extends UserEvents {
  final User user;
  ActivateUser(this.user);
}

class ChangeName extends UserEvents {
  final String name;
  ChangeName(this.name);
}

class AddActivity extends UserEvents {
  final Activity activity;
  AddActivity(this.activity);
}

class DeleteActivity extends UserEvents {
  final Activity activity;
  DeleteActivity(this.activity);
}
