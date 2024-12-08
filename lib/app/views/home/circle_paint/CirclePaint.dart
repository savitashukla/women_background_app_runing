import 'dart:math';

import "package:flutter/material.dart";
import 'package:o_woman/constants/app_colors.dart';

import 'const/size_const.dart';
import 'math/circle.dart';

const follicularColor = Color(0xffF5E9EC);
const periodColor = Color(0xffFF5B96);
const ovulationColor = Color(0xffA07A8C);
const lutealColor = Color(0xff945068);

SizeUtil? get _sizeUtil {
  return SizeUtil.getInstance(key: SizeKeyConst.CIRCLE_KEY);
}

class CirclePainter extends CustomPainter {

  CirclePainter({required this.startAngle, required  this.cyclePeriods, required  this.cycleFollicular, required  this.cycleOvulation, required  this.cycleLuteal});

  final double startAngle;
  final double cycleOvulation;
  final double cycleFollicular;
  final double cyclePeriods;
  final double cycleLuteal;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width > 1.0 && size.height > 1.0) {
      _sizeUtil!.logicSize = size;
    }
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = ovulationColor
      ..strokeWidth = 2.0
      ..isAntiAlias = true;
    paint.color = Colors.grey[900]!;
    paint.color = lutealColor;
    paint.strokeWidth = 20;
    paint.style = PaintingStyle.stroke;
    var center = Offset(
      _sizeUtil!.getAxisX(250.0),
      _sizeUtil!.getAxisY(250.0),
    );
    var radius = _sizeUtil!.getAxisBoth(200);
    _drawArcGroup(
      size.width,
      canvas,
      center: center,
      radius: radius,
      sources: [cycleOvulation, cycleLuteal, cyclePeriods, cycleFollicular],
      colors: [ovulationColor,lutealColor , periodColor, follicularColor],
      paintWidth: 40.0,
      startAngle: 1.3 * startAngle / radius,
      hasEnd: true,
      hasCurrent: false,
      curPaintWidth: 45.0,
      curIndex: 1,
    );
    canvas.save();
    canvas.restore();
  }

  void _drawArcGroup(var size, Canvas canvas,
      {required Offset center,
      required double radius,
      required List<double> sources,
      required List<Color> colors,
      double startAngle = 0.0,
      double paintWidth = 10.0,
      bool hasEnd = false,
      hasCurrent = false,
      int curIndex = 0,
      curPaintWidth = 12.0}) {
    assert(sources != null && sources.isNotEmpty);
    assert(colors != null && colors.isNotEmpty);
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = ovulationColor
      ..strokeWidth = paintWidth
      ..isAntiAlias = true;
    double total = 0;
    for (double d in sources) {
      total += d;
    }
    assert(total > 0.0);
    List<double> radians = [];
    for (double d in sources) {
      double radian = d * 2 * pi / total;
      radians.add(radian);
    }
    var startA = startAngle;
    paint.style = PaintingStyle.stroke;
    var curStartAngle = 0.0;
    for (int i = 0; i < radians.length; i++) {
      var rd = radians[i];
      if (hasCurrent && curIndex == i) {
        curStartAngle = startA;
        startA += rd;
        continue;
      }
      paint.color = colors[i % colors.length];
      paint.strokeWidth = paintWidth;
      _drawArcWithCenter(size, canvas, paint,
          index: i,
          center: center,
          radius: radius,
          startRadian: startA,
          sweepRadian: rd);
      startA += rd;
    }
    if (hasEnd) {
      startA = startAngle;
      paint.strokeWidth = paintWidth;
      for (int i = 0; i < radians.length; i++) {
        var rd = radians[i];
        if (hasCurrent && curIndex == i) {
          startA += rd;
          continue;
        }
        paint.color = colors[i % colors.length];
        paint.strokeWidth = paintWidth;
        _drawArcTwoPoint(size, canvas, paint,
            center: center,
            radius: radius,
            startRadian: startA,
            sweepRadian: rd,
            hasEndArc: true);
        startA += rd;
      }
    }

    if (hasCurrent) {
      paint.color = colors[curIndex % colors.length];
      paint.strokeWidth = curPaintWidth;
      paint.style = PaintingStyle.stroke;
      _drawArcWithCenter(size, canvas, paint,
          index: 0,
          center: center,
          radius: radius,
          startRadian: curStartAngle,
          sweepRadian: radians[curIndex]);
    }
    if (hasCurrent && hasEnd) {
      var rd = radians[curIndex % radians.length];
      paint.color = colors[curIndex % colors.length];
      paint.strokeWidth = curPaintWidth;
      paint.style = PaintingStyle.fill;
      _drawArcTwoPoint(size, canvas, paint,
          center: center,
          radius: radius,
          startRadian: curStartAngle,
          sweepRadian: rd,
          hasEndArc: true,
          hasStartArc: true);
    }
  }

  void _drawArcWithCenter(
    size,
    Canvas canvas,
    Paint paint, {
    required int index,
    required Offset center,
    required double radius,
    startRadian = 0.0,
    sweepRadian = pi,
  }) {
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startRadian,
      sweepRadian,
      false,
      paint,
    );

    TextPainter textPainter = TextPainter(
      text: TextSpan(
        text: index == 0
            ? "Ovulation"
            : index == 1
                ? "Luteal"
                : index == 2
                    ? "Period"
                    : "Follicular",
        style: index == 3
            ? const TextStyle(color: AppColors.blackColor)
            : const TextStyle(color: AppColors.whiteColor),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(minWidth: 0, maxWidth: center.dx);

    var textPoint = LineCircle.radianPoint(
      Point(center.dx, center.dy),
      radius,
      startRadian + sweepRadian / 2,
    );

    double textX = textPoint.x.toDouble() - textPainter.width / 2;
    double textY = textPoint.y.toDouble() - textPainter.height / 2;

    // Rotate the canvas to draw text vertically
    canvas.save();
    canvas.translate(
        textX + textPainter.width / 2, textY + textPainter.height / 2);
    canvas
        .rotate(startRadian + sweepRadian / 2 + pi / 2); // Rotate by 90 degrees

    textPainter.paint(
        canvas, Offset(-textPainter.width / 2, -textPainter.height / 2));

    canvas.restore();
  }

  void _drawArcTwoPoint(size, Canvas canvas, Paint paint,
      {required Offset center,
      required double radius,
      startRadian = 0.0,
      sweepRadian = pi,
      hasStartArc = false,
      hasEndArc = false}) {
    var smallR = paint.strokeWidth / 2;
    paint.strokeWidth = smallR;
    if (hasStartArc) {
      var startCenter = LineCircle.radianPoint(
          Point(center.dx, center.dy), radius, startRadian);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(
          Offset(startCenter.x.toDouble(), startCenter.y.toDouble()),
          smallR,
          paint);
    }
    if (hasEndArc) {
      var endCenter = LineCircle.radianPoint(
          Point(center.dx, center.dy), radius, startRadian + sweepRadian);
      paint.style = PaintingStyle.fill;
      canvas.drawCircle(Offset(endCenter.x.toDouble(), endCenter.y.toDouble()),
          smallR, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
