import 'package:flutter/material.dart';

class TimeLinePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    ///Propiedades
    paint.color = Colors.grey[300];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    var max = size.height; // size gets to width
    var dashWidth = 5;
    var dashSpace = 5;
    double startX = 0;
    final space = (dashSpace + dashWidth);

    while (startX < max) {
      canvas.drawLine(Offset(0, startX), Offset(0, startX + dashWidth), paint);
      startX += space;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
