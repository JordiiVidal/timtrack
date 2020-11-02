import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timtrack/bloc/activity/activity_bloc.dart';
import 'package:timtrack/bloc/cycle/cycle_bloc.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityListTile extends StatelessWidget {
  final Activity activity;
  const ActivityListTile({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
        title: Text(activity.name),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Start',
          color: Colors.blue,
          icon: Icons.play_arrow,
          closeOnTap: false,
          onTap: () {
            BlocProvider.of<CycleBloc>(context).add(
              AddCycle(activity),
            );
          },
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          closeOnTap: true,
          onTap: () {
            BlocProvider.of<ActivityBloc>(context).add(
              DeleteActivity(activity.id),
            );
          },
        ),
      ],
    );
  }
}
