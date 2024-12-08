import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

import '../../utils/hive_helper.dart';
import '../viewmodels/login/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controllerSp = Get.put(SplashController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var duration = Duration(seconds: controllerSp.splashDelay.value);
    return Timer(duration, navigationPage);
  }

  Future<void> navigationPage() async {
    Navigator.pushNamed(context, Routes.intent);


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            ImagesUrl.appLogo,
            height: 56,
            width: 192,
            fit: BoxFit.cover,
          ),
          Image.asset(
            ImagesUrl.splashScreenImage,
            height: 305,
            width: 305,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 16,
          ),
          Center(
            child: HelperWidget().testMethod(
                20.0, FontWeight.w700, Colors.black, "Welcome to OWOMEN"),
          ),
          Center(
            child: HelperWidget().testMethod(
                16.0,
                FontWeight.w400,
                Colors.black,
                "your trusted partner for a safe and healthy pregnancy journey."),
          )
        ],
      ),
    );
  }
}
