import 'dart:convert';
import 'package:uuid/uuid.dart';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

var uuid = Uuid();

class Activity {
  Activity({this.name, this.deleted, String id, int totalCycles, int color})
      : this.id = id ?? uuid.v4(),
        this.totalCycles = totalCycles ?? 0,
        this.color = color ?? 0XFF303030;

  String id;
  String name;
  int totalCycles;
  int color;
  bool deleted;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        color: json["color"],
        totalCycles: json["total_cycles"],
        deleted: json["deleted"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color,
        "deleted": deleted ? 1 : 0,
      };
}
