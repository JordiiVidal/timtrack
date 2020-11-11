import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';

class ChipsStateCycle extends StatefulWidget {
  const ChipsStateCycle({Key key}) : super(key: key);

  @override
  _ChipsStateCycleState createState() => _ChipsStateCycleState();
}

class _ChipsStateCycleState extends State<ChipsStateCycle> {
  String tags = '';
  List<String> options = [
    'Pending',
    'Ongoing',
    'Completed',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ChipsChoice<String>.single(
        value: tags,
        onChanged: (val) => setState(() => tags = val),
        choiceItems: C2Choice.listFrom<String, String>(
          source: options,
          value: (i, v) => v,
          label: (i, v) => v,
        ),
      ),
    );
  }
}
