import 'dart:convert';

import 'package:timtrack/models/activity_model.dart';

Cycle cycleFromJson(String str) => Cycle.fromJson(json.decode(str));

String cycleToJson(Cycle data) => json.encode(data.toJson());

//
enum StatusCycle { pending, ongoing, completed }

class Cycle  {

  int id;
  Activity activity;
  int dateStart;
  int dateEnd;
  int duration;
  StatusCycle status; 
  Cycle({
    this.id,
    this.activity,
    this.dateStart,
    this.dateEnd,
    this.duration,
    this.status,
  });

  

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
        id: json["id"],
        activity: json["activity"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        status: intToStatus(json["status"]),
        duration: json["duration"],
      );

  factory Cycle.fromJsonJoin(Map<String, dynamic> json) => Cycle(
        id: json["id"],
        activity: Activity(
          id: json['id_activity'],
          name: json['name'],
          deleted: false,
        ),
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        status: intToStatus(json["status"]),
        duration: json["duration"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_activity": activity.id,
        "date_start": dateStart,
        "date_end": dateEnd,
        "duration": duration,
        "status": statusToInt(status),
      };
}

StatusCycle intToStatus(int status) {
  if (status == 1) {
    return StatusCycle.ongoing;
  } else if (status == 2) {
    return StatusCycle.completed;
  }
  return StatusCycle.pending;
}

int statusToInt(StatusCycle status) {
  if (status == StatusCycle.completed) {
    return 2;
  } else if (status == StatusCycle.ongoing) {
    return 1;
  }
  return 0;
}
