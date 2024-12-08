import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:o_woman/app/viewmodels/post_login/health_query_controller.dart';
import 'package:o_woman/app/views/health_query/menstrual/menstrual_fast.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';
import '../help_weight_health_query/help_weight_health_query.dart';

class FertilitySecondScreen extends StatefulWidget {
  const FertilitySecondScreen({super.key});

  @override
  State<FertilitySecondScreen> createState() => _FertilitySecondScreenState();
}

class _FertilitySecondScreenState extends State<FertilitySecondScreen> {
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0.h, horizontal: 3.w),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: SvgPicture.asset(
                                ImagesUrl.backwardIcon,
                                color: AppColors.mainColor,
                              )),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.0.sp),
                        child: HelperWidget().testMethod(14.0, FontWeight.w400,
                            AppColors.buttonColor, "5/12"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    ImagesUrl.fertilitySecond,
                    height: 185,
                    width: 260,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          16.0,
                          FontWeight.w500,
                          AppColors.textColorQus,
                          "How often do you monitor your fertility awareness?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectFertDaily.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.colorPrimary,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.whiteColor,
                                      "Daily"),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  true;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.whiteColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.textColorQus,
                                      "Daily"),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectFertWeekly.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                                height: 38,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.colorPrimary,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HelperWidget().testMethod(
                                        16.0,
                                        FontWeight.w400,
                                        AppColors.whiteColor,
                                        "Weekly"),
                                  ],
                                )),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  true;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                                height: 38,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.whiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HelperWidget().testMethod(
                                        16.0,
                                        FontWeight.w400,
                                        AppColors.textColorQus,
                                        "Weekly"),
                                  ],
                                )),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectFertMonthly.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.colorPrimary,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.whiteColor,
                                      "Monthly"),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  true;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.whiteColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.textColorQus,
                                      "Monthly"),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectFertRarely.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.colorPrimary,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.whiteColor,
                                      "Rarely "),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  true;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.whiteColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.textColorQus,
                                      "Rarely "),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectMethodNever.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.colorPrimary,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.whiteColor,
                                      "Never"),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFertDaily.value =
                                  false;
                              introScreenController.selectFertWeekly.value =
                                  false;
                              introScreenController.selectFertMonthly.value =
                                  false;
                              introScreenController.selectFertRarely.value =
                                  false;
                              introScreenController.selectMethodNever.value =
                                  true;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              height: 38,
                              padding: const EdgeInsets.only(left: 15),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: AppColors.whiteColor,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      AppColors.textColorQus,
                                      "Never"),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.fertilityThird);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: HelperWidget().testMethod(
                          14.0, FontWeight.w500, AppColors.buttonColor, "Skip"),
                    ),
                  ),
                  width30,
                  GestureDetector(
                    onTap: () {
                      if (introScreenController.selectFertDaily.value ||
                          introScreenController.selectFertWeekly.value ||
                          introScreenController.selectFertMonthly.value ||
                          introScreenController.selectFertRarely.value ||
                          introScreenController.selectMethodNever.value) {
                        Navigator.pushNamed(context, Routes.fertilityThird);
                      }else{
                        CustomToast.showErrorToast(msg: "Select your Intent");
                      }
                    },
                    child: Obx(
                      () => HelpWeightHealthQuery().nextContainer(
                          buttonColor: introScreenController
                                      .selectFertDaily.value ||
                                  introScreenController
                                      .selectFertWeekly.value ||
                                  introScreenController
                                      .selectFertMonthly.value ||
                                  introScreenController
                                      .selectFertRarely.value ||
                                  introScreenController.selectMethodNever.value
                              ? true
                              : false),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
