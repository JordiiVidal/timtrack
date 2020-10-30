import 'dart:convert';

import 'package:timtrack/models/activity_model.dart';

Cycle cycleFromJson(String str) => Cycle.fromJson(json.decode(str));

String cycleToJson(Cycle data) => json.encode(data.toJson());

class Cycle {
  Cycle({
    this.activity,
    this.dateStart,
    this.dateEnd,
    this.active,
  });

  Activity activity;
  String dateStart;
  String dateEnd;
  bool active;

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
        activity: json["activity"],
        dateStart: json["dateStart"],
        dateEnd: json["dateEnd"],
        active: json["active"],
      );

  Map<String, dynamic> toJson() => {
        "Activity": activity,
        "dateStart": dateStart,
        "dateEnd": dateEnd,
        "active": active,
      };
}
