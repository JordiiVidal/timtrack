import 'package:flutter/material.dart';
import 'package:timtrack/widgets/cycle_list.dart';

class HomePage extends StatelessWidget {
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
          colors: <Color>[Color(0xfffbfbfd), Color(0xfffaf9fe)],
        ),
      ),
    );

    return Scaffold(
      key: UniqueKey(),
      backgroundColor: Color(0xfffaf9fe),
      body: Stack(
        children: [
          gradient,
          SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'TimTrack',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      IconButton(
                        padding: const EdgeInsets.all(0),
                        icon: Icon(Icons.filter_list),
                        onPressed: () =>
                            Navigator.pushNamed(context, '/addActivity'),
                      )
                    ],
                  ),
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
