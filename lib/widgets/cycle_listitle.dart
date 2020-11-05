import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timtrack/bloc/cycle/cycle_bloc.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/utils/helpers.dart';
import 'package:timtrack/widgets/time_line_paint.dart';

class CycleListTile extends StatefulWidget {
  final Cycle cycle;
  final bool isLast;
  const CycleListTile({Key key, this.cycle, this.isLast}) : super(key: key);

  @override
  _CycleListTileState createState() => _CycleListTileState();
}

class _CycleListTileState extends State<CycleListTile> {
  StopWatchTimer _stopWatchTimer;
  SlidableController _slidableController;
  bool isOpen = false;
  void handleSlideIsOpenChanged(bool isOpen) {
    setState(() {
      isOpen = !isOpen;
    });
  }

  int _initialData;

  @override
  void initState() {
    super.initState();
    _slidableController =
        SlidableController(onSlideIsOpenChanged: (isOpen) => print(isOpen));
    _stopWatchTimer = StopWatchTimer();
    _initialData = diffTime(widget.cycle.dateStart, null);
    if (widget.cycle.status == StatusCycle.ongoing) {
      _stopWatchTimer.setPresetTime(
        mSec: _initialData,
      );
      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    }
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    print(widget.cycle.dateEnd);
    return Slidable(
      controller: _slidableController,
      key: UniqueKey(),
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.30,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
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
                  circleStatusCylce(widget.cycle.status),
                  widget.isLast
                      ? Container()
                      : Container(
                          height: 43,
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
                  (widget.cycle.status == StatusCycle.ongoing)
                      ? statusOnGoing()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              timestampToTime(
                                widget.cycle.duration,
                                false,
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              timestampToTime(widget.cycle.dateEnd, true),
                              style: TextStyle(
                                fontSize: 10,
                                fontFamily: 'Helvetica',
                                color: Colors.grey[400],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                  Container(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      widget.cycle.activity.name,
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Helvetica',
                        color: Colors.grey[400],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      secondaryActions: (widget.cycle.status == StatusCycle.completed)
          ? []
          : actionsOnGoing(),
    );
  }

  List<Widget> actionsOnGoing() {
    return <Widget>[
      Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xfff9ab5c),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 8,
              offset: Offset(-1, 2),
              color: Color(0XFFa2aecf),
            )
          ],
        ),
        child: IconSlideAction(
          caption: 'Finish',
          icon: Icons.stop,
          color: Colors.transparent,
          closeOnTap: true,
          onTap: () {
            Cycle cycle = widget.cycle;
            cycle.status = StatusCycle.completed;
            cycle.dateEnd = new DateTime.now().millisecondsSinceEpoch;
            cycle.duration = cycle.dateEnd - cycle.dateStart;
            BlocProvider.of<CycleBloc>(context).add(UpdateCycle(cycle));
            _stopWatchTimer.dispose();
          },
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 10, bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Color(0xfff96b6b),
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
          icon: Icons.delete,
          color: Colors.transparent,
          closeOnTap: true,
          onTap: () => {},
        ),
      ),
    ];
  }

  Widget statusOnGoing() {
    return Container(
      child: StreamBuilder<int>(
        stream: _stopWatchTimer.rawTime,
        initialData: _initialData,
        builder: (context, snap) {
          final value = snap.data;
          final displayTime = StopWatchTimer.getDisplayTime(
            value,
            milliSecond: false,
            hours: true,
            second: false,
          );
          final displaySeconds = StopWatchTimer.getDisplayTime(
            value,
            milliSecond: false,
            hours: false,
            second: true,
            minute: false,
          );
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                displayTime,
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                displaySeconds,
                style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'Helvetica',
                  color: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget circleStatusCylce(StatusCycle status) {
    if (status == StatusCycle.completed) {
      return Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xff2dd2b4),
        ),
        child: Center(
          child: Icon(
            Icons.check,
            color: Colors.white,
            size: 13,
          ),
        ),
      );
    } else if (status == StatusCycle.ongoing) {
      return Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Color(0xffE93031),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Color(0xfffaf9fe),
          ),
          child: Center(
            child: IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () =>
                  _stopWatchTimer.onExecute.add(StopWatchExecute.stop),
              icon: Icon(
                Icons.pause,
                size: 21,
                color: Color(0xffE93031),
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
        height: 20,
        width: 20,
        padding: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.orangeAccent,
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
