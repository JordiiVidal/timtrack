import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycle/cycle_bloc.dart';
import 'package:timtrack/widgets/cycle_listitle.dart';

class CycleList extends StatelessWidget {
  const CycleList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: BlocBuilder<CycleBloc, CycleState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (_, i) => CycleListTile(
              cycle: state.list[i],
            ),
          );
        },
      ),
    );
  }
}
