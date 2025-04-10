import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/home_controller/commonController.dart';
import 'package:o_woman/app/viewmodels/post_login/health_query_controller.dart';
import 'package:o_woman/app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../../constants/font_size.dart';
import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';

class HealthQueryNutritionThird extends StatefulWidget {
  const HealthQueryNutritionThird({super.key});

  @override
  State<HealthQueryNutritionThird> createState() =>
      _HealthQueryNutritionThirdState();
}

class _HealthQueryNutritionThirdState extends State<HealthQueryNutritionThird> {
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());
  CommonController commonController = Get.put(CommonController());
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
                            AppColors.buttonColor, "12/12"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    ImagesUrl.nutritionThirdImages,
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
                          "Do you consume hydrating foods (e.g., fruits with high water content) as part of your snacking habits?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectRegularly.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegularly.value =
                                  false;
                              introScreenController.selectOccassionally.value =
                                  false;
                              introScreenController.selectRarely.value = false;
                              introScreenController.selectNever.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Regularly ",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectRegularly.value =
                                  true;
                              introScreenController.selectOccassionally.value =
                                  false;
                              introScreenController.selectRarely.value = false;
                              introScreenController.selectNever.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Regularly ",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectOccassionally.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegularly.value =
                                  false;
                              introScreenController.selectOccassionally.value =
                                  false;
                              introScreenController.selectRarely.value = false;
                              introScreenController.selectNever.value = false;
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
                              introScreenController.selectRegularly.value =
                                  false;
                              introScreenController.selectOccassionally.value =
                                  true;
                              introScreenController.selectRarely.value = false;
                              introScreenController.selectNever.value = false;
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
                    () => introScreenController.selectRarely.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegularly.value =
                                  false;
                              introScreenController.selectOccassionally.value =
                                  false;
                              introScreenController.selectRarely.value = false;
                              introScreenController.selectNever.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Rarely",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectRegularly.value =
                                  false;
                              introScreenController.selectOccassionally.value =
                                  false;
                              introScreenController.selectRarely.value = true;
                              introScreenController.selectNever.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Rarely",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectNever.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegularly.value =
                                  false;
                              introScreenController.selectOccassionally.value =
                                  false;
                              introScreenController.selectRarely.value = false;
                              introScreenController.selectNever.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Never ",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectRegularly.value =
                                  false;
                              introScreenController.selectOccassionally.value =
                                  false;
                              introScreenController.selectRarely.value = false;
                              introScreenController.selectNever.value = true;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Never ",
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
                      introScreenController.skipTrue.value = true;
                      /* Navigator.pushNamed(
                          context, Routes.onboardScreen);*/
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
                      if (introScreenController.skipTrue.value ||
                          introScreenController.selectRegularly.value ||
                          introScreenController.selectOccassionally.value ||
                          introScreenController.selectRarely.value ||
                          introScreenController.selectNever.value) {
                        if (commonController.retakeValue.value) {
                          Navigator.pushNamed(
                              context, Routes.profileEditScreen);
                          commonController.retakeValue.value = false;
                            commonController
                                          .retakeValueProfile.value = true;
                        } else {
                          Navigator.pushNamed(context, Routes.onboardScreen);
                        }
                      } else {
                        CustomToast.showErrorToast(msg: "Select your Intent");
                      }
                    },
                    child: Obx(
                      () => Container(
                        margin: const EdgeInsets.only(top: 10, bottom: 30),
                        height: 37,
                        width: 111,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: introScreenController.skipTrue.value||introScreenController.selectRegularly.value ||
                                  introScreenController
                                      .selectOccassionally.value ||
                                  introScreenController.selectRarely.value ||
                                  introScreenController.selectNever.value
                              ? AppColors.mainColor
                              : AppColors.disableColor,
                        ),
                        child: Center(
                          child: HelperWidget().testMethod(
                              16.0, FontWeight.w500, Colors.white, "Submit"),
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
