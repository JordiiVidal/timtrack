import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycle/cycle_bloc.dart';
import 'package:timtrack/models/activity_model.dart';

class ActivityListTile extends StatelessWidget {
  final Activity activity;
  const ActivityListTile({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.name),
      leading: IconButton(
        icon: Icon(Icons.filter_list),
        onPressed: () => {
          BlocProvider.of<CycleBloc>(context).add(
            AddCycle(activity),
          )
        },
      ),
    );
  }
}
