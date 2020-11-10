import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles.dart';
import 'package:timtrack/models/cycle_model.dart';

class CycleStatus extends StatelessWidget {
  final Cycle cycle;
  const CycleStatus({Key key, this.cycle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (cycle.status == StatusCycle.completed) {
      return _completed();
    } else if (cycle.status == StatusCycle.ongoing) {
      return _ongoing(context);
    } else {
      return _pending();
    }
  }

  Widget _pending() {
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

  Widget _completed() {
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
  }

  Widget _ongoing(BuildContext context) {
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
            onPressed: () {
              Cycle element = cycle.copyWith(
                duration: 21,
                dateEnd: 32131,
                status: StatusCycle.completed,
              );

              BlocProvider.of<CyclesBloc>(context).add(CycleUpdated(element));
            },
            icon: Icon(
              Icons.pause,
              size: 21,
              color: Color(0xffE93031),
            ),
          ),
        ),
      ),
    );
  }
}
