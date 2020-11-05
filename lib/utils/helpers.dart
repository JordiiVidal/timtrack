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
