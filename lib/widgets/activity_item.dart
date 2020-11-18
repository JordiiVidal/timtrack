import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/pages/activity_edit_page.dart';
import 'package:timtrack/widgets/modal_start_cycle.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;
  const ActivityItem({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: UniqueKey(),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: GestureDetector(
        onTap: () {
          showBarModalBottomSheet(
            expand: true,
            duration: Duration(milliseconds: 600),
            context: context,
            backgroundColor: Colors.transparent,
            enableDrag: true,
            topControl: Container(
              height: 150,
            ),
            builder: (context) => ModalStartCycle(
              activity: activity,
            ),
          );
        },
        child: ListTile(
          title: Text(activity.name),
          leading: CircleAvatar(
            backgroundColor: activity.color,
            child: Text('${activity.name[0].toUpperCase()}'),
          ),
        ),
      ),
      secondaryActions: [
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 8,
                offset: Offset(-1, 2),
                color: Color(0XFFa2aecf),
              )
            ],
          ),
          child: IconSlideAction(
            caption: 'Edit',
            color: Color(0xff2dd2b4),
            icon: Icons.edit,
            foregroundColor: Colors.white,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ActivityEditPage(
                  activity: activity,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
