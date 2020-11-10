import 'package:flutter/material.dart';
import 'package:timtrack/widgets/app_bar_custom.dart';
import 'package:timtrack/widgets/cycle_list.dart';
import 'package:timtrack/widgets/percent_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

 

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final gradient = Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          stops: [0.2, 0.5],
          colors: <Color>[
            Color(0xffffff),
            Color(0xfff5f5f5),
          ],
        ),
      ),
    );

    return Scaffold(
      key: UniqueKey(),
      body: Stack(
        children: [
          gradient,
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
                PercentIndicator(
                  size: size,
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
    );
  }
}
