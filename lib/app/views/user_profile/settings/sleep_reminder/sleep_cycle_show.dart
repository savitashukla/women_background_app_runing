import 'dart:math';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

/// Double pi.
const double _doublePi = 2 * pi;

/// Coefficient to convert degrees to radians.
const double _piDiv180 = pi / 1;

/// Convert degrees to radians
///
/// Accept [degree] and returns radians
double _degToRad(double degree) {
  return degree * _piDiv180;
}

/// The callback type to get a new text value centered in the progress bar.
typedef OnGetCenterText = Text Function(double);

/// Simple circular progress bar.
///
/// The values are updated with ValueNotifier, which helps to avoid unnecessary
/// redrawing of the widget. Animation transition to a new value already built
/// into the widget. Progress bar can be either with or without a gradient.
class SimpleCircularProgressBarReminder extends StatefulWidget {
  /// Widget size. Equals the height and width of the widget.
  final double size;

  /// The maximum value of the progress bar.
  final double maxValue;

  /// Start angle. In this position there will be a zero value.
  final double startAngle;

  /// Progress line thickness.
  final double progressStrokeWidth;

  /// Background circle line thickness.
  final double backStrokeWidth;

  /// The list of colors of the main line (one and more).
  final List<Color> progressColors;

  /// The color of the circle at 100% value.
  /// It only works when [mergeMode] equal to true.
  final Color? fullProgressColor;

  /// The color of the background circle.
  final Color backColor;

  /// Animation speed.
  final Duration animationDuration;

  /// When this mode is enabled the progress bar with a 100% value forms a full
  /// circle.
  final bool mergeMode;

  /// The object designed to update the value of the progress bar.
  final ValueNotifier<double>? valueNotifier;

  /// Callback to generate a new Text widget located in the center of the
  /// progress bar. The callback input is the current value of the bar progress.
  final OnGetCenterText? onGetText;

  final ui.Image startImage;
  final ui.Image endImage;

  /// Create simple circular progress bar.
  ///
  /// Main params. Create simple circular progress bar with size equal to [size]
  /// ([size] = height = width). You can set the thickness of the progress line
  /// with [progressStrokeWidth] and the thickness of the background circle line
  /// with [backStrokeWidth]. If you don't want a background circle specify
  /// [backStrokeWidth] = 0. You can also set the starting angle [startAngle].
  /// Progress bar have a value from 0 to [maxValue].
  ///
  ///
  /// Color params. Progress bar can be either with or without a gradient. For a
  /// gradient, specify more than one color in the [progressColors] field and if
  /// a gradient is not needed specify only one color.You can also set the color
  /// of the circle on the background with [backColor]. The background circle
  /// does not support a gradient. About [fullProgressColor] read below.
  ///
  /// Animation param. You can adjust the speed of the animation with the
  /// [animationDuration]. The higher the value, the slower the animation.
  /// If you do not need animation, specify zero [animationDuration].
  ///
  /// Value param. Set your ValueNotifier with the [valueNotifier] parameter.
  /// The values are updated with ValueNotifier which helps to avoid unnecessary
  /// redrawing of the widget and also allows you to put animation inside the
  /// widget.
  ///
  /// Full progress type. If [mergeMode] is true then at 100% the progress of
  /// the bar will be in the form of a closed ring and the color will be changed
  /// to [fullProgressColor]. If no [fullProgressColor] is specified, the last
  /// color from [progressColors] is taken.
  ///
  /// Center text. If you want the text with its value to be displayed in the
  /// center of the progress bar, define the [onGetText] method. In this method
  /// you should return the Text widget for the current progress bar value.
  const SimpleCircularProgressBarReminder(
      {Key? key,
      this.size = 250,
      this.maxValue = 120,
      this.startAngle = 0,
      this.progressStrokeWidth = 20,
      this.backStrokeWidth = 20,
      this.progressColors = const [Colors.blueAccent, Colors.greenAccent],
      this.fullProgressColor,
      this.backColor = const Color(0xFF16262D),
      this.animationDuration = const Duration(seconds: 6),
      this.mergeMode = false,
      this.valueNotifier,
      this.onGetText,
      required this.startImage,
      required this.endImage})
      : super(key: key);

  @override
  _SimpleCircularProgressBarReminderState createState() =>
      _SimpleCircularProgressBarReminderState();
}

class _SimpleCircularProgressBarReminderState
    extends State<SimpleCircularProgressBarReminder>
    with SingleTickerProviderStateMixin {
  final double minSweepAngle = 0.015;

  late double circleLength;
  late double maxValue;
  late double widgetSize;

  late double startAngle;
  late double correctAngle;
  late SweepGradient sweepGradient;

  late AnimationController animationController;

  late Color fullProgressColor;

  late ValueNotifier<double> valueNotifier;
  late ValueNotifier<double>? defaultValueNotifier;

  @override
  void initState() {
    super.initState();

    // Check zero size.
    widgetSize = (widget.size <= 0) ? 100.0 : widget.size;
    maxValue = (widget.maxValue <= 0) ? 100.0 : widget.maxValue;

    // Check value notifier
    if (widget.valueNotifier != null) {
      defaultValueNotifier = null;
      valueNotifier = widget.valueNotifier!;
    } else {
      defaultValueNotifier = ValueNotifier(widget.maxValue);
      valueNotifier = defaultValueNotifier!;
    }

    // Calculate the real starting angle and correction angle.
    // Correction angle - the angle to which the main line should be
    // shifted in order for the SweepGradient to be displayed correctly.
    circleLength = pi * widgetSize;
    final k = _doublePi / circleLength;

    correctAngle = widget.progressStrokeWidth * k;
    startAngle = (correctAngle / 2);

    // Adjusting the colors.
    final List<Color> progressColors = [];
    if (widget.progressColors.isEmpty) {
      progressColors.add(Colors.blueAccent);
      progressColors.add(Colors.greenAccent);
    } else if (widget.progressColors.length == 1) {
      progressColors.add(widget.progressColors[0]);
      progressColors.add(widget.progressColors[0]);
    } else {
      progressColors.addAll(widget.progressColors);
    }

    sweepGradient = SweepGradient(
      tileMode: TileMode.decal,
      colors: progressColors,
    );

    fullProgressColor = (widget.fullProgressColor == null)
        ? progressColors.last
        : widget.fullProgressColor!;

    // Create animation.
    final animationDuration = (widget.animationDuration.inMicroseconds < 0)
        ? const Duration()
        : widget.animationDuration;

    animationController = AnimationController(
      vsync: this,
      duration: animationDuration,
      value: 0.0,
      upperBound: maxValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: valueNotifier,
      builder: (BuildContext context, double value, Widget? child) {
        // If the set value is greater than the maximum value, we must set the
        // maximum value. Otherwise the animation will loop.
        if (value > maxValue) {
          value = maxValue;
        } else if (value < 0) {
          value = 0;
        }

        // Read [MAIN LOGIC]
        if (value < animationController.value) {
          animationController.forward();
        } else {
          animationController.animateTo(value);
        }

        return AnimatedBuilder(
          animation: animationController,
          builder: (context, snapshot) {
            // [MAIN LOGIC]
            //
            // If [value] >= [animation.value]:
            // Moving from the current value to the new value.
            //
            // If [value] <  [animation.value]:
            // Move to the end of the circle and from there to a new value.
            //
            // [MAIN LOGIC]

            if ((value != animationController.upperBound) &&
                (animationController.value >= animationController.upperBound)) {
              animationController.reset();
              animationController.animateTo(value);
            }

            double sweepAngle;

            // Reduce the value to a range of 0.0 to 1.0.
            final reducedValue = animationController.value / maxValue;

            if (animationController.value == 0) {
              sweepAngle = 0;
            } else {
              sweepAngle = (_doublePi * reducedValue) - correctAngle;

              if (sweepAngle <= 0) {
                sweepAngle = minSweepAngle;
              }
            }

            final currentLength = reducedValue * circleLength;

            // If mergeMode is on and the current value is equal to the maximum
            // value, we should draw a full circle with the specified color.
            final isFullProgress = widget.mergeMode &
                (animationController.value == animationController.upperBound);

            // Create center text widget.
            // If no callback is defined, create an empty widget.
            Widget centerTextWidget;
            if (widget.onGetText != null) {
              centerTextWidget = widget.onGetText!(animationController.value);
            } else {
              centerTextWidget = const SizedBox.shrink();
            }

            // Repaint progress bar.
            return Stack(
              alignment: Alignment.center,
              children: [
                centerTextWidget,
                Transform.rotate(
                  angle: _degToRad(widget.startAngle - 180),
                  child: CustomPaint(
                    size: Size(widgetSize, widgetSize),
                    painter: _SimpleCircularProgressBarPainter(
                      progressStrokeWidth: widget.progressStrokeWidth,
                      backStrokeWidth: widget.backStrokeWidth,
                      startAngle: startAngle,
                      sweepAngle: sweepAngle,
                      currentLength: currentLength,
                      frontGradient: sweepGradient,
                      backColor: widget.backColor,
                      fullProgressColor: fullProgressColor,
                      isFullProgress: isFullProgress,
                      startImage: widget.startImage,
                      endImage: widget.endImage,
                    ),
                    child: SizedBox(
                        height: 220,
                        width: 220,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 40.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Image.asset(ImagesUrl.nightTimePng),
                              Center(
                                  child: HelperWidget().testMethod(
                                      20.0,
                                      FontWeight.w600,
                                      AppColors.colorAccent,
                                      "5 h")),
                              Image.asset(ImagesUrl.dayTimePng),
                            ],
                          ),
                        )),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  void dispose() {
    animationController.dispose();

    if (defaultValueNotifier != null) {
      defaultValueNotifier!.dispose();
    }

    super.dispose();
  }
}

/// Painter to draw the progress bar.
class _SimpleCircularProgressBarPainter extends CustomPainter {
  final double progressStrokeWidth;
  final double backStrokeWidth;
  final double startAngle;
  final double sweepAngle;
  final double currentLength;
  final SweepGradient frontGradient;
  final Color backColor;

  final Color fullProgressColor;
  final bool isFullProgress;
  final ui.Image startImage;
  final ui.Image endImage;

  _SimpleCircularProgressBarPainter({
    required this.progressStrokeWidth,
    required this.backStrokeWidth,
    required this.startAngle,
    required this.sweepAngle,
    required this.currentLength,
    required this.frontGradient,
    required this.backColor,
    required this.fullProgressColor,
    required this.isFullProgress,
    required this.startImage,
    required this.endImage,
  });

  /// Draw background circle for progress bar
  void _drawBack(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = backColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = backStrokeWidth;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  /// Draw the initial part of the arc (~ 0% - 1%).
  /// (The part that is less than the [progressStrokeWidth])
  void _drawLessArcPart(Canvas canvas, Size size) {
    // [MAIN LOGIC]
    //
    // Copies 'phases of the Moon' while drawing (Last Quarter -> Full Moon).
    // Draw two arcs. One static and one moving, and combine them using XOR.
    //
    // [MAIN LOGIC]

    double angle = 0;
    double height = 0;

    if (currentLength < progressStrokeWidth / 2) {
      angle = 0;
      height = progressStrokeWidth - currentLength * 2;
    } else if (currentLength < progressStrokeWidth) {
      angle = 0;
      height = currentLength * 2 - progressStrokeWidth;
    } else {
      return;
    }

    final Paint pathPaint = Paint()
      ..shader = frontGradient.createShader(Offset.zero & size)
      ..style = PaintingStyle.fill;

    final Offset circleOffset = Offset(
      (size.width / 2) * cos(startAngle) + size.center(Offset.zero).dx,
      (size.width / 2) * sin(startAngle) + size.center(Offset.zero).dy,
    );

    canvas.drawPath(
      Path.combine(
        PathOperation.xor,
        Path()
          ..addArc(
            Rect.fromLTWH(
              circleOffset.dx - progressStrokeWidth / 2,
              circleOffset.dy - progressStrokeWidth / 2,
              progressStrokeWidth,
              progressStrokeWidth,
            ),
            _degToRad(0),
            _degToRad(0),
          ),
        Path()
          ..addArc(
            Rect.fromCenter(
              center: circleOffset,
              width: progressStrokeWidth,
              height: height,
            ),
            _degToRad(angle),
            _degToRad(0),
          ),
      ),
      pathPaint,
    );
  }

  /// this is use for fill color
  /// Draw main arc (~ 1% - 100%).
  void _drawArcPart(Canvas canvas, Size size) {
    final Rect arcRect = Offset.zero & size;

    final Paint arcPaint = Paint()
      ..shader = frontGradient.createShader(arcRect)
      ..strokeWidth = progressStrokeWidth
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawArc(arcRect, startAngle, sweepAngle, false, arcPaint);
  }

  void _drawFullProgress(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = fullProgressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = progressStrokeWidth;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    if (isFullProgress && (progressStrokeWidth > 0)) {
      _drawFullProgress(canvas, size);
      return;
    }

    final double radius = size.width / 2;

    const double angleStep = 2 * pi / 12;
    final double textRadius =
        radius - 20; // Radius for text position adjustment
    const double fontSize = 12;

    // Draw the remaining numbers

    for (int i = 1; i <= 12; i++) {
      final double x = radius + textRadius * cos(i * angleStep - pi / 2);
      final double y = radius + textRadius * sin(i * angleStep - pi / 2);

      // Calculate the direction of the text
      double textX = x - fontSize / 2;
      double textY = y - fontSize / 2;

      // Determine the position of the dot based on text direction
      double dotX = x;
      double dotY = y;

      // Adjust the positions of the dots for spacing between text and dots
      double space = 4; // Set your desired space here
      if (textY < radius - textRadius / 2) {
        // If the text is on top, place the dot above the text
        dotY -= fontSize / 2 - space;
      } else if (textY > radius + textRadius / 2) {
        // If the text is at the bottom, place the dot below the text
        dotY += fontSize / 2 - space;
      }
      if (textX < radius - textRadius / 2) {
        // If the text is on the left, place the dot to the left of the text
        dotX -= fontSize / 2 - space;
      } else if (textX > radius + textRadius / 2) {
        // If the text is on the right, place the dot to the right of the text
        dotX += fontSize / 2 - space;
      }

      // Draw the dot circle
      canvas.drawCircle(
        Offset(dotX, dotY),
        3, // Radius of the dot circle
        Paint()..color = Colors.blue, // Example color for the dots
      );

      // Draw the text

      double textX11 = x - fontSize / 2;
      double textY11 = y - fontSize / 2;

// Add space between the text and the background circle
      double spaceBetweenTextAndBack = 10.0; // Adjust as needed
      textY +=
          spaceBetweenTextAndBack; // Add space between text and background circle

// Determine the position of the dot based on text direction
      double dotX11 = x;
      double dotY11 = y;

// Adjust the positions of the dots for spacing between text and dots
      double space11 = 15; // Set your desired space here
      if (textY11 < radius - textRadius / 2) {
        // If the text is on top, place the dot above the text
        dotY11 -= fontSize / 2 - space11;
      } else if (textY11 > radius + textRadius / 2) {
        // If the text is at the bottom, place the dot below the text
        dotY11 += fontSize / 2 - space11;
      }
      if (textX11 < radius - textRadius / 2) {
        // If the text is on the left, place the dot to the left of the text
        dotX11 -= fontSize / 2 - space11;
      } else if (textX11 > radius + textRadius / 2) {
        // If the text is on the right, place the dot to the right of the text
        dotX11 += fontSize / 2 - space11;
      }

      TextPainter textPainter = TextPainter(
        text: TextSpan(
          text: i.toString(),
          style: const TextStyle(color: Colors.black, fontSize: fontSize),
        ),
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
      );

      textPainter.layout();
      textPainter.paint(
          canvas,
          Offset(
              dotX11 - textPainter.width / 2, dotY11 - textPainter.height / 2));
    }

    if (backStrokeWidth > 0) {
      _drawBack(canvas, size);
    }

    if (progressStrokeWidth <= 0) {
      return;
    } else if (progressStrokeWidth >= currentLength) {
      _drawLessArcPart(canvas, size);
    } else {
      /// this is use for draw circle

      _drawArcPart(canvas, size);
    }

    final double startX = size.width / 2 + radius * cos(startAngle);
    final double startY = size.width / 2 + radius * sin(startAngle);
    final Offset startImageOffset =
        Offset(startX - startImage.width / 2, startY - startImage.height / 2);

    canvas.drawImageRect(
      startImage,
      Rect.fromLTWH(
        0, // X coordinate of the top-left corner of the source rectangle
        0, // Y coordinate of the top-left corner of the source rectangle
        startImage.width.toDouble(), // Width of the source rectangle
        startImage.height.toDouble(), // Height of the source rectangle
      ),
      Rect.fromLTWH(
        startImageOffset
            .dx, // X coordinate of the top-left corner of the destination rectangle
        startImageOffset
            .dy, // Y coordinate of the top-left corner of the destination rectangle
        startImage.width.toDouble(), // Width of the destination rectangle
        startImage.height.toDouble(), // Height of the destination rectangle
      ),
      Paint(),
    );

    final double endX = size.width / 2 + radius * cos(sweepAngle + startAngle);
    final double endY = size.width / 2 + radius * sin(sweepAngle + startAngle);
    final Offset endImageOffset =
        Offset(endX - endImage.width / 2, endY - endImage.height / 2);

    canvas.drawImageRect(
        endImage,
        Rect.fromLTWH(
          0, // X coordinate of the top-left corner
          0, // Y coordinate of the top-left corner
          endImage.width.toDouble(), // Width of the destination rectangle
          endImage.height.toDouble(), // Height of the image
        ),
        Rect.fromLTWH(
          endX - endImage.width / 2, // X coordinate of the top-left corner
          endY - endImage.height / 2, // Y coordinate of the top-left corner
          endImage.width.toDouble(), // Width of the destination rectangle
          endImage.height.toDouble(),
        ),
        Paint());
  }

  @override
  bool shouldRepaint(_SimpleCircularProgressBarPainter oldDelegate) {
    //return oldDelegate.currentLength != currentLength;
    return oldDelegate.currentLength != currentLength;
  }
}
