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
    return BlocBuilder<CycleBloc, CycleState>(
      builder: (context, state) {
        if (state.list.isEmpty) {
          return Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                  width: 100,
                  child: Image.asset('assets/empty_list.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text(
                    "You'r so lazy ...",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[500]),
                  ),
                )
              ],
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: state.list.length,
          itemBuilder: (_, i) => CycleListTile(
            cycle: state.list[i],
            isLast: i == state.list.length - 1 ? true : false,
          ),
        );
      },
    );
  }
}
