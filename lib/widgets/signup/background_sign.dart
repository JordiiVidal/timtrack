import 'package:flutter/material.dart';

class BackgroundSign extends StatelessWidget {
  final Size size;
  const BackgroundSign({Key key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gradient = Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.elliptical(100, 20),
            bottomRight: Radius.elliptical(100, 20)),
        gradient: LinearGradient(
          colors: <Color>[
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 1178, 1.0),
          ],
        ),
      ),
    );

    final circle = Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );
    return Stack(
      children: <Widget>[
        gradient,
        Positioned(
          top: 90,
          left: 30,
          child: circle,
        ),
        Positioned(
          top: 0,
          right: 10,
          child: circle,
        ),
      ],
    );
  }
}
