import 'package:flutter/material.dart';
import 'package:flutter_windowmanager/flutter_windowmanager.dart';
import 'dart:math';
import 'dart:math' as math;
import 'package:get/get.dart';


class SizeKeyConst {
  static const DEVICE_KEY = "device_size";
  static const ROUND_ANGLE_KEY = "round_angle_size";
  static const REGULAR_POLYGON_KEY = "regular_angle_size";
  static const CIRCLE_KEY = "circle custom painter";
  static const CIRCLE_TRIANGLE_KEY = "circle triangle painter";
  static const LOGO_KEY = "logo_page_size";
}



class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  return (inputHeight / 812.0) * screenHeight;
}

Future<void> secureScreen() async {
  await FlutterWindowManager.addFlags(FlutterWindowManager.FLAG_SECURE);
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

final window = WidgetsBinding.instance.window;
Size size = window.physicalSize / window.devicePixelRatio;

/// This method is used to set padding/margin (for the left and Right side)
/// and width of the screen or widget according to the Viewport width.
double getHorizontalSize(double px) => px * (size.width / 375);

/// This method is used to set padding/margin (for the top and bottom side)
/// and height of the screen or widget according to the Viewport height.
double getVerticalSize(double px) {
  num statusBar = MediaQueryData.fromWindow(window).viewPadding.top;
  num screenHeight = size.height - statusBar;
  return px * (screenHeight / 812);
}

/// This method is used to set smallest px in image height and width.
double getSize(double px) {
  final height = getVerticalSize(px);
  final width = getHorizontalSize(px);

  if (height < width) {
    return height.toInt().toDouble();
  } else {
    return width.toInt().toDouble();
  }
}

/// This method is used to set text font size according to Viewport.
double getFontSize(double px) => getSize(px);

extension NumX on num {
  double get resHeight => getProportionateScreenHeight(toDouble());
  double get resWidth => getProportionateScreenWidth(toDouble());
}

class SizeUtil {
  static final Map<String, SizeUtil> _keyValues = {};

  static initDesignSize() {
    getInstance(key: SizeKeyConst.ROUND_ANGLE_KEY)!.designSize =
        const Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.REGULAR_POLYGON_KEY)!.designSize =
        const Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.LOGO_KEY)!.designSize =
        const Size(580, 648.0);
    getInstance(key: SizeKeyConst.CIRCLE_KEY)!.designSize =
        const Size(500.0, 500.0);
    getInstance(key: SizeKeyConst.CIRCLE_TRIANGLE_KEY)!.designSize =
        const Size(500.0, 500.0);
  }

  static SizeUtil? getInstance({key = SizeKeyConst.DEVICE_KEY}) {
    if (_keyValues.containsKey(key)) {
      return _keyValues[key];
    } else {
      _keyValues[key] = SizeUtil();
      return _keyValues[key];
    }
  }

  Size? _designSize;

  set designSize(Size size) {
    _designSize = size;
  }

  //logic size in device
  Size? _logicalSize;

  //device pixel radio.

  get width => _logicalSize!.width;

  get height => _logicalSize!.height;

  set logicSize(Size size) => _logicalSize = size;

  //@param w is the design w;
  double getAxisX(double w) {
    return (w * width) / _designSize!.width;
  }

// the y direction
  double getAxisY(double h) {
    return (h * height) / _designSize!.height;
  }

  // diagonal direction value with design size s.
  double getAxisBoth(double s) {
    return s *
        sqrt((width * width + height * height) /
            (_designSize!.width * _designSize!.width +
                _designSize!.height * _designSize!.height));
  }
}

class movePointerSize {



  static var offset = Offset.zero.obs;
  static var onDayAngle = (360 / 31).obs;

  static double onDayDegree() {
    double degree = 2 * pi * (500 / 2.5);
    degree = degree / 31;
    return degree;
  }



  void getOffsetAccording(day) {

    double centerX = 250;
    double centerY = 250;
    // Radius of the container
    double radius = 250;
    // Number of parts
    int numberOfParts = 31;
    // Calculate the angle for one part
    double angleForOnePart = 2 * math.pi / numberOfParts;
    double currentAngle = day * angleForOnePart;

    // Calculate the point coordinates
    double pointX = centerX + radius * math.cos(currentAngle);
    double pointY = centerY + radius * math.sin(currentAngle);
    movePointerSize.offset.value = Offset(pointX, pointY);

  }
  static Offset calculateOffset(double angle, double distance) {
    // Convert the angle from degrees to radians
    double radians = angle * (pi / 180.0);
    double distance = 500;
    // Calculate the offset values using trigonometric functions
    double offsetX = distance * cos(radians);
    double offsetY = distance * sin(radians);

    return Offset(offsetX,offsetY);
  }
}
