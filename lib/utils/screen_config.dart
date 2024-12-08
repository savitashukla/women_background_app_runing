import 'package:flutter/cupertino.dart';

class ScreenConfig {
  static final ScreenConfig _ScreenConfig = ScreenConfig._internal();
  static double height = 0;
  static double width = 0;
  factory ScreenConfig() {
    return _ScreenConfig;
  }

  ScreenConfig._internal();

  static void initiaLize(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
  }
}
