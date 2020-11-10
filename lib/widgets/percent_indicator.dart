import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timtrack/bloc/cycle/cycle_bloc.dart';

class PercentIndicator extends StatelessWidget {
  final Size size;
  const PercentIndicator({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0XFFa2aecf),
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: size.width * 0.1,
      ),
      child: BlocBuilder<CycleBloc, CycleState>(
        builder: (context, state) {
          final double percent = (state.totalCycles == 0)
              ? 0
              : (state.completedCycles / state.totalCycles) * 10;
              print(state.completedCycles);
              print(state.totalCycles);
          return Row(
            children: [
              LinearPercentIndicator(
                width: size.width * 0.80,
                lineHeight: 14.0,
                percent: percent,
                center: Text('$percent %'),
                backgroundColor: Colors.white,
                progressColor: Color(0xff2dd2b4),
                linearStrokeCap: LinearStrokeCap.roundAll,
              ),
            ],
          );
        },
      ),
    );
  }
}
