import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/app_string.dart';

import '../../../constants/font_size.dart';
import '../../../utils/helper_widgets/custome_button.dart';
import '../../models/static_mode.dart';
import '../../routes/routes.dart';
import 'custom_Slide.dart';
import 'indicator.dart';


class IntroSliderScreen extends StatefulWidget {
  const IntroSliderScreen({super.key});

  @override
  State<IntroSliderScreen> createState() => _IntroSliderScreenState();
}

class _IntroSliderScreenState extends State<IntroSliderScreen> {
  PageController controller = PageController();

  Future<bool> initializeController() {
    Completer<bool> completer = Completer<bool>();

    /// Callback called after widget has been fully built
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      completer.complete(true);
    });

    return completer.future;
  }

  ///dhbjfhjdsfasas
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                height: 600.h,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          height70,
                          height40,
                          SizedBox(
                            height: MediaQuery.of(context).size.height-300,
                            child: PageView.builder(
                              controller: controller,
                              physics: const ClampingScrollPhysics(),
                              itemCount: customSlideLst.length,
                              itemBuilder: (BuildContext context, int index) {
                                return CustomSlide(
                                    idx: index, controller: controller);
                              },
                            ),
                          ),
                          height10,
                          Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: SizedBox(
                              height: 30.h,
                              child: Indicator(
                                controller: controller,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    height10,
                    Padding(
                      padding: EdgeInsets.only(top: 30.h, left: 10.w, right: 15.w),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamedAndRemoveUntil(
                                context, Routes.login, (route) => false);
                          },
                          child: Text('Skip',
                              style: w400_14Poppins(
                                  color: Theme.of(context).disabledColor)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
             // height10,
              Align(
                alignment: Alignment.bottomCenter,
                child: CustomButton(
                  width: 120.w,
                  borderRadius: 20.r,
                  borderColor: AppColors.colorPrimary,
                  buttonColor: AppColors.colorPrimary,
                  buttonText: (controller.positions.isNotEmpty &&
                      customSlideLst.length - 1 == controller.page)
                      ? AppString.getStarted
                      : AppString.next,
                  buttonTextStyle: w600_14Poppins(color: AppColors.whiteColor),
                  onTap: () {
                    if (customSlideLst.length - 1 == controller.page) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, Routes.dashBoard, (route) => false);
                    }
                    controller.nextPage(
                        duration: const Duration(milliseconds: 100),
                        curve: Curves.bounceIn);
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
