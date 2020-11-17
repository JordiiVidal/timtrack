import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:timtrack/bloc/navigation/navigation.dart';
import 'package:timtrack/bloc/navigation/navigation_bloc.dart';

import 'package:timtrack/widgets/activity_list.dart';
import 'package:timtrack/widgets/app_bar_custom.dart';
import 'package:timtrack/widgets/create_activity.dart';
import 'package:timtrack/widgets/cycle_list.dart';

import 'package:timtrack/utils/helpers.dart';

class HomePage extends StatelessWidget {
  final GlobalKey _bottomNavigationKey = GlobalKey();

  final List<Widget> _tabs = [CreateActivity(), CycleList(), ActivityList()];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: UniqueKey(),
      body: Stack(
        children: [
          gradientBackground(size),
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBarCustom(
                  title: 'TimTrack',
                ),
                Expanded(
                  child: BlocBuilder<NavigationBloc, NavigationState>(
                    builder: (context, state) {
                      if (state is NavigationLoadSuccess) {
                        return Container(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          child: _tabs[state.index],
                        );
                      } else {
                        return Container(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return CurvedNavigationBar(
            key: _bottomNavigationKey,
            index: 1,
            height: 50.0,
            items: <Widget>[
              Icon(Icons.add, size: 30, color: Colors.white),
              Icon(Icons.home, size: 30, color: Colors.white),
              Icon(Icons.compare_arrows, size: 30, color: Colors.white),
            ],
            color: Colors.black87,
            buttonBackgroundColor: Colors.black87,
            backgroundColor: Color(0xffffff),
            animationCurve: Curves.easeInOut,
            animationDuration: Duration(milliseconds: 600),
            onTap: (index) => BlocProvider.of<NavigationBloc>(context)
                .add(NavigationUpdated(index)),
          );
        },
      ),
    );
  }
}

///enum _SelectedTab { home, likes, search, profile }
