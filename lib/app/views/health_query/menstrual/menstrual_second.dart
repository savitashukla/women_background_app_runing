import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import 'package:o_woman/app/views/health_query/menstrual/menstrual_fast.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';
import '../../../viewmodels/post_login/health_query_controller.dart';

class MenstrualSecondScreen extends StatefulWidget {
  const MenstrualSecondScreen({super.key});

  @override
  State<MenstrualSecondScreen> createState() => _MenstrualSecondScreenState();
}

class _MenstrualSecondScreenState extends State<MenstrualSecondScreen> {
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: true,
      right: true,
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(height: 25.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding:  EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 3.w),

                      child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            ImagesUrl.backwardIcon,
                            color: AppColors.mainColor,
                          )),
                    ),
                  ),
                      Padding(
                        padding:  EdgeInsets.all(10.0.sp),
                        child: HelperWidget().testMethod(
                            14.0, FontWeight.w400, AppColors.buttonColor, "2/12"),
                      ),
                      // Column(
                      //   children: [
                      //     height5,
                      //     CustomProgressBar(
                      //       color2: AppColors.buttonColor,
                      //     ),
                      //     height10,
                      //     HelperWidget().testMethod(14.0, FontWeight.w400,
                      //         AppColors.buttonColor, "2/12"),
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Image.asset(
                    ImagesUrl.menstrualSecondImages,
                    height: 185,
                    width: 260,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: HelperWidget().testMethodStartAlign(
                        16.0,
                        FontWeight.w500,
                        Colors.black,
                        "How would you describe the flow of your menstrual periods (choose one):"),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectMenstrualSecondLight.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualSecondLight.value = false;
                              introScreenController
                                  .selectMenstrualSecondModerate.value = false;
                              introScreenController
                                  .selectMenstrualSecondHeavy.value = false;
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
                                    HelperWidget().testMethod(16.0,
                                        FontWeight.w400, Colors.white, "Light"),
                                  ],
                                )),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualSecondLight.value = true;
                              introScreenController
                                  .selectMenstrualSecondModerate.value = false;
                              introScreenController
                                  .selectMenstrualSecondHeavy.value = false;
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
                                    HelperWidget().testMethod(16.0,
                                        FontWeight.w400, Colors.black, "Light"),
                                  ],
                                )),
                          ),
                  ),
                  Obx(
                    () => introScreenController
                            .selectMenstrualSecondModerate.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualSecondLight.value = false;
                              introScreenController
                                  .selectMenstrualSecondModerate.value = false;
                              introScreenController
                                  .selectMenstrualSecondHeavy.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
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
                                      Colors.white,
                                      "Moderate"),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualSecondLight.value = false;
                              introScreenController
                                  .selectMenstrualSecondModerate.value = true;
                              introScreenController
                                  .selectMenstrualSecondHeavy.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
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
                                      Colors.black,
                                      "Moderate"),
                                ],
                              ),
                            ),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectMenstrualSecondHeavy.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualSecondLight.value = false;
                              introScreenController
                                  .selectMenstrualSecondModerate.value = false;
                              introScreenController
                                  .selectMenstrualSecondHeavy.value = false;
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
                                  HelperWidget().testMethod(16.0,
                                      FontWeight.w400, Colors.white, "Heavy"),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualSecondLight.value = false;
                              introScreenController
                                  .selectMenstrualSecondModerate.value = false;
                              introScreenController
                                  .selectMenstrualSecondHeavy.value = true;
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
                                  HelperWidget().testMethod(16.0,
                                      FontWeight.w400, Colors.black, "Heavy"),
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
                      Navigator.pushNamed(
                            context, Routes.menstrualThirdScreen);
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
                              .selectMenstrualSecondLight.value ||
                          introScreenController
                              .selectMenstrualSecondModerate.value ||
                          introScreenController
                              .selectMenstrualSecondHeavy.value) {
                        Navigator.pushNamed(
                            context, Routes.menstrualThirdScreen);
                      } else {
                        CustomToast.showErrorToast(msg: "Select your Intent");
                      }
                    },
                    child: Obx(
                      () => HelpWeightHealthQuery().nextContainer(
                          buttonColor: introScreenController
                                      .selectMenstrualSecondLight.value ||
                                  introScreenController
                                      .selectMenstrualSecondModerate.value ||
                                  introScreenController
                                      .selectMenstrualSecondHeavy.value
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
