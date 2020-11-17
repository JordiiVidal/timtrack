import 'dart:async';

import 'package:flutter/material.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/utils/helpers.dart';

class CycleTimer extends StatefulWidget {
  final Cycle cycle;
  CycleTimer({Key key, this.cycle}) : super(key: key);

  @override
  _CycleTimerState createState() => _CycleTimerState();
}

class _CycleTimerState extends State<CycleTimer> {
  int _timestampDuration = 0; //seconds
  DateTime _start;

  void _initTimer() {
    final DateTime _now = new DateTime.now();
    final int timestampStart = widget.cycle.dateStart;
    _start = DateTime.fromMillisecondsSinceEpoch(timestampStart);
    _timestampDuration = _now.difference(_start).inSeconds;
  }

  void _updateDuration() {
    final DateTime _now = new DateTime.now();
    if (this.mounted) {
      setState(() {
        _timestampDuration = _now.difference(_start).inSeconds;
      });
    }
  }

  @override
  void initState() {
    if (widget.cycle.status == StatusCycle.ongoing) {
      _initTimer();
      Timer.periodic(Duration(seconds: 1), (Timer t) => _updateDuration());
    } else {
      _timestampDuration = widget.cycle.duration;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            durationToTime(_timestampDuration),
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            durationToSeconds(_timestampDuration),
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Helvetica',
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
