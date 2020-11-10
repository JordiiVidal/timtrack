import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:timtrack/bloc/cycles/cycles_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_state.dart';

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
      child: BlocBuilder<CyclesBloc, CyclesState>(
        builder: (context, state) {
          
          return Row(
            children: [
              LinearPercentIndicator(
                width: size.width * 0.80,
                lineHeight: 14.0,
                percent: 0.4,
                center: Text('s %'),
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
