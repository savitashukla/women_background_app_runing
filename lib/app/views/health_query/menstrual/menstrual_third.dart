import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/health_query/menstrual/menstrual_fast.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';
import '../../../viewmodels/post_login/health_query_controller.dart';
import '../help_weight_health_query/help_weight_health_query.dart';

class MenstrualThirdScreen extends StatefulWidget {
  const MenstrualThirdScreen({super.key});

  @override
  State<MenstrualThirdScreen> createState() => _MenstrualThirdScreenState();
}

class _MenstrualThirdScreenState extends State<MenstrualThirdScreen> {
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
                            14.0, FontWeight.w400, AppColors.buttonColor, "3/12"),
                      ),
                      // Column(
                      //   children: [
                      //     height5,
                      //     CustomProgressBar(
                      //       color2: AppColors.buttonColor,
                      //       color3: AppColors.buttonColor,
                      //     ),
                      //     height10,
                      //     HelperWidget().testMethod(14.0, FontWeight.w400,
                      //         AppColors.buttonColor, "3/3"),
                      //   ],
                      // ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset(
                    ImagesUrl.menstrualThird,
                    height: 185,
                    width: 260,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 5.0.w),
                    child: HelperWidget().testMethodStartAlign(
                        16.0,
                        FontWeight.w500,
                        Colors.black,
                        "Do you have any known medical conditions that may affect your menstrual cycle (choose one):"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Obx(
                    () => introScreenController.selectMenstrualThirdYes.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualThirdYes.value = false;
                              introScreenController
                                  .selectMenstrualThirdNo.value = false;
                            },
                            child: Container(
                                height: 38,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                        FontWeight.w400, Colors.white, "Yes"),
                                  ],
                                )),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualThirdYes.value = true;
                              introScreenController
                                  .selectMenstrualThirdNo.value = false;
                            },
                            child: Container(
                                height: 38,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
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
                                        FontWeight.w400, Colors.black, "Yes"),
                                  ],
                                )),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectMenstrualThirdNo.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualThirdYes.value = false;
                              introScreenController
                                  .selectMenstrualThirdNo.value = false;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
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
                                      FontWeight.w400, Colors.white, "No"),
                                ],
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController
                                  .selectMenstrualThirdYes.value = false;
                              introScreenController
                                  .selectMenstrualThirdNo.value = true;
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
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
                                      FontWeight.w400, Colors.black, "No"),
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
                      Navigator.pushNamed(context, Routes.fertilityFast);
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
                      if (introScreenController.selectMenstrualThirdYes.value ||
                          introScreenController.selectMenstrualThirdNo.value) {
                        Navigator.pushNamed(context, Routes.fertilityFast);
                      } else {
                        CustomToast.showErrorToast(msg: "Select any one");
                      }
                    },
                    child: Obx(()=>
                       HelpWeightHealthQuery().nextContainer(buttonColor: introScreenController.selectMenstrualThirdYes.value ||
                            introScreenController.selectMenstrualThirdNo.value?true:false),
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
