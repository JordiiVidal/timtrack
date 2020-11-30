import 'package:flutter/material.dart';

import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/pages/activity_edit_page.dart';
import 'package:timtrack/widgets/button_custom.dart';
import 'package:timtrack/widgets/modal_start_cycle.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;
  const ActivityItem({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onPressStart() {
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
    }

    onPressEdit() {
      MaterialPageRoute(
        builder: (context) => ActivityEditPage(
          activity: activity,
        ),
      );
    }

    return Container(
      child: ListTile(
        title: Text(activity.name),
        leading: CircleAvatar(
          backgroundColor: activity.color,
          child: Text('${activity.name[0].toUpperCase()}'),
        ),
        trailing: Container(
          width: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ButtonCustom(
                onPressed: onPressStart,
                icon: Icon(Icons.play_arrow),
                color: Color(0xff2dd2b4),
              ),
              SizedBox(
                width: 20,
              ),
              ButtonCustom(
                onPressed: onPressEdit,
                icon: Icon(Icons.edit),
                color: Color(0xff2784f8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
