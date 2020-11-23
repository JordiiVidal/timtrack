import 'dart:convert';
import '../utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

var uuid = Uuid();

class Activity {
  Activity({
    this.name,
    String id,
    int totalCycles,
    Color color,
    List<String> tags,
    bool deleted,
  })  : this.id = id ?? uuid.v4(),
        this.totalCycles = totalCycles ?? 0,
        this.color = color ??  Colors.grey[600],
        this.tags = tags ?? [],
        this.deleted = deleted ?? false;

  String id;
  String name;
  int totalCycles;
  Color color;
  List<String> tags;
  bool deleted;

  Activity copyWith({
    String id,
    String name,
    int totalCycles,
    Color color,
    List<String> tags,
    bool deleted,
  }) {
    return Activity(
      id: id ?? this.id,
      name: name ?? this.name,
      totalCycles: totalCycles ?? this.totalCycles,
      color: color ?? this.color,
      tags: tags ?? this.tags,
      deleted: deleted ?? this.deleted,
    );
  }

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        color: HexColor.fromHex(json["color"]),
        totalCycles: json["total_cycles"],
        tags: jsonDecode(json["tags"]),
        deleted: json["deleted"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color.toHex(),
        "deleted": deleted ? 1 : 0,
        "tags": jsonEncode(tags),
      };
}
