import 'package:flutter/material.dart';

import '../../../utils/helper_widgets/helper_widgets.dart';

class SafetyScreen extends StatelessWidget {
  const SafetyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child:HelperWidget().testMethod(
          15.0, FontWeight.w800, Colors.blue, "SafetyScreen") ,),
    );
  }
}
