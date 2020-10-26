import 'package:flutter/material.dart';

import 'package:timtrack/models/activity_model.dart';

class ActivityCircle extends StatelessWidget {
  final Activity activity;
  ActivityCircle({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.activity.name),
    );
  }
}
