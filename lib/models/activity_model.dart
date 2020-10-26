import 'dart:convert';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

class Activity {
  Activity({
    this.id,
    this.name,
    this.duration,
    this.avatar,
    this.idCategory,
  });

  int id;
  String name;
  int duration;
  String avatar;
  int idCategory;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        duration: json["duration"],
        avatar: json["avatar"],
        idCategory: json["idCategory"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration": duration,
        "avatar": avatar,
        "idCategory": idCategory,
      };
}
