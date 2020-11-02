import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleListTile extends StatelessWidget {
  final Cycle cycle;
  const CycleListTile({Key key, this.cycle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DateTime date =
        new DateTime.fromMicrosecondsSinceEpoch(cycle.dateStart * 1000);
    final String formattedDate = DateFormat('yyyy-MM-dd – kk:mm').format(date);
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: ListTile(
        title: Text(cycle.activity.name),
        subtitle: Text(formattedDate),
      ),
      actions: <Widget>[
        IconSlideAction(
          caption: 'Start',
          color: Colors.blue,
          icon: Icons.play_arrow,
          closeOnTap: false,
          onTap: () {},
        ),
      ],
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          color: Colors.red,
          icon: Icons.delete,
          closeOnTap: true,
          onTap: () {},
        ),
      ],
    );
  }
}
