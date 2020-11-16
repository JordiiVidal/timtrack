import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:timtrack/utils/helpers.dart';
import 'package:timtrack/widgets/app_bar_custom.dart';
import 'package:timtrack/widgets/cycle_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

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
                  title: 'TimLine',
                  icon: Icons.filter_list,
                  pushNamed: '/activities',
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: CycleList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items: <Widget>[
          Icon(Icons.add, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.compare_arrows, size: 30, color: Colors.white),
        ],
        color: Colors.black87,
        buttonBackgroundColor:Colors.black87,
        backgroundColor: Color(0xffffff),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

enum _SelectedTab { home, likes, search, profile }
