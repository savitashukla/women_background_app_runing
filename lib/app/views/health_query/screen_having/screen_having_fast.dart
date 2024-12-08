import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/post_login/health_query_controller.dart';
import 'package:o_woman/app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import 'package:o_woman/app/views/health_query/menstrual/menstrual_fast.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';

class ScreenHavingFast extends StatefulWidget {
  const ScreenHavingFast({super.key});

  @override
  State<ScreenHavingFast> createState() => _ScreenHavingFastState();
}

class _ScreenHavingFastState extends State<ScreenHavingFast> {
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGrayDarkBg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(ImagesUrl.backArrowIcon,
                              color: AppColors.buttonColor)),
                      Column(
                        children: [
                          height5,
                          CustomProgressBar(),
                          height10,
                          HelperWidget().testMethod(14.0, FontWeight.w400,
                              AppColors.buttonColor, "1/3"),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.dashBoard);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: HelperWidget().testMethod(14.0,
                              FontWeight.w500, AppColors.buttonColor, "Skip"),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          16.0,
                          FontWeight.w500,
                          AppColors.textColorQus,
                          "What is part of your diet?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          14.0,
                          FontWeight.w400,
                          AppColors.colorGrayCycleTrack,
                          "Do you consume hydrating foods (e.g., fruits with high water content) as part of your snacking habits?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectReg.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectReg.value = false;
                              introScreenController.selectOcca.value = false;
                              introScreenController.selectRar.value = false;
                              introScreenController.selectNev.value = false;
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
                              introScreenController.selectReg.value = true;
                              introScreenController.selectOcca.value = false;
                              introScreenController.selectRar.value = false;
                              introScreenController.selectNev.value = false;
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
                    () => introScreenController.selectOcca.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectReg.value = false;
                              introScreenController.selectOcca.value = false;
                              introScreenController.selectRar.value = false;
                              introScreenController.selectNev.value = false;
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
                              introScreenController.selectReg.value = false;
                              introScreenController.selectOcca.value = true;
                              introScreenController.selectRar.value = false;
                              introScreenController.selectNev.value = false;
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
                    () => introScreenController.selectRar.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectReg.value = false;
                              introScreenController.selectOcca.value = false;
                              introScreenController.selectRar.value = false;
                              introScreenController.selectNev.value = false;
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
                              introScreenController.selectReg.value = false;
                              introScreenController.selectOcca.value = false;
                              introScreenController.selectRar.value = true;
                              introScreenController.selectNev.value = false;
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
                    () => introScreenController.selectNev.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectReg.value = false;
                              introScreenController.selectOcca.value = false;
                              introScreenController.selectRar.value = false;
                              introScreenController.selectNev.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Never",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectReg.value = false;
                              introScreenController.selectOcca.value = false;
                              introScreenController.selectRar.value = false;
                              introScreenController.selectNev.value = true;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Never",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          16.0,
                          FontWeight.w500,
                          AppColors.textColorQus,
                          "How are you tracking water intake?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          14.0,
                          FontWeight.w400,
                          AppColors.colorGrayCycleTrack,
                          "Do you track your daily water intake, and if so, how?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectW1.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectW1.value = false;
                              introScreenController.selectW2.value = false;
                              introScreenController.selectW3.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Through a mobile app ",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectW1.value = true;
                              introScreenController.selectW2.value = false;
                              introScreenController.selectW3.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Through a mobile app ",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectW2.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectW1.value = false;
                              introScreenController.selectW2.value = false;
                              introScreenController.selectW3.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Using a marking water bottle  ",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectW1.value = false;
                              introScreenController.selectW2.value = true;
                              introScreenController.selectW3.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Using a marking water bottle  ",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectW3.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectW1.value = false;
                              introScreenController.selectW2.value = false;
                              introScreenController.selectW3.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Not actively tracking",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectW1.value = false;
                              introScreenController.selectW2.value = false;
                              introScreenController.selectW3.value = true;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Not actively tracking",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          16.0,
                          FontWeight.w500,
                          AppColors.textColorQus,
                          "What is part of your diet?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          14.0,
                          FontWeight.w400,
                          AppColors.colorGrayCycleTrack,
                          "Do you regularly consume milk or dairy-based beverages as part of your diet?")),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.screenHavingSecond);
                  },
                  child: Obx(()=>
                     HelpWeightHealthQuery().nextContainer(
                        buttonColor: introScreenController.selectW1.value ||
                                introScreenController.selectW2.value ||
                                introScreenController.selectW3.value
                            ? true
                            : false),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
