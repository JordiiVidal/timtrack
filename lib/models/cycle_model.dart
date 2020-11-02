import 'dart:convert';

import 'package:timtrack/models/activity_model.dart';

Cycle cycleFromJson(String str) => Cycle.fromJson(json.decode(str));

String cycleToJson(Cycle data) => json.encode(data.toJson());

class Cycle {
  Cycle({
    this.id,
    this.activity,
    this.dateStart,
    this.dateEnd,
    this.active,
  });

  int id;
  Activity activity;
  int dateStart;
  int dateEnd;
  bool active;

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
        id: json["id"],
        activity: json["activity"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        active: json["active"] == 1 ? true : false,
      );

  factory Cycle.fromJsonJoin(Map<String, dynamic> json) => Cycle(
        id: json["id"],
        activity: Activity(
          id: json['id_activity'],
          name: json['name'],
          duration: json['duration'],
          active: true,
          deleted: false,
        ),
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        active: json["active"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_activity": activity.id,
        "date_start": dateStart,
        "date_end": dateEnd,
        "active": active ? 1 : 0,
      };
}
