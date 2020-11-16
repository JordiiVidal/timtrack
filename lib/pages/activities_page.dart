import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:timtrack/widgets/activity_list.dart';
import 'package:timtrack/widgets/app_bar_custom.dart';
import 'package:timtrack/widgets/modal_create_activity.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarCustom(
              icon: null,
              pop: true,
              pushNamed: '',
              title: 'List Activities',
            ),
            SizedBox(
              height: 25,
            ),
            Expanded(
              child: ActivityList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBarModalBottomSheet(
            expand: true,
            duration: Duration(milliseconds: 600),
            context: context,
            backgroundColor: Colors.transparent,
            enableDrag: true,
            topControl: Container(
              height: 150,
            ),
            builder: (context) => ModalCreateActivity(),
          );
        },
        child: Icon(
          Icons.add,
        ),
        elevation: 3,
      ),
    );
  }
}
