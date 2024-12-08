import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:o_woman/constants/app_colors.dart';

/*double getDegree(double radians) => (radians * 180) / math.pi;
double getRadians(double angle) => (angle * math.pi) / 180;*/

class MoveButtonCustomPaint extends CustomPainter {
  Offset pointerOffset = Offset.zero;
  String dateText ="1";
  MoveButtonCustomPaint({
  this.pointerOffset = Offset.zero,
    this.dateText ="1",
  });
  @override
  void paint(Canvas canvas, Size size) {
    double radiusOfCircle = size.width / 2.5;
    double angle = math.atan2(
      (pointerOffset.dy - size.center(Offset.zero).dy),
      (pointerOffset.dx - size.center(Offset.zero).dx),
    );

    // log("getRadians(angle).toString()");
    // log(getDegree(angle).toString());
    // log("getRadians(angle).toString()");
    // Paint tipPaint = Paint()..color = AppColors.circlePaint;

    Paint tipPaint = Paint()
      ..shader = const LinearGradient(
        colors: [AppColors.circlePaint, AppColors.circlePaint2],
      ).createShader(Rect.fromCenter(
        center: size.center(
          Offset.fromDirection(angle, radiusOfCircle),
        ),
        width: 55,
        height: 55,
      ));

    canvas.drawOval(
      Rect.fromCenter(
        center: size.center(
          Offset.fromDirection(angle, radiusOfCircle),
        ),
        width: 55,
        height:55,
      ),
      tipPaint,
    );

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: "Day\n$dateText",
        style: const TextStyle(color: Colors.white),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.textAlign = TextAlign.center;
    textPainter.layout(minWidth: 0, maxWidth: size.width);

    // Calculate the offset for the text
    double textX = size.width / 2 +
        radiusOfCircle * math.cos(angle) -
        textPainter.width / 2;
    double textY = size.height / 2 +
        radiusOfCircle * math.sin(angle) -
        textPainter.height / 2;

    textPainter.paint(canvas, Offset(textX, textY));
  }

  @override
  bool shouldRepaint(MoveButtonCustomPaint oldDelegate) => pointerOffset != Offset.zero;

  @override
  bool shouldRebuildSemantics(MoveButtonCustomPaint oldDelegate) => false;
}
