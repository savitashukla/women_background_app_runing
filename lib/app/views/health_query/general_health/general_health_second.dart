import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:o_woman/app/viewmodels/post_login/health_query_controller.dart';
import 'package:o_woman/app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import 'package:o_woman/app/views/health_query/menstrual/menstrual_fast.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';

class GeneralHealthSecond extends StatefulWidget {
  const GeneralHealthSecond({super.key});

  @override
  State<GeneralHealthSecond> createState() => _GeneralHealthSecondState();
}

class _GeneralHealthSecondState extends State<GeneralHealthSecond> {
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
                            AppColors.buttonColor, "8/12"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    ImagesUrl.generalHealthSecondImages,
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
                          "Do you have any chronic health conditions?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectHealthConditionYes.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectHealthConditionYes.value = false;
                              introScreenController
                                  .selectHealthConditionNo.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Yes",
                                    AppColors.colorPrimary,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectHealthConditionYes.value = true;
                              introScreenController
                                  .selectHealthConditionNo.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Yes",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectHealthConditionNo.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectHealthConditionYes.value = false;
                              introScreenController
                                  .selectHealthConditionNo.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "No",
                                    AppColors.colorPrimary,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectHealthConditionYes.value = false;
                              introScreenController
                                  .selectHealthConditionNo.value = true;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "No",
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
                      Navigator.pushNamed(context, Routes.generalHealthThird);
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
                      if (introScreenController
                              .selectHealthConditionYes.value ||
                          introScreenController.selectHealthConditionNo.value) {
                        Navigator.pushNamed(context, Routes.generalHealthThird);
                      } else {
                        CustomToast.showErrorToast(msg: "Select your Intent");
                      }
                    },
                    child: Obx(
                      () => HelpWeightHealthQuery().nextContainer(
                          buttonColor: introScreenController
                                      .selectHealthConditionYes.value ||
                                  introScreenController
                                      .selectHealthConditionNo.value
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
