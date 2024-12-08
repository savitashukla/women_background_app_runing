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

class ScreenHavingThird extends StatefulWidget {
  const ScreenHavingThird({super.key});

  @override
  State<ScreenHavingThird> createState() => _ScreenHavingThirdState();
}

class _ScreenHavingThirdState extends State<ScreenHavingThird> {
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGrayDarkBg,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                child: Column(
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
                              color3: AppColors.buttonColor,
                            ),
                            height10,
                            HelperWidget().testMethod(14.0, FontWeight.w400,
                                AppColors.buttonColor, "3/3"),
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
                      () => introScreenController.selectRegu1.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectRegu1.value = false;
                                introScreenController.selectOccas1.value =
                                    false;
                                introScreenController.selectRare1.value = false;
                                introScreenController.selectNeve1.value = false;
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
                                introScreenController.selectRegu1.value = true;
                                introScreenController.selectOccas1.value =
                                    false;
                                introScreenController.selectRare1.value = false;
                                introScreenController.selectNeve1.value = false;
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
                      () => introScreenController.selectOccas1.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectRegu1.value = false;
                                introScreenController.selectOccas1.value =
                                    false;
                                introScreenController.selectRare1.value = false;
                                introScreenController.selectNeve1.value = false;
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
                                introScreenController.selectRegu1.value = false;
                                introScreenController.selectOccas1.value = true;
                                introScreenController.selectRare1.value = false;
                                introScreenController.selectNeve1.value = false;
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
                      () => introScreenController.selectRare1.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectRegu1.value = false;
                                introScreenController.selectOccas1.value =
                                    false;
                                introScreenController.selectRare1.value = false;
                                introScreenController.selectNeve1.value = false;
                              },
                              child: HelpWeightHealthQuery()
                                  .answerWidgetContainerCenterV5(
                                      context,
                                      "Rarely",
                                      AppColors.buttonColor,
                                      AppColors.whiteColor),
                            )
                          : GestureDetector(
                              onTap: () {
                                introScreenController.selectRegu1.value = false;
                                introScreenController.selectOccas1.value =
                                    false;
                                introScreenController.selectRare1.value = true;
                                introScreenController.selectNeve1.value = false;
                              },
                              child: HelpWeightHealthQuery()
                                  .answerWidgetContainerCenterV5(
                                      context,
                                      "Rarely",
                                      AppColors.whiteColor,
                                      AppColors.textColorQus),
                            ),
                    ),
                    Obx(
                      () => introScreenController.selectNeve1.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectRegu1.value = false;
                                introScreenController.selectOccas1.value =
                                    false;
                                introScreenController.selectRare1.value = false;
                                introScreenController.selectNeve1.value = false;
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
                                introScreenController.selectRegu1.value = false;
                                introScreenController.selectOccas1.value =
                                    false;
                                introScreenController.selectRare1.value = false;
                                introScreenController.selectNeve1.value = true;
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
                      () => introScreenController.selectFP11.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                                introScreenController.selectFP11.value = true;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                      () => introScreenController.selectUPC22.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = true;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                      () => introScreenController.selectRR33.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = true;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                      () => introScreenController.selectH44.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = true;
                                introScreenController.selectOther55.value =
                                    false;
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
                      () => introScreenController.selectOther55.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    false;
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
                                introScreenController.selectFP11.value = false;
                                introScreenController.selectUPC22.value = false;
                                introScreenController.selectRR33.value = false;
                                introScreenController.selectH44.value = false;
                                introScreenController.selectOther55.value =
                                    true;
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
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.dashBoard);
                },
                child: Obx(()=>
                   HelpWeightHealthQuery().nextContainer(
                    buttonColor: introScreenController.selectFP11.value ||
                                  introScreenController.selectUPC22.value ||
                                  introScreenController.selectRR33.value ||
                                  introScreenController.selectH44.value ||
                                  introScreenController.selectOther55.value?true:false
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
