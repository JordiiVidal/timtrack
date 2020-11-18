import 'dart:convert';
import '../utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

Activity activityFromJson(String str) => Activity.fromJson(json.decode(str));

String activityToJson(Activity data) => json.encode(data.toJson());

var uuid = Uuid();

class Activity {
  Activity({this.name, this.deleted, String id, int totalCycles, Color color})
      : this.id = id ?? uuid.v4(),
        this.totalCycles = totalCycles ?? 0,
        this.color = color ?? Colors.black87;

  String id;
  String name;
  int totalCycles;
  Color color;
  bool deleted;

  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        name: json["name"],
        color: HexColor.fromHex(json["color"]),
        totalCycles: json["total_cycles"],
        deleted: json["deleted"] == 1 ? true : false,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "color": color.toHex(),
        "deleted": deleted ? 1 : 0,
      };
}
