import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/home_controller/symptoms_mood_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/helper_widgets/search_widget.dart';
import 'package:o_woman/utils/helper_widgets/sympyoms_modd_widget.dart';

class SymptomsAndMoodScreen extends StatelessWidget {
  SymptomsAndMoodScreen({super.key});

  SymptomsAndMoodController symptomsAndMoodController =
      Get.put(SymptomsAndMoodController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Symptoms & Mood",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Column(
          children: [
            // const SearchWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.19,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.r),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "How are you feeling today?",
                                  style: w500_16Poppins(
                                      color: AppColors.blackColor
                                          .withOpacity(0.8)),
                                ),
                                height10,
                                Obx(
                                  () => Wrap(
                                    spacing: 10.w,
                                    runSpacing: 10.h,
                                    children: List.generate(
                                        symptomsAndMoodController
                                            .feelingsList.length,
                                        (index) => GestureDetector(
                                              onTap: () {
                                                for (int i = 0;
                                                    i <
                                                        symptomsAndMoodController
                                                            .feelingsList
                                                            .length;
                                                    i++) {
                                                  if (i == index) {
                                                    symptomsAndMoodController
                                                            .selectedfeelingsItems![
                                                                i]
                                                            .value =
                                                        !symptomsAndMoodController
                                                            .selectedfeelingsItems![
                                                                i]
                                                            .value;
                                                  }
                                                  // else {
                                                  //   symptomsAndMoodController
                                                  //       .selectedfeelingsItems![
                                                  //           i]
                                                  //       .value = false;
                                                  // }
                                                }
                                              },
                                              child: Obx(() => FeelingsWidget(
                                                    imgUrl: symptomsAndMoodController
                                                            .feelingsImagesList[
                                                        index],
                                                    text:
                                                        symptomsAndMoodController
                                                                .feelingsList[
                                                            index],
                                                    fillColor:
                                                        symptomsAndMoodController
                                                                .selectedfeelingsItems![
                                                                    index]
                                                                .value
                                                            ? AppColors
                                                                .buttonColor
                                                                .withOpacity(
                                                                    0.2)
                                                            : AppColors
                                                                .disableColor
                                                                .withOpacity(
                                                                    0.1),
                                                  )),
                                            )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Menustrual Flow",
                                    style: w500_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          symptomsAndMoodController
                                              .menutrualFlowList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          symptomsAndMoodController
                                                              .menutrualFlowList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      symptomsAndMoodController
                                                              .selectedMenusrualFlowItems![
                                                                  i]
                                                              .value =
                                                          !symptomsAndMoodController
                                                              .selectedMenusrualFlowItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      symptomsAndMoodController
                                                          .selectedMenusrualFlowItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(
                                                    () => SymptomsMoodWidget(
                                                          title: symptomsAndMoodController
                                                                  .menutrualFlowList[
                                                              index],
                                                          fillColor: symptomsAndMoodController
                                                                      .selectedMenusrualFlowItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .darkPinkColor
                                                                  .withOpacity(
                                                                      0.2)
                                                              : AppColors
                                                                  .whiteColor,
                                                          borderColor: AppColors
                                                              .darkPinkColor,
                                                          imagURL:
                                                              symptomsAndMoodController
                                                                      .menutrualFlowImagesList[
                                                                  index],
                                                        )),
                                              )),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Symptoms",
                                    style: w500_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          symptomsAndMoodController
                                              .symptomsList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          symptomsAndMoodController
                                                              .symptomsList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      symptomsAndMoodController
                                                              .selectedSymptomsItems![
                                                                  i]
                                                              .value =
                                                          !symptomsAndMoodController
                                                              .selectedSymptomsItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      symptomsAndMoodController
                                                          .selectedSymptomsItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(
                                                    () => SymptomsMoodWidget(
                                                          title: symptomsAndMoodController
                                                                  .symptomsList[
                                                              index],
                                                          fillColor: symptomsAndMoodController
                                                                      .selectedSymptomsItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .lightBlue
                                                              : AppColors
                                                                  .whiteColor,
                                                          height: 14.h,
                                                          width: 14.w,
                                                          iconColor:
                                                              const Color(
                                                                  0xff7ea3ff),
                                                          borderColor: symptomsAndMoodController
                                                                      .selectedSymptomsItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? Colors
                                                                  .transparent
                                                              : AppColors
                                                                  .lightBlue,
                                                          imagURL:
                                                              symptomsAndMoodController
                                                                      .symptomsImagesList[
                                                                  index],
                                                        )),
                                              )),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Gut Health",
                                    style: w500_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          symptomsAndMoodController
                                              .gutHealthList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          symptomsAndMoodController
                                                              .gutHealthList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      symptomsAndMoodController
                                                              .selectedgutHealthListItems![
                                                                  i]
                                                              .value =
                                                          !symptomsAndMoodController
                                                              .selectedgutHealthListItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      symptomsAndMoodController
                                                          .selectedgutHealthListItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(() =>
                                                    SymptomsMoodWidget(
                                                      title:
                                                          symptomsAndMoodController
                                                                  .gutHealthList[
                                                              index],
                                                      fillColor: symptomsAndMoodController
                                                                  .selectedgutHealthListItems![
                                                                      index]
                                                                  .value ==
                                                              true
                                                          ? AppColors
                                                              .topDrawProfileCircleFast
                                                              .withOpacity(0.3)
                                                          : AppColors
                                                              .whiteColor,
                                                      borderColor: AppColors
                                                          .topDrawProfileCircleFast,
                                                      imagURL:
                                                          symptomsAndMoodController
                                                                  .gutHealthImagesList[
                                                              index],
                                                    )),
                                              )),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Mucus Monitoring",
                                    style: w500_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          symptomsAndMoodController
                                              .mucusMonitoringList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          symptomsAndMoodController
                                                              .mucusMonitoringList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      symptomsAndMoodController
                                                              .selectedmucusMonitoringItems![
                                                                  i]
                                                              .value =
                                                          !symptomsAndMoodController
                                                              .selectedmucusMonitoringItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      symptomsAndMoodController
                                                          .selectedmucusMonitoringItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(() =>
                                                    SymptomsMoodWidget(
                                                      iconColor: AppColors
                                                          .mucusIconColor,
                                                      title: symptomsAndMoodController
                                                              .mucusMonitoringList[
                                                          index],
                                                      fillColor: symptomsAndMoodController
                                                                  .selectedmucusMonitoringItems![
                                                                      index]
                                                                  .value ==
                                                              true
                                                          ? AppColors
                                                              .mucusMonitoringColor
                                                              .withOpacity(0.3)
                                                          : AppColors
                                                              .whiteColor,
                                                      borderColor: AppColors
                                                          .mucusMonitoringColor,
                                                      imagURL:
                                                          symptomsAndMoodController
                                                                  .mucusMonitoringImagesList[
                                                              index],
                                                    )),
                                              )),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Sex & Sex drive",
                                    style: w500_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          symptomsAndMoodController
                                              .sexAndSexDriveList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          symptomsAndMoodController
                                                              .sexAndSexDriveList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      symptomsAndMoodController
                                                              .selectedsexAndSexDriveItems![
                                                                  i]
                                                              .value =
                                                          !symptomsAndMoodController
                                                              .selectedsexAndSexDriveItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      symptomsAndMoodController
                                                          .selectedsexAndSexDriveItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(() =>
                                                    SymptomsMoodWidget(
                                                      title: symptomsAndMoodController
                                                              .sexAndSexDriveList[
                                                          index],
                                                      fillColor: symptomsAndMoodController
                                                                  .selectedsexAndSexDriveItems![
                                                                      index]
                                                                  .value ==
                                                              true
                                                          ? AppColors
                                                              .homePageDailyRCST
                                                              .withOpacity(0.15)
                                                          : AppColors
                                                              .whiteColor,
                                                      borderColor: AppColors
                                                          .homePageDailyRCST,
                                                      imagURL:
                                                          symptomsAndMoodController
                                                                  .sexAndSexDriveImagesList[
                                                              index],
                                                    )),
                                              )),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Ovulation Test",
                                    style: w500_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          symptomsAndMoodController
                                              .ovulationtestList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          symptomsAndMoodController
                                                              .ovulationtestList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      symptomsAndMoodController
                                                              .selectedovulationtestItems![
                                                                  i]
                                                              .value =
                                                          !symptomsAndMoodController
                                                              .selectedovulationtestItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      symptomsAndMoodController
                                                          .selectedovulationtestItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(() =>
                                                    SymptomsMoodWidget(
                                                      title: symptomsAndMoodController
                                                              .ovulationtestList[
                                                          index],
                                                      fillColor: symptomsAndMoodController
                                                                  .selectedovulationtestItems![
                                                                      index]
                                                                  .value ==
                                                              true
                                                          ? AppColors
                                                              .ovulationTestColor
                                                              .withOpacity(0.4)
                                                          : AppColors
                                                              .whiteColor,
                                                      borderColor: AppColors
                                                          .ovulationTestColor
                                                          .withOpacity(0.6),
                                                      imagURL:
                                                          symptomsAndMoodController
                                                                  .ovulationtestImagesList[
                                                              index],
                                                    )),
                                              )),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                        height15,
                        Container(
                          // height: MediaQuery.of(context).size.height * 0.22,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.whiteColor),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 10.h),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Pregnancy Test",
                                    style: w500_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          symptomsAndMoodController
                                              .pregnancytestList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          symptomsAndMoodController
                                                              .pregnancytestList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      symptomsAndMoodController
                                                              .selectedpregnancytestItems![
                                                                  i]
                                                              .value =
                                                          !symptomsAndMoodController
                                                              .selectedpregnancytestItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      symptomsAndMoodController
                                                          .selectedpregnancytestItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(() =>
                                                    SymptomsMoodWidget(
                                                      title: symptomsAndMoodController
                                                              .pregnancytestList[
                                                          index],
                                                      fillColor: symptomsAndMoodController
                                                                  .selectedpregnancytestItems![
                                                                      index]
                                                                  .value ==
                                                              true
                                                          ? AppColors
                                                              .homePageDailyRCcProg
                                                              .withOpacity(0.2)
                                                          : AppColors
                                                              .whiteColor,
                                                      borderColor: AppColors
                                                          .homePageDailyRCcProg
                                                          .withOpacity(0.6),
                                                      imagURL:
                                                          symptomsAndMoodController
                                                                  .pregnancytestImagesList[
                                                              index],
                                                    )),
                                              )),
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(12.0.sp),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.05,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.r),
                    color: AppColors.buttonColor),
                child: Center(
                  child: Text(
                    "Apply",
                    style: w500_16Poppins(color: AppColors.whiteColor),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
