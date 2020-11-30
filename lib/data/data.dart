import 'package:flutter/material.dart';

import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/models/cycle_model.dart';

List<Cycle> listCycles = [
  Cycle(
    activity: Activity(
      color: Colors.red,
      deleted: false,
      name: 'Activity 1',
      tags: ["sasd", "dsadas", "dsadas"],
    ),
    dateStart: DateTime.now().millisecondsSinceEpoch,
    dateEnd: null,
    status: StatusCycle.ongoing,
    tags: ["sasd", "dsadas"],
  )
];

List<Activity> activities = [
  Activity(
    color: Colors.red,
    deleted: false,
    name: 'Activity 1',
    tags: ["sasd", "dsadas", "dsadas"],
  ),
];
