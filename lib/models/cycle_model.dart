import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:uuid/uuid.dart';

Cycle cycleFromJson(String str) => Cycle.fromJson(json.decode(str));

String cycleToJson(Cycle data) => json.encode(data.toJson());

//
enum StatusCycle { pending, ongoing, completed }
var uuid = Uuid();

class Cycle extends Equatable {
  final String id;
  final Activity activity;
  final int dateStart;
  final int dateEnd;
  final int duration;
  final StatusCycle status;
  Cycle(
      {this.activity,
      this.dateStart,
      this.dateEnd,
      this.duration,
      this.status,
      String id})
      : this.id = id ?? uuid.v4();

  Cycle copyWith(
      {int dateStart,
      int dateEnd,
      int duration,
      StatusCycle status,
      Activity activity}) {
    return Cycle(
      activity: activity ?? this.activity,
      id: id ?? this.id,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      duration: duration ?? this.duration,
      status: status ?? this.status,
    );
  }

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

  @override
  List<Object> get props => [id, activity, dateStart, dateEnd, duration];

  @override
  String toString() {
    return 'Cycle - #$id - $duration - $dateEnd - $dateStart - $status';
  }
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
