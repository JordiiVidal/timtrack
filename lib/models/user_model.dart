import 'dart:convert';

import 'package:timtrack/models/activity_model.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.activities,
  });

  final int id;
  final String name;
  final List<Activity> activities;

  User copyWith({
    String name,
    List<Activity> activities,
  }) {
    return new User(
      name: name ?? this.name,
      activities: activities ?? this.activities,
    );
  }
  

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        activities: List<Activity>.from(json["activities"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "activities": List<dynamic>.from(activities.map((x) => x)),
      };
}
