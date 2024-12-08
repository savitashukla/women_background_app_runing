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

class FertilityThirdScreen extends StatefulWidget {
  const FertilityThirdScreen({super.key});

  @override
  State<FertilityThirdScreen> createState() => _FertilityThirdScreenState();
}

class _FertilityThirdScreenState extends State<FertilityThirdScreen> {
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
                            AppColors.buttonColor, "6/12"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    ImagesUrl.fertilityThird,
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
                          "If you've used ovulation prediction kits or fertility tracking apps, how satisfied are you with your experience?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectVerysatisfied.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Very satisfied",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  true;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Very satisfied",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectSatisfied.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Satisfied",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  true;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Satisfied",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectNeutral.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Neutral",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = true;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Neutral",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectDissatisfied.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Dissatisfied",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  true;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Dissatisfied",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectVerydissatisfied.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Very dissatisfied",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectVerysatisfied.value =
                                  false;
                              introScreenController.selectSatisfied.value =
                                  false;
                              introScreenController.selectNeutral.value = false;
                              introScreenController.selectDissatisfied.value =
                                  false;
                              introScreenController
                                  .selectVerydissatisfied.value = true;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Very dissatisfied",
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
                      Navigator.pushNamed(context, Routes.generalHealthFast);
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
                      if (introScreenController.selectVerysatisfied.value ||
                          introScreenController.selectSatisfied.value ||
                          introScreenController.selectNeutral.value ||
                          introScreenController.selectDissatisfied.value ||
                          introScreenController.selectVerydissatisfied.value) {
                        Navigator.pushNamed(context, Routes.generalHealthFast);
                      } else {
                        CustomToast.showErrorToast(msg: "Select your Intent");
                      }
                    },
                    child: Obx(
                      () => HelpWeightHealthQuery().nextContainer(
                          buttonColor: introScreenController
                                      .selectVerysatisfied.value ||
                                  introScreenController.selectSatisfied.value ||
                                  introScreenController.selectNeutral.value ||
                                  introScreenController
                                      .selectDissatisfied.value ||
                                  introScreenController
                                      .selectVerydissatisfied.value
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
