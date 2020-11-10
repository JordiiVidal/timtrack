import 'package:flutter/material.dart';

class EmptyList extends StatelessWidget {
  final String asset;
  final String text;
  const EmptyList({Key key, @required this.asset, @required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              width: 100,
              child: Image.asset(asset),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Text(
                text,
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[500]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
