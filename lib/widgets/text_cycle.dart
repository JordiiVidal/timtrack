import 'package:flutter/material.dart';
import 'package:timtrack/models/cycle_model.dart';

class TextCycle extends StatelessWidget {
  final String textContent;
  final StatusCycle statusCycle;
  final double fontSizes;
  final FontWeight fontWeight;
  final double letterSpacing;

  const TextCycle(
      {Key key,
      this.statusCycle,
      this.fontSizes,
      this.fontWeight,
      this.textContent,
      this.letterSpacing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;
    Color color;
    bool isStroke = false;
    if (statusCycle == StatusCycle.completed) {
      text = 'completed';
      color = Colors.grey[400];
      isStroke = true;
    } else if (statusCycle == StatusCycle.ongoing) {
      text = 'ongoing';
      color = Color(0xfff96b6b);
    } else {
      text = 'pending';
      color = Colors.grey[400];
    }
    text = textContent ?? text;
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSizes ?? 15,
        fontFamily: 'Helvetica',
        color: color,
        fontWeight: fontWeight ?? FontWeight.w500,
        decoration: (isStroke) ? TextDecoration.lineThrough : null,
        letterSpacing: letterSpacing ?? 1.5,
      ),
    );
  }
}
