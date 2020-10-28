import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart'; //material ligero

import 'package:timtrack/models/user_model.dart';

part 'user_events.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvents event) async* {
    if (event is ActivateUser) {
      yield UserState(userC: event.user);
    } else if (event is ChangeName) {
      yield UserState(userC: state.user.copyWith(name: event.name));
    } else if (event is AddActivity) {
      yield UserState(
        userC: state.user.copyWith(
          activities: [...state.user.activities, event.idActivity],
        ),
      );
    }
  }
}
