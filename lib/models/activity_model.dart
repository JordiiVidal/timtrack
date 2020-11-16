import 'dart:convert';
import 'package:uuid/uuid.dart';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

var uuid = Uuid();

class Activity {
  Activity({this.name, this.deleted, String id}) : this.id = id ?? uuid.v4();

  String id;
  String name;
  bool deleted;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        deleted: json["deleted"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deleted": deleted ? 1 : 0,
      };
}
