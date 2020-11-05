import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timtrack/bloc/activity/activity_bloc.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityCircle extends StatelessWidget {
  final Activity activity;
  final ActivityState state;
  ActivityCircle({Key key, this.activity, this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: close_sinks
    ActivityBloc activityBloc = BlocProvider.of<ActivityBloc>(context);

    return GestureDetector(
      onTap: () {
        activityBloc.add(UpdateActivity(activity));
      },
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Container(
              child: CircleAvatar(
                child: Text('${activity.name[0]}'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
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
