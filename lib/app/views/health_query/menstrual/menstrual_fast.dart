import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/home_controller/commonController.dart';
import 'package:o_woman/app/viewmodels/post_login/qa_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';

import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';
import '../../../viewmodels/post_login/health_query_controller.dart';
import '../help_weight_health_query/help_weight_health_query.dart';

class MenstrualFastScreen extends StatefulWidget {
  const MenstrualFastScreen({super.key});

  @override
  State<MenstrualFastScreen> createState() => _MenstrualFastScreenState();
}

class _MenstrualFastScreenState extends State<MenstrualFastScreen> {
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());
  QAController qaController = Get.put(QAController());
  CommonController commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    var currentQuestion = qaController.getCurrentQuestion();
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: SingleChildScrollView(
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     Navigator.pop(context);
                        //   },
                        //   child: Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         vertical: 10.0.h, horizontal: 3.w),
                        //     child: Align(
                        //         alignment: Alignment.topLeft,
                        //         child: SvgPicture.asset(
                        //           ImagesUrl.backwardIcon,
                        //           color: AppColors.mainColor,
                        //         )),
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.all(10.0.sp),
                          child: HelperWidget().testMethod(
                              14.0,
                              FontWeight.w400,
                              AppColors.buttonColor,
                              "${qaController.currentIndex + 1}/${qaController.questions.length}"),
                        ),
                      ],
                    ),
                    height10,
                    SizedBox(
                      height: 210.h,
                      width: 250.w,
                      child: Image.asset(
                        currentQuestion.imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                    height15,
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: HelperWidget().testMethodStartAlign(
                          16.0,
                          FontWeight.w500,
                          Colors.black,
                          currentQuestion.question,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: currentQuestion.questionOption
                          .asMap()
                          .entries
                          .map((MapEntry<int, dynamic> entry) {
                        var option = entry.value;
                        return ListTile(
                          title: GestureDetector(
                            onTap: () {
                              qaController.selectAnswer(
                                currentQuestion.qid,
                                option.answer,
                              );
                            },
                            child: Obx(
                              () => Container(
                                width: MediaQuery.of(context).size.width,
                                height: 38,
                                padding: EdgeInsets.only(left: 10.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: option.answer ==
                                          qaController.selectedAnswers[
                                              currentQuestion.qid]
                                      ? AppColors.mainColor
                                      : AppColors.whiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HelperWidget().testMethod(
                                      16.0,
                                      FontWeight.w400,
                                      option.answer ==
                                              qaController.selectedAnswers[
                                                  currentQuestion.qid]
                                          ? Colors.white
                                          : Colors.black,
                                      option.answer,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(right: 15.w, left: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                  onTap: qaController.currentIndex.value >= 2
                      ? () {
                          qaController.previousQuestion();
                          Get.forceAppUpdate();
                        }
                      : null,
                  child: Obx(
                    () => HelpWeightHealthQuery().nextContainer(
                        text: "Previous",
                        buttonColor: qaController.currentIndex.value >= 2
                            ? true
                            : false),
                  )),
              width30,
              GestureDetector(
                onTap: () {
                  if (qaController.selectedAnswers[currentQuestion.qid] !=
                      null) {
                    // Reset the selected answer to null
                    qaController.selectedAnswers[currentQuestion.qid] = "";
                    print(
                        "The selected answer is 00000000000000000000000000${qaController.selectedAnswers[currentQuestion.qid]}");

                    // Force the app update to reflect the change
                    Get.forceAppUpdate();
                  }

                  // Check if there are more questions
                  if (qaController.currentIndex <
                      qaController.questions.length) {
                    // Move to the next question
                    qaController.nextQuestion();
                    Get.forceAppUpdate();
                  } else {
                    // Navigate to the next screen (onboardScreen)
                    Navigator.pushNamed(context, Routes.onboardScreen);
                  }
                  // if (qaController.currentIndex <
                  //     qaController.questions.length) {
                  //   Get.forceAppUpdate();
                  // } else {
                  //   Navigator.pushNamed(context, Routes.onboardScreen);
                  // }
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: HelperWidget().testMethod(
                      14.0, FontWeight.w500, AppColors.buttonColor, "Skip"),
                ),
              ),
              //   GestureDetector(
              //   onTap: () {
              //     if (qaController.currentIndex <
              //         qaController.questions.length) {
              //       Get.forceAppUpdate();
              //     } else {
              //       Navigator.pushNamed(context, Routes.onboardScreen);
              //     }
              //   },
              //   child: HelpWeightHealthQuery()
              //       .nextContainer(buttonColor: true, text: "Skip"),
              // ),
              width30,
              GestureDetector(
                  onTap: () async {
                    if (qaController.selectedAnswers[currentQuestion.qid] ==
                            null ||
                        qaController.selectedAnswers[currentQuestion.qid] ==
                            "") {
                      CustomToast.showErrorToast(msg: 'Select your intent');
                    } else {
                      if (qaController.currentIndex.value <
                          qaController.questions.length) {
                        Get.forceAppUpdate();
                      } else if (commonController.retakeValue.value) {
                        Future.delayed(Duration.zero, () {
                          Navigator.pushNamed(
                              context, Routes.profileEditScreen);
                          commonController.retakeValue.value = false;
                        });
                      } else {
                        Future.delayed(Duration.zero, () {
                          Navigator.pushNamed(context, Routes.onboardScreen);
                        });
                      }
                    }
                    // if (qaController.selectedAnswers[currentQuestion.qid] ==
                    //         null ||
                    //     qaController.selectedAnswers[currentQuestion.qid] ==
                    //         "-1") {
                    //   CustomToast.showErrorToast(msg: 'Select your intent');
                    // } else {
                    //   if (qaController.currentIndex.value <
                    //       qaController.questions.length) {
                    //     Get.forceAppUpdate();
                    //   } else if (commonController.retakeValue.value) {
                    //     Navigator.pushNamed(context, Routes.profileEditScreen);
                    //     commonController.retakeValue.value = false;
                    //   } else {
                    //     Navigator.pushNamed(context, Routes.onboardScreen);
                    //   }
                    //   // Navigator.pushNamed(context, Routes.onboardScreen);
                    // }
                  },
                  child: Obx(
                    () => HelpWeightHealthQuery().nextContainer(
                        text: qaController.currentIndex.value ==
                                qaController.questions.length
                            ? "Submit"
                            : "Next",
                        buttonColor: qaController
                                        .selectedAnswers[currentQuestion.qid] ==
                                    null ||
                                qaController
                                        .selectedAnswers[currentQuestion.qid] ==
                                    ""
                            ? false
                            : true),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomProgressBar extends StatefulWidget {
  CustomProgressBar({super.key, this.color1, this.color2, this.color3});
  Color? color1;
  Color? color2;
  Color? color3;
  @override
  State<CustomProgressBar> createState() => _CustomProgressBarState();
}

class _CustomProgressBarState extends State<CustomProgressBar> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Row(
      children: [
        Container(
          height: 6,
          width: 35,
          decoration: BoxDecoration(
              color: widget.color1 ?? AppColors.buttonColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10))),
        ),
        Container(
          height: 6,
          width: 35,
          decoration: BoxDecoration(
            color: widget.color2 ?? AppColors.colorGray.withOpacity(0.5),
          ),
        ),
        Container(
          height: 6,
          width: 35,
          decoration: BoxDecoration(
              color: widget.color3 ?? AppColors.colorGray.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
        ),
      ],
    );
  }
}
