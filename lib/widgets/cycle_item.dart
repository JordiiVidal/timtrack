import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:timtrack/bloc/cycles/cycles.dart';

import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/utils/helpers.dart';
import 'package:timtrack/widgets/circle_status_cycle.dart';
import 'package:timtrack/widgets/text_cycle.dart';
import 'package:timtrack/widgets/time_line_paint.dart';

class CycleItem extends StatefulWidget {
  final Cycle cycle;
  final bool isLast;
  const CycleItem({Key key, this.cycle, this.isLast}) : super(key: key);

  @override
  _CycleItemState createState() => _CycleItemState();
}

class _CycleItemState extends State<CycleItem> {
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
    _initTimer();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _updateDuration());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 0,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CycleStatus(
                    cycle: widget.cycle,
                  ),
                  Container(
                    height: 40,
                    child: CustomPaint(
                      painter: TimeLinePaint(),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.cycle.activity.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      ' ${timestampToTime(widget.cycle.dateStart, false)} - ${widget.cycle.dateEnd != null ? timestampToTime(widget.cycle.dateEnd, false) : ' ...'}',
                      style: TextStyle(
                        letterSpacing: -0.8,
                        fontSize: 13,
                        color: Colors.grey[500],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  durationTimer(
                    widget.cycle.status == StatusCycle.ongoing
                        ? _timestampDuration
                        : widget.cycle.duration,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 3),
                    child: TextCycle(
                      statusCycle: widget.cycle.status,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      secondaryActions: [
        Container(
          decoration: BoxDecoration(
            boxShadow: <BoxShadow>[
              BoxShadow(
                blurRadius: 8,
                offset: Offset(-1, 2),
                color: Color(0XFFa2aecf),
              )
            ],
          ),
          child: IconSlideAction(
            caption: 'Delete',
            color: Color(0xfff96b6b),
            icon: Icons.delete,
            onTap: () {
              BlocProvider.of<CyclesBloc>(context).add(
                CycleDeleted(widget.cycle),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget durationTimer(int duration) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            durationToTime(duration),
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
            ),
          ),
           Text(
            durationToSeconds(duration),
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
