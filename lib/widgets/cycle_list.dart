import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timtrack/bloc/cycle/cycle_bloc.dart';
import 'package:timtrack/widgets/cycle_listitle.dart';

class CycleList extends StatefulWidget {
  const CycleList({Key key}) : super(key: key);

  @override
  _CycleListState createState() => _CycleListState();
}

class _CycleListState extends State<CycleList> {
  CycleBloc cycleBloc;

  @override
  void initState() {
    super.initState();
    cycleBloc = BlocProvider.of<CycleBloc>(context);
    cycleBloc.add(GetCycles());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: BlocBuilder<CycleBloc, CycleState>(
        builder: (context, state) {
          if (state.list.isEmpty) {
            return Container();
          }
          return Container(
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: state.list.length,
              itemBuilder: (_, i) => CycleListTile(
                cycle: state.list[i],
              ),
            ),
          );
        },
      ),
    );
  }
}
