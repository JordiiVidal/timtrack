import 'package:flutter/material.dart';

class TimeLinePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = new Paint();

    ///Propiedades
    paint.color = Colors.grey[300];
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 2;

    final path = new Path(); // 0,0
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
