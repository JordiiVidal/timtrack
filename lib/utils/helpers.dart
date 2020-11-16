import 'package:flutter/material.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:intl/intl.dart';

String timestampToTime(int timestamp, bool onlySeconds) {
  var dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var hour = (dateTime.hour < 10) ? '0${dateTime.hour}' : dateTime.hour;
  var minute = (dateTime.minute < 10) ? '0${dateTime.minute}' : dateTime.minute;
  var seconds =
      (dateTime.second < 10) ? '0${dateTime.second}' : dateTime.second;
  return (onlySeconds) ? '$seconds' : '$hour:$minute';
}

String durationToTime(int seconds) {
  final hours = ((seconds / 3600).round()) % 60;
  final minutes = ((seconds / 60).round()) % 60;
  var hour = (hours < 10) ? '0$hours' : hours;
  var minute = (minutes < 10) ? '0$minutes' : minutes;
  return '$hour:$minute';
}

String durationToSeconds(int seconds) {
  final second = seconds.round() % 60;
  return (second < 10) ? '0$second' : second.toString();
}

int durationCycle(int timestampStart) {
  final DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestampStart);
  final DateTime now = DateTime.now();
  return now.difference(dateTime).inSeconds;
}

int diffTime(int dateStart, int dateEnd) {
  final int nowTime = new DateTime.now().millisecondsSinceEpoch;
  return (dateEnd == null) ? nowTime - dateStart : dateEnd - dateStart;
}

String formatDateTime(DateTime dateTime) {
  return DateFormat.Hm().format(dateTime);
}

Widget modalBar() {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    height: 6,
    width: 40,
    decoration: BoxDecoration(
      color: Colors.black54,
      borderRadius: BorderRadius.circular(6),
    ),
  );
}

Widget gradientBackground(Size size) {
  return Container(
    height: size.height,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        stops: [0.2, 0.5],
        colors: <Color>[
          Color(0xffffff),
          Color(0xfff5f5f5),
        ],
      ),
    ),
  );
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
