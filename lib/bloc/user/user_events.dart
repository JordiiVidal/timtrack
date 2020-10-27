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
