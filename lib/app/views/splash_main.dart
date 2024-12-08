// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/constants/images_url.dart';

import '../viewmodels/login/splash_controller.dart';
import 'home/circle_paint/const/size_const.dart';

class SplashMain extends StatefulWidget {
  const SplashMain({super.key});

  @override
  State<SplashMain> createState() => _SplashMainState();
}

class _SplashMainState extends State<SplashMain> {
  SplashController controllerSp = Get.put(SplashController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {

    Future.delayed( Duration(seconds: controllerSp.splashDelay.value), () {
      controllerSp.navigationPage(context);
    });

  }



  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness
            .dark, // Set to Brightness.light for light icons on dark background
      ),
      child: Scaffold(
          body: Center(
        child:
            Stack(alignment: Alignment.center, fit: StackFit.expand, children: [
          SvgPicture.asset(
            ImagesUrl.splashBackground,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Image.asset("assets/images/svg/splash_gif.gif")],
            ),
          )
        ]),
      )),
    );
  }
}
