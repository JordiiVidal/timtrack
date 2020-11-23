import 'package:flutter/material.dart';

import 'package:timtrack/widgets/calendar.dart';
import 'package:timtrack/widgets/cycle_list.dart';

class TabCycles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Calendar(),
          CycleList(),
        ],
      ),
    );
  }
}
