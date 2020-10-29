part of 'user_bloc.dart';

class UserState {
  final bool existUser;
  final User user;

  UserState({User userC})
      : user = userC ?? null,
        existUser = (userC != null) ? true : false;

  UserState copyWith({User user}) => UserState(
        userC: user ?? this.user,
      );
}
