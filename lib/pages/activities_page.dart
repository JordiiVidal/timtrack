import 'package:flutter/material.dart';

import 'package:timtrack/widgets/activity_list.dart';
import 'package:timtrack/widgets/app_bar_custom.dart';

class ActivitiesPage extends StatelessWidget {
  const ActivitiesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBarCustom(
              icon: Icons.add,
              pop: true,
              pushNamed: '/addActivity',
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
    );
  }
}
