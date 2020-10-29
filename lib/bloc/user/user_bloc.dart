import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart'; //material ligero
import 'package:timtrack/models/activity_model.dart';

import 'package:timtrack/models/user_model.dart';

part 'user_events.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvents, UserState> {
  UserBloc() : super(UserState());

  @override
  Stream<UserState> mapEventToState(UserEvents event) async* {
    if (event is ActivateUser) {
      yield state.copyWith(user: event.user);
    } else if (event is ChangeName) {
      yield state.copyWith(user: state.user.copyWith(name: event.name));
    } else if (event is AddActivity) {
      yield state.copyWith(
        user: state.user.copyWith(
          activities: [...state.user.activities, event.activity],
        ),
      );
    } else if (event is DeleteActivity) {
      List<Activity> _activities = state.user.activities;
      _activities.removeWhere((activity) => activity.id == event.activity.id);
      yield state.copyWith(
        user: state.user.copyWith(
          activities: _activities,
        ),
      );
    }
  }
}
