import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_event.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;
  const ActivityItem({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.name),
      leading: IconButton(
        icon: Icon(Icons.filter_list),
        onPressed: () => {
          BlocProvider.of<CyclesBloc>(context).add(
            CycleAdded(
              Cycle(
                activity: activity,
                dateStart: new DateTime.now().millisecondsSinceEpoch,
                dateEnd: null,
                status: StatusCycle.ongoing,
              ),
            ),
          ),
        },
      ),
    );
  }
}
