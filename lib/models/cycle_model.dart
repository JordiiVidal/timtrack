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
  final List<String> tags;
  Cycle(
      {this.activity,
      this.dateStart,
      this.dateEnd,
      this.duration,
      this.status,
      String id,
      List<String> tags})
      : this.id = id ?? uuid.v4(),
        this.tags = tags ?? [];

  Cycle copyWith(
      {int dateStart,
      int dateEnd,
      int duration,
      StatusCycle status,
      List<String> tags,
      Activity activity}) {
    return Cycle(
      activity: activity ?? this.activity,
      id: id ?? this.id,
      dateStart: dateStart ?? this.dateStart,
      dateEnd: dateEnd ?? this.dateEnd,
      duration: duration ?? this.duration,
      status: status ?? this.status,
      tags: tags ?? this.tags,
    );
  }

  factory Cycle.fromJson(Map<String, dynamic> json) => Cycle(
        id: json["id"],
        activity: json["activity"],
        dateStart: json["date_start"],
        dateEnd: json["date_end"],
        status: intToStatus(json["status"]),
        duration: json["duration"],
        tags: jsonDecode(json["tags"]),
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
        tags: jsonDecode(json["tags"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_activity": activity.id,
        "date_start": dateStart,
        "date_end": dateEnd,
        "duration": duration,
        "tags": jsonEncode(tags),
        "status": statusToInt(status),
      };

  @override
  List<Object> get props => [id, activity, dateStart, dateEnd, duration, tags];

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
