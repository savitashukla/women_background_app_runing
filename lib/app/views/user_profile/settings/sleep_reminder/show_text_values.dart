import 'dart:math';

import 'package:flutter/material.dart';

class ClockPainterText extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;

    // Draw numbers around the circle
    final double angleStep = 2 * pi / 12;
    final double textRadius = radius - 20; // Radius for text position adjustment
    final double fontSize = 16;

    // Positioning the number 12 at the top center
    final double x12 = size.width / 2;
    final double y12 = 20; // Adjust this value as needed for vertical alignment

    TextPainter textPainter12 = TextPainter(
      text: TextSpan(
        text: '12',
        style: TextStyle(color: Colors.black, fontSize: fontSize),
      ),
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter12.layout();
    textPainter12.paint(canvas, Offset(x12 - textPainter12.width / 2, y12 - textPainter12.height / 2));

    // Draw the remaining numbers
    for (int i = 1; i <= 11; i++) {
      final double angle = -pi / 2 + i * angleStep;
      final double x = radius + textRadius * cos(angle);
      final double y = radius + textRadius * sin(angle);

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: i.toString(),
          style: TextStyle(color: Colors.black, fontSize: fontSize),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(canvas, Offset(x - textPainter.width / 2, y - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
