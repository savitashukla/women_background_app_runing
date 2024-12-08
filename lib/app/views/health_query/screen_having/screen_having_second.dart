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

class ScreenHavingSecond extends StatefulWidget {
  const ScreenHavingSecond({super.key});

  @override
  State<ScreenHavingSecond> createState() => _ScreenHavingSecondState();
}

class _ScreenHavingSecondState extends State<ScreenHavingSecond> {
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
            crossAxisAlignment: CrossAxisAlignment.center,
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
                          child: SvgPicture.asset(ImagesUrl.backArrowIcon,color: AppColors.buttonColor)),
                      Column(
                        children: [
                          height5,
                          CustomProgressBar(
                            color2: AppColors.buttonColor,
                          ),
                          height10,
                          HelperWidget().testMethod(14.0, FontWeight.w400,
                              AppColors.buttonColor, "2/3"),
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
                    () => introScreenController.selectRegu.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegu.value = false;
                              introScreenController.selectOccas.value = false;
                              introScreenController.selectRare.value = false;
                              introScreenController.selectNeve.value = false;
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
                              introScreenController.selectRegu.value = true;
                              introScreenController.selectOccas.value = false;
                              introScreenController.selectRare.value = false;
                              introScreenController.selectNeve.value = false;
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
                    () => introScreenController.selectOccas.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegu.value = false;
                              introScreenController.selectOccas.value = false;
                              introScreenController.selectRare.value = false;
                              introScreenController.selectNeve.value = false;
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
                              introScreenController.selectRegu.value = false;
                              introScreenController.selectOccas.value = true;
                              introScreenController.selectRare.value = false;
                              introScreenController.selectNeve.value = false;
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
                    () => introScreenController.selectRare.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegu.value = false;
                              introScreenController.selectOccas.value = false;
                              introScreenController.selectRare.value = false;
                              introScreenController.selectNeve.value = false;
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
                              introScreenController.selectRegu.value = false;
                              introScreenController.selectOccas.value = false;
                              introScreenController.selectRare.value = true;
                              introScreenController.selectNeve.value = false;
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
                    () => introScreenController.selectNeve.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectRegu.value = false;
                              introScreenController.selectOccas.value = false;
                              introScreenController.selectRare.value = false;
                              introScreenController.selectNeve.value = false;
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
                              introScreenController.selectRegu.value = false;
                              introScreenController.selectOccas.value = false;
                              introScreenController.selectRare.value = false;
                              introScreenController.selectNeve.value = true;
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
                          "Reason of fertility awareness method?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          14.0,
                          FontWeight.w400,
                          AppColors.colorGrayCycleTrack,
                          "What is the primary reason for using fertility awareness method?")),
                  const SizedBox(
                    height: 12,
                  ),
                  Obx(
                    () => introScreenController.selectFP1.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Family planning",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = true;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Family planning",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectUPC2.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Understanding persoanl cycle",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = true;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Understanding persoanl cycle",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectRR.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Religious reasons",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = true;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Religious reasons",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectHM3.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Health monitoring",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = true;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerCenterV5(
                                    context,
                                    "Health monitoring",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  Obx(
                    () => introScreenController.selectOther.value
                        ? GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = false;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Other",
                                    AppColors.buttonColor,
                                    AppColors.whiteColor),
                          )
                        : GestureDetector(
                            onTap: () {
                              introScreenController.selectFP1.value = false;
                              introScreenController.selectUPC2.value = false;
                              introScreenController.selectRR.value = false;
                              introScreenController.selectHM3.value = false;
                              introScreenController.selectOther.value = true;
                            },
                            child: HelpWeightHealthQuery()
                                .answerWidgetContainerBottomV10(
                                    context,
                                    "Other",
                                    AppColors.whiteColor,
                                    AppColors.textColorQus),
                          ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.screenHavingThird);
                },
                child: Obx(()=>
                   HelpWeightHealthQuery().nextContainer(buttonColor: 
                  introScreenController.selectFP1.value ||
                                introScreenController.selectUPC2.value ||
                                introScreenController.selectRR.value ||
                                introScreenController.selectHM3.value ||
                                introScreenController.selectOther.value?true:false ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
