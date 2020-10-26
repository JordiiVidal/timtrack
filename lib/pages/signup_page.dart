import 'package:flutter/material.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/widgets/activity_circle.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Activity> _activities = [
      Activity(
        id: 1,
        name: 'Running',
        duration: 344,
        avatar: 'd',
        idCategory: 1,
      ),
      Activity(
        id: 2,
        name: 'Fishing',
        duration: 44,
        avatar: 'd',
        idCategory: 2,
      ),
      Activity(
        id: 3,
        name: 'Read',
        duration: 320,
        avatar: 'd',
        idCategory: 2,
      ),
      Activity(
        id: 3,
        name: 'Water',
        duration: 320,
        avatar: 'd',
        idCategory: 3,
      ),
      Activity(
        id: 3,
        name: 'Music',
        duration: 320,
        avatar: 'd',
        idCategory: 3,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Nombre'),
            Container(
              color: Colors.yellow,
              child: TextField(),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    color: Colors.red,
                    child: ListView.builder(
                      itemCount: _activities.length,
                      itemBuilder: (c, i) => ActivityCircle(
                        activity: _activities[i],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.blue,
                      child: RaisedButton(
                        onPressed: () => {},
                        child: Text('Empezar'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
