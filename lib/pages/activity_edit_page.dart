import 'package:flutter/material.dart';
import 'package:timtrack/models/activity_model.dart';
import 'package:timtrack/widgets/cycle_list.dart';

import 'package:timtrack/widgets/icon_shadow.dart';

class ActivityEditPage extends StatelessWidget {
  final Activity activity;
  const ActivityEditPage({Key key, @required this.activity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ActivityHeader(
                activity: activity,
              ),
              ActivityInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('sasas'),
        );
      },
    );
  }
}

class ActivityInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _cardInfo('Invested Time', '232h'),
          _cardInfo('Usually Days', 'Mo, Tu, Su'),
        ],
      ),
    );
  }

  Widget _cardInfo(String title, String value) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: <BoxShadow>[
          BoxShadow(
            blurRadius: 8,
            offset: Offset(-1, 2),
            color: Color(0XFFd6dbea),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            maxRadius: 5,
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              title,
              style: TextStyle(color: Colors.grey[500]),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityHeader extends StatelessWidget {
  final Activity activity;

  const ActivityHeader({Key key, @required this.activity}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                backgroundColor: activity.color,
              ),
              Text(
                activity.name,
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              IconShadow(
                pushNamed: '',
                pop: true,
                icon: Icons.close,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
