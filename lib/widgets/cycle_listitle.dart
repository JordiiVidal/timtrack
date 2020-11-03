import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleListTile extends StatefulWidget {
  final Cycle cycle;
  const CycleListTile({Key key, this.cycle}) : super(key: key);

  @override
  _CycleListTileState createState() => _CycleListTileState();
}

class _CycleListTileState extends State<CycleListTile> {
  final StopWatchTimer _stopWatchTimer = StopWatchTimer();

  @override
  void initState() {
    super.initState();
    print(widget.cycle.dateStart);
    _stopWatchTimer.setPresetTime(
      mSec: diffTime(),
    );
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose(); // Need to call dispose function.
  }

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.25,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(
              color: Color(0xfffd3d3d3),
            ),
            left: BorderSide(
              color: Color(0xff11d764),
              width: 3,
            ),
          ),
        ),
        child: ListTile(
          title: Text(
            widget.cycle.activity.name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          subtitle: StreamBuilder<int>(
            key: GlobalKey(),
            stream: _stopWatchTimer.rawTime,
            initialData: 0,
            builder: (context, snap) {
              final value = snap.data;
              final displayTime = StopWatchTimer.getDisplayTime(value);
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  displayTime,
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'Helvetica',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
          trailing: CircleAvatar(
            radius: 10,
            backgroundColor: Color(0xff11d764),
          ),
        ),
      ),
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Finish',
          color: Colors.red,
          icon: Icons.stop,
          closeOnTap: true,
          onTap: () => _stopWatchTimer.onExecute.add(StopWatchExecute.stop),
        ),
      ],
    );
  }

  int diffTime() {
    final int nowTime = new DateTime.now().millisecondsSinceEpoch;
    return nowTime - widget.cycle.dateStart;
  }
}
