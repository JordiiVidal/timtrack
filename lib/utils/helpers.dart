import 'package:flutter/material.dart';
import 'package:timtrack/models/cycle_model.dart';

String timestampToTime(int timestamp, bool onlySeconds) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var hour = (dateTime.hour < 10) ? '0${dateTime.hour}' : dateTime.hour;
  var minute = (dateTime.minute < 10) ? '0${dateTime.minute}' : dateTime.minute;
  var seconds =
      (dateTime.second < 10) ? '0${dateTime.second}' : dateTime.second;
  return (onlySeconds) ? '$seconds' : '$hour:$minute';
}

int diffTime(int dateStart, int dateEnd) {
  final int nowTime = new DateTime.now().millisecondsSinceEpoch;
  return (dateEnd == null) ? nowTime - dateStart : dateEnd - dateStart;
}

Widget statusToString(StatusCycle status) {
  String text;
  Color color;
  if (status == StatusCycle.completed) {
    text = 'completed';
    color = Colors.grey[400];
  } else if (status == StatusCycle.ongoing) {
    text = 'ongoing';
    color = Colors.grey[400];
  } else {
    text = 'pending';
    color = Color(0xfff96b6b);
  }

  return Text(
    text,
    style: TextStyle(
      fontSize: 15,
      fontFamily: 'Helvetica',
      color: color,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.lineThrough,
    ),
  );
}
