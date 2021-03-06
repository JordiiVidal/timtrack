import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
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

changeColor(Color statusColor, Color navigationColor) async {
  try {
    await FlutterStatusbarcolor.setStatusBarColor(statusColor, animate: true);
    await FlutterStatusbarcolor.setNavigationBarColor(navigationColor,
        animate: true);
    FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
    FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
  } on PlatformException catch (e) {
    debugPrint(e.toString());
  }
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
    height: 5,
    width: 48,
    decoration: BoxDecoration(
      color: Colors.black45,
      borderRadius: BorderRadius.circular(6),
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

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
