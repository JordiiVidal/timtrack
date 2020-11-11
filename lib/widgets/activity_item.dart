import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/widgets/modal_start_cycle.dart';

class ActivityItem extends StatelessWidget {
  final Activity activity;
  const ActivityItem({Key key, this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(activity.name),
      leading: IconButton(
        padding: EdgeInsets.all(0),
        icon: Icon(Icons.scatter_plot),
        onPressed: () => {
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
          ),
        },
      ),
    );
  }
}
