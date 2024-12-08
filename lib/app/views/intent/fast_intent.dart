import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../constants/images_url.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';
import '../../viewmodels/post_login/health_query_controller.dart';
import '../health_query/help_weight_health_query/help_weight_health_query.dart';

class FastIntent extends StatefulWidget {
  const FastIntent({super.key});

  @override
  State<FastIntent> createState() => _FastIntentState();
}

class _FastIntentState extends State<FastIntent> {
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: SafeArea(
        top: false,
        right: true,
        left: true,
        child: Scaffold(
          backgroundColor: AppColors.homeBgColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 25.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset(
                              ImagesUrl.backwardIcon,
                              color: AppColors.mainColor,
                            )),
                      ),
                    ),
                    height30,
                    Center(
                      child: Image.asset(
                        ImagesUrl.intentFastImages,
                        height: 190.h,
                        width: 260.w,
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: HelperWidget().testMethod(18.0, FontWeight.w500,
                          Colors.black, "Select your Intent"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Obx(
                      () => introScreenController
                              .selectIntentCycleTrackClick.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController
                                    .selectIntentCycleTrackClick.value = false;
                                introScreenController
                                    .selectIntentGetPregnantClick.value = false;
                              },
                              child: Container(
                                  //  height: 38,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(
                                      left: 15, top: 15, bottom: 15, right: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.colorPrimary,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: HelperWidget().testMethodStartAlign(
                                            14.0,
                                            FontWeight.w500,
                                            Colors.white,
                                            "Cycle Tracking \n \nThis will be help for getting period prediction based on your cycle we will help you spot your body's period signal and give you tips for your goods health"),
                                      )
                                    ],
                                  )),
                            )
                          : GestureDetector(
                              onTap: () {
                                introScreenController
                                    .selectIntentCycleTrackClick.value = true;
                                introScreenController
                                    .selectIntentGetPregnantClick.value = false;
                              },
                              child: Container(
                                  height: 38.h,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 15.w),
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: AppColors.whiteColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      HelperWidget().testMethod(
                                          14.0,
                                          FontWeight.w400,
                                          Colors.black,
                                          "Cycle Tracking"),
                                    ],
                                  )),
                            ),
                    ),
                    Obx(
                      () => introScreenController
                              .selectIntentGetPregnantClick.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController
                                    .selectIntentCycleTrackClick.value = false;
                                introScreenController
                                    .selectIntentGetPregnantClick.value = false;
                              },
                              child: Container(
                                  //  height: 38,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 15.w, vertical: 15.h),
                                  width: MediaQuery.of(context).size.width,
                                  padding: EdgeInsets.all(15.sp),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.r),
                                    color: AppColors.colorPrimary,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: HelperWidget().testMethodStartAlign(
                                            14.0,
                                            FontWeight.w500,
                                            Colors.white,
                                            "Get Pregnant \n \nThis will be help for getting period prediction based on your cycle we will help you spot your body's period signal and give you tips for your goods health"),
                                      )
                                    ],
                                  )),
                            )
                          : GestureDetector(
                              onTap: () {
                                introScreenController
                                    .selectIntentCycleTrackClick.value = false;
                                introScreenController
                                    .selectIntentGetPregnantClick.value = true;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 15.w, vertical: 15.h),
                                height: 38.h,
                                padding: EdgeInsets.only(left: 15.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6.r),
                                  color: AppColors.whiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HelperWidget().testMethod(
                                        14.0,
                                        FontWeight.w400,
                                        Colors.black,
                                        "Get Pregnant"),
                                  ],
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      if (introScreenController
                              .selectIntentCycleTrackClick.value ||
                          introScreenController
                              .selectIntentGetPregnantClick.value) {
                        Navigator.pushNamed(
                            context, Routes.cycleTrackFastScreen);
                      } else {
                        CustomToast.showErrorToast(msg: "Select your Intent");
                      }
                    },
                    child: Obx(
                      () => HelpWeightHealthQuery().nextContainer(
                          buttonColor: introScreenController
                                      .selectIntentCycleTrackClick.value ||
                                  introScreenController
                                      .selectIntentGetPregnantClick.value
                              ? true
                              : false),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
