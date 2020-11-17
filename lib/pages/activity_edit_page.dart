import 'package:flutter/material.dart';

import 'package:timtrack/widgets/icon_shadow.dart';

class ActivityEditPage extends StatelessWidget {
  const ActivityEditPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              IconShadow(
                pushNamed: '',
                pop: true,
                icon: Icons.arrow_back_ios,
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
