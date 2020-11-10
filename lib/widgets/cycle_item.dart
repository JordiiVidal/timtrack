import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timtrack/bloc/cycles/cycles_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_event.dart';
import 'package:timtrack/models/cycle_model.dart';
import 'package:timtrack/utils/helpers.dart';
import 'package:timtrack/widgets/circle_status_cycle.dart';
import 'package:timtrack/widgets/text_cycle.dart';
import 'package:timtrack/widgets/time_line_paint.dart';

class CycleItem extends StatelessWidget {
  final Cycle cycle;
  final bool isLast;
  const CycleItem({Key key, this.cycle, this.isLast}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cycle.id),
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
                  CycleStatus(
                    cycle: cycle,
                  ),
                  isLast
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
                      cycle.activity.name,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      ' ${timestampToTime(cycle.dateStart, false)} - ${cycle.dateEnd != null ? timestampToTime(cycle.dateEnd, false) : ' ...'}',
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
                  (cycle.status == StatusCycle.ongoing)
                      ? statusOnGoing()
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              timestampToTime(
                                cycle.duration,
                                false,
                              ),
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Helvetica',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              timestampToTime(cycle.dateEnd, true),
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
                    child: TextCycle(
                      statusCycle: cycle.status,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      background: Container(
        decoration: BoxDecoration(
          color: Color(0xfff96b6b),
          boxShadow: <BoxShadow>[
            BoxShadow(
              blurRadius: 8,
              offset: Offset(-1, 2),
              color: Color(0XFFa2aecf),
            )
          ],
        ),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      onDismissed: (direction) {
        BlocProvider.of<CyclesBloc>(context).add(CycleDeleted(cycle));
      },
    );
  }

  Widget statusOnGoing() {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            '09',
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Helvetica',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '87',
            style: TextStyle(
              fontSize: 10,
              fontFamily: 'Helvetica',
              color: Colors.grey[400],
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
