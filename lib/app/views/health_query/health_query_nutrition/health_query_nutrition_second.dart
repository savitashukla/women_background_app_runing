import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/post_login/health_query_controller.dart';
import 'package:o_woman/app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import 'package:o_woman/app/views/health_query/menstrual/menstrual_fast.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';

class HealthQueryNutritionSecond extends StatefulWidget {
  const HealthQueryNutritionSecond({super.key});

  @override
  State<HealthQueryNutritionSecond> createState() =>
      _HealthQueryNutritionSecondState();
}

class _HealthQueryNutritionSecondState
    extends State<HealthQueryNutritionSecond> {
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
                            AppColors.buttonColor, "11/12"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    ImagesUrl.nutritionHealthSecond,
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
                          "Do you incorporate smoothies or protein shakes into your diet?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.regularly.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.regularly.value = false;
                              introScreenController.occassionally.value = false;
                              introScreenController.rarely.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Yes, Regularly ",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.regularly.value = true;
                              introScreenController.occassionally.value = false;
                              introScreenController.rarely.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Yes, Regularly ",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.occassionally.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.regularly.value = false;
                              introScreenController.occassionally.value = false;
                              introScreenController.rarely.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Occasionally ",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.regularly.value = false;
                              introScreenController.occassionally.value = true;
                              introScreenController.rarely.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Occasionally ",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.rarely.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.regularly.value = false;
                              introScreenController.occassionally.value = false;
                              introScreenController.rarely.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Rarely or never",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.regularly.value = false;
                              introScreenController.occassionally.value = false;
                              introScreenController.rarely.value = true;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Rarely or never",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, Routes.healthQueryNutritionThird);
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
                      if (introScreenController.regularly.value ||
                          introScreenController.occassionally.value ||
                          introScreenController.rarely.value) {
                        Navigator.pushNamed(
                            context, Routes.healthQueryNutritionThird);
                      } else {
                        CustomToast.showErrorToast(msg: "Select your Intent");
                      }
                    },
                    child: Obx(
                      () => HelpWeightHealthQuery().nextContainer(
                          buttonColor: introScreenController.regularly.value ||
                                  introScreenController.occassionally.value ||
                                  introScreenController.rarely.value
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
