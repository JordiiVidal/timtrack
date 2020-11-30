import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'package:timtrack/widgets/calendar.dart';
import 'package:timtrack/widgets/cycle_list.dart';

import 'package:timtrack/widgets/app_bar_custom.dart';
import 'package:timtrack/widgets/list_activity.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> _homePageScaffoldKey =
      new GlobalKey<ScaffoldState>();
  final PanelController _pc = new PanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0eff7),
      key: _homePageScaffoldKey,
      body: SlidingUpPanel(
        controller: _pc,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.0),
          topRight: Radius.circular(24.0),
        ),
        minHeight: 40,
        body: _body(),
        panelBuilder: (ScrollController sc) => ListActivity(sc: sc),
      ),
    );
  }
}

Widget _body() {
  return SafeArea(
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppBarCustom(
          title: 'TimTrack',
        ),
        Expanded(
          child: Container(
            child: Column(
              children: [
                Calendar(),
                CycleList(),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

///enum _SelectedTab { home, likes, search, profile }
