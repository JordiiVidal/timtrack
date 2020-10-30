import 'dart:convert';

import 'package:timtrack/models/activity_model.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.name,
  });

  final String name;

  User copyWith({
    String name,
  }) {
    return new User(
      name: name ?? this.name,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}
