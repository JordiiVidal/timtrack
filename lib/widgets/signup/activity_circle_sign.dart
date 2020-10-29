import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/user/user_bloc.dart';

import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/user_model.dart';

class ActivityCircle extends StatelessWidget {
  final Activity activity;
  final UserState state;
  ActivityCircle({Key key, this.activity, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    return GestureDetector(
      onTap: () => {
        if (!state.existUser)
          {
            userBloc.add(
              ActivateUser(
                User(
                  id: 1,
                  name: '',
                  activities: [activity],
                ),
              ),
            )
          }
        else
          {
            (state.user.activities.contains(activity))
                ? userBloc.add(DeleteActivity(activity))
                : userBloc.add(AddActivity(activity))
          }
      },
      child: Container(
        padding: const EdgeInsets.all(1.0),
        child: Column(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                maxRadius:
                    state.existUser && state.user.activities.contains(activity)
                        ? 30
                        : 23,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${activity.name}',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
