import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_bloc.dart';
import 'package:timtrack/bloc/cycles/cycles_state.dart';
import 'package:timtrack/data/data.dart';
import 'package:timtrack/widgets/cycle_item.dart';
import 'package:timtrack/widgets/empty_list.dart';

class CycleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CyclesBloc, CyclesState>(
      builder: (context, state) {
        if (state is CylcesLoadInProgress) {
          return Container(
            child: CircularProgressIndicator(),
            width: 40,
            height: 40,
          );
        } else if (state is CyclesLoadSuccess) {
          final cycles = listCycles;
          if (cycles.isEmpty)
            return EmptyList(
              asset: 'assets/empty_list.png',
              text: "You'r so lazy ...",
            );
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: cycles.length,
              itemBuilder: (_, i) => CycleItem(
                cycle: cycles[i],
                isLast: i == cycles.length - 1 ? true : false,
              ),
            ),
          );
        } else {
          return Container(
            child: Text('Error'),
          );
        }
      },
    );
  }
}
