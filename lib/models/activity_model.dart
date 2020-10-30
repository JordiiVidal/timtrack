import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
    this.id,
    this.name,
    this.duration,
    this.active,
    this.deleted,
  });

  int id;
  String name;
  int duration;
  bool active;
  bool deleted;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        active: json["active"] == 1 ? true : false,
        deleted: json["deleted"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "active": active ? 1 : 0,
        "deleted": deleted ? 1 : 0,
      };
}
