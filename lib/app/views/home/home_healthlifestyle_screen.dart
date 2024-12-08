import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/home_controller/water_log_management.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/app/viewmodels/home_controller/pill_corner_controller.dart';
import 'package:o_woman/app/views/home/add_pill_screen.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/app/views/user_profile/settings/sleep_reminder/sleep_reminder_bottom_sheet.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/commonTextField.dart';
import 'package:o_woman/utils/helper_widgets/customTextformfield.dart';
import 'package:o_woman/utils/helper_widgets/healt_llifestyle_widget.dart';
import 'package:o_woman/utils/helper_widgets/search_widget.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';
import 'package:o_woman/utils/helper_widgets/sympyoms_modd_widget.dart';

import '../../viewmodels/home_controller/home_health_lifestyle_controller.dart';

class HomeHealthLifestyleScreen extends StatefulWidget {
  const HomeHealthLifestyleScreen({super.key});

  @override
  State<HomeHealthLifestyleScreen> createState() =>
      _HomeHealthLifestyleScreenState();
}

class _HomeHealthLifestyleScreenState extends State<HomeHealthLifestyleScreen> {
  HomeHealthLifestyleController homeHealthLifestyleController =
      Get.put(HomeHealthLifestyleController());
  SettingsScreenController settingsScreenController =
      Get.put(SettingsScreenController());
  PillCornerController pillCornerController = Get.put(PillCornerController());
  WaterLogManagementController waterLogManagement =
      Get.put(WaterLogManagementController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          centerTitle: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Health & Lifestyle",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Column(
          children: [
            height10,
            // const SearchWidget(),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        height10,
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
                                    "Physical Activity",
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
                                          homeHealthLifestyleController
                                              .physicalActivityList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          homeHealthLifestyleController
                                                              .physicalActivityList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      homeHealthLifestyleController
                                                              .selectedphysicalActivityItems![
                                                                  i]
                                                              .value =
                                                          !homeHealthLifestyleController
                                                              .selectedphysicalActivityItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      homeHealthLifestyleController
                                                          .selectedphysicalActivityItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(
                                                    () => SymptomsMoodWidget(
                                                          title: homeHealthLifestyleController
                                                                  .physicalActivityList[
                                                              index],
                                                          fillColor: homeHealthLifestyleController
                                                                      .selectedphysicalActivityItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .lightBlue
                                                              : AppColors
                                                                  .whiteColor,
                                                          borderColor: homeHealthLifestyleController
                                                                      .selectedphysicalActivityItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? Colors
                                                                  .transparent
                                                              : AppColors
                                                                  .lightBlue,
                                                          imagURL:
                                                              homeHealthLifestyleController
                                                                      .physicalActivityImagesList[
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
                                    "Quite Time",
                                    style: w400_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          homeHealthLifestyleController
                                              .quiteTimeList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          homeHealthLifestyleController
                                                              .quiteTimeList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      homeHealthLifestyleController
                                                              .selectedquiteTimeListItems![
                                                                  i]
                                                              .value =
                                                          !homeHealthLifestyleController
                                                              .selectedquiteTimeListItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      homeHealthLifestyleController
                                                          .selectedquiteTimeListItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(
                                                    () => SymptomsMoodWidget(
                                                          title: homeHealthLifestyleController
                                                                  .quiteTimeList[
                                                              index],
                                                          iconColor: AppColors
                                                              .maroonColor
                                                              .withOpacity(0.7),
                                                          fillColor: homeHealthLifestyleController
                                                                      .selectedquiteTimeListItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .pinkShadeColor
                                                              : AppColors
                                                                  .whiteColor,
                                                          borderColor: homeHealthLifestyleController
                                                                      .selectedquiteTimeListItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? Colors
                                                                  .transparent
                                                              : AppColors
                                                                  .pinkShadeColor,
                                                          imagURL:
                                                              homeHealthLifestyleController
                                                                      .quiteTimeImagesList[
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
                                    "Outdoor Activities",
                                    style: w400_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          homeHealthLifestyleController
                                              .outdoorActivitiesList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          homeHealthLifestyleController
                                                              .outdoorActivitiesList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      homeHealthLifestyleController
                                                              .selectedoutdoorActivitiesItems![
                                                                  i]
                                                              .value =
                                                          !homeHealthLifestyleController
                                                              .selectedoutdoorActivitiesItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      homeHealthLifestyleController
                                                          .selectedoutdoorActivitiesItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(
                                                    () => SymptomsMoodWidget(
                                                          title: homeHealthLifestyleController
                                                                  .outdoorActivitiesList[
                                                              index],
                                                          fillColor: homeHealthLifestyleController
                                                                      .selectedoutdoorActivitiesItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .purpleLightColor
                                                              : AppColors
                                                                  .whiteColor,
                                                          borderColor: homeHealthLifestyleController
                                                                      .selectedoutdoorActivitiesItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? Colors
                                                                  .transparent
                                                              : AppColors
                                                                  .purpleLightColor,
                                                          imagURL:
                                                              homeHealthLifestyleController
                                                                      .outdoorActivitiesImagesList[
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
                                    "Cooking & Baking",
                                    style: w400_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          homeHealthLifestyleController
                                              .cookingBakingList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          homeHealthLifestyleController
                                                              .cookingBakingList
                                                              .length;
                                                      i++) {
                                                    if (i == index) {
                                                      homeHealthLifestyleController
                                                              .selectedcookingBakingItems![
                                                                  i]
                                                              .value =
                                                          !homeHealthLifestyleController
                                                              .selectedcookingBakingItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      homeHealthLifestyleController
                                                          .selectedcookingBakingItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(
                                                    () => SymptomsMoodWidget(
                                                          title: homeHealthLifestyleController
                                                                  .cookingBakingList[
                                                              index],
                                                          fillColor: homeHealthLifestyleController
                                                                      .selectedcookingBakingItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .greenDarkColor
                                                              : AppColors
                                                                  .whiteColor,
                                                          borderColor: homeHealthLifestyleController
                                                                      .selectedcookingBakingItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? Colors
                                                                  .transparent
                                                              : AppColors
                                                                  .greenDarkColor,
                                                          imagURL:
                                                              homeHealthLifestyleController
                                                                      .cookingBakingImagesList[
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
                                    "Music",
                                    style: w400_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          homeHealthLifestyleController
                                              .musicList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          homeHealthLifestyleController
                                                              .musicList.length;
                                                      i++) {
                                                    if (i == index) {
                                                      homeHealthLifestyleController
                                                              .selectedmMusicItems![
                                                                  i]
                                                              .value =
                                                          !homeHealthLifestyleController
                                                              .selectedmMusicItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      homeHealthLifestyleController
                                                          .selectedmMusicItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(
                                                    () => SymptomsMoodWidget(
                                                          title: homeHealthLifestyleController
                                                                  .cookingBakingList[
                                                              index],
                                                          fillColor: homeHealthLifestyleController
                                                                      .selectedmMusicItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .lightOrange
                                                              : AppColors
                                                                  .whiteColor,
                                                          borderColor: homeHealthLifestyleController
                                                                      .selectedmMusicItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? Colors
                                                                  .transparent
                                                              : AppColors
                                                                  .lightOrange,
                                                          imagURL:
                                                              homeHealthLifestyleController
                                                                      .musicImagesList[
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
                                    "Other",
                                    style: w400_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height10,
                                  Obx(
                                    () => Wrap(
                                      spacing: 10.w,
                                      runSpacing: 10.h,
                                      children: List.generate(
                                          homeHealthLifestyleController
                                              .otherList.length,
                                          (index) => GestureDetector(
                                                onTap: () {
                                                  for (int i = 0;
                                                      i <
                                                          homeHealthLifestyleController
                                                              .otherList.length;
                                                      i++) {
                                                    if (i == index) {
                                                      homeHealthLifestyleController
                                                              .selectedOtherItems![
                                                                  i]
                                                              .value =
                                                          !homeHealthLifestyleController
                                                              .selectedOtherItems![
                                                                  i]
                                                              .value;
                                                    } else {
                                                      homeHealthLifestyleController
                                                          .selectedOtherItems![
                                                              i]
                                                          .value = false;
                                                    }
                                                  }
                                                },
                                                child: Obx(() =>
                                                    SymptomsMoodWidget(
                                                      title:
                                                          homeHealthLifestyleController
                                                              .otherList[index],
                                                      fillColor:
                                                          homeHealthLifestyleController
                                                                      .selectedOtherItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? AppColors
                                                                  .lightBlue
                                                              : AppColors
                                                                  .whiteColor,
                                                      borderColor:
                                                          homeHealthLifestyleController
                                                                      .selectedOtherItems![
                                                                          index]
                                                                      .value ==
                                                                  true
                                                              ? Colors
                                                                  .transparent
                                                              : AppColors
                                                                  .lightBlue,
                                                      imagURL:
                                                          homeHealthLifestyleController
                                                                  .otherImagesList[
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Water",
                                        style: w400_16Poppins(
                                            color: AppColors.blackColor
                                                .withOpacity(0.8)),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(context,
                                                Routes.waterLogManagement);
                                          },
                                          child: SvgPicture.asset(
                                              ImagesUrl.forwardIcon))
                                    ],
                                  ),
                                  height10,
                                  Row(
                                    children: [
                                      Container(
                                        height:
                                            getProportionateScreenHeight(40),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            border: Border.all(
                                                color: AppColors.colorGray
                                                    .withOpacity(0.5))),
                                        width: getProportionateScreenWidth(200),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 8.w),
                                          child: Obx(
                                            () => Align(
                                              alignment: Alignment.centerLeft,
                                              child: RichText(
                                                text: TextSpan(
                                                  text:
                                                      "${homeHealthLifestyleController.count.value.toString()} L",
                                                  style: w400_16Poppins(
                                                      color: AppColors
                                                          .textColorQus),
                                                  children: <TextSpan>[
                                                    TextSpan(
                                                        text: "/ 3.5 L ",
                                                        style: w400_14Poppins(
                                                            color: AppColors
                                                                .textColorCycleInfoMore)),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      width15,
                                      InkWell(
                                        onTap: () {
                                          homeHealthLifestyleController
                                              .increment();
                                          // if (homeHealthLifestyleController
                                          //         .count.value <=
                                          //     3.5) {
                                          //   homeHealthLifestyleController
                                          //       .increment();
                                          // } else {
                                          //   null;
                                          // }
                                        },
                                        child: Obx(
                                          () => Container(
                                            // height:
                                            //     getProportionateScreenHeight(100),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    homeHealthLifestyleController
                                                                .count.value <
                                                            3.5
                                                        ? AppColors.mainColor
                                                        : AppColors.mainColor
                                                            .withOpacity(0.2)),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0.sp),
                                              child: const Icon(
                                                Icons.add,
                                                size: 20,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      width15,
                                      InkWell(
                                        onTap: () {
                                          homeHealthLifestyleController
                                              .decrement();
                                          // if (homeHealthLifestyleController
                                          //         .count.value ==
                                          //     0) {
                                          //   homeHealthLifestyleController
                                          //       .decrement();
                                          // } else {
                                          //   null;
                                          // }
                                        },
                                        child: Obx(
                                          () => Container(
                                            // height:
                                            //     getProportionateScreenHeight(60),
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color:
                                                    homeHealthLifestyleController
                                                                .count.value >
                                                            0
                                                        ? AppColors.mainColor
                                                        : AppColors.mainColor
                                                            .withOpacity(0.2)),
                                            child: Padding(
                                              padding: EdgeInsets.all(4.0.sp),
                                              child: const Icon(
                                                Icons.remove,
                                                size: 20,
                                                color: AppColors.whiteColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Weight",
                                        style: w400_16Poppins(
                                            color: AppColors.blackColor
                                                .withOpacity(0.8)),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, Routes.weightAnalysis);
                                          },
                                          child: SvgPicture.asset(
                                              ImagesUrl.forwardIcon))
                                    ],
                                  ),
                                  height10,
                                  Obx(
                                    () => CustomTextFormField(
                                      controller: homeHealthLifestyleController
                                          .weightController.value,
                                      hintText: "Log your weight in Kg",
                                      // suffixText: "Kg",
                                    ),
                                  )
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
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Pill Corner",
                                        style: w400_16Poppins(
                                            color: AppColors.blackColor
                                                .withOpacity(0.8)),
                                      ),
                                      InkWell(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, Routes.addPillScreen);
                                          },
                                          child: SvgPicture.asset(
                                              ImagesUrl.forwardIcon))
                                    ],
                                  ),
                                  height10,
                                  Obx(
                                    () => LoggedPillWidget(
                                      context,
                                      "10:00 AM",
                                      "Implant",
                                      AppColors.mainColor.withOpacity(0.05),
                                      pillCornerController.loggedPill1.value,
                                      imgColor: AppColors.mainColor,
                                    ),
                                  ),
                                  height15,
                                  Obx(
                                    () => LoggedPillWidget(
                                      context,
                                      "05:00 AM, 07:00 PM",
                                      "Vitamin A",
                                      AppColors.whiteColor,
                                      pillCornerController.loggedPill2.value,
                                      imgColor: AppColors.mainColor,
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
                                    "Sleeping Hours",
                                    style: w400_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height5,
                                  Obx(
                                    () => SizedBox(
                                      height: getProportionateScreenHeight(50),
                                      child: CustomTextFormField(
                                        controller:
                                            homeHealthLifestyleController
                                                .sleepingHoursController.value,
                                        hintText: "Log your sleeping hours",
                                      ),
                                    ),
                                  ),
                                  height10,
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text("Set Reminder",
                                            style: w400_16Poppins(
                                                color: !settingsScreenController
                                                        .sleepReminderToggle
                                                        .value
                                                    ? AppColors
                                                        .textColorCycleInfoMore
                                                    : AppColors.blackColor)),
                                      ),
                                      CustomSwitch(
                                          initialValue: settingsScreenController
                                              .sleepReminderToggle.value,
                                          onChanged: (value) {
                                            if (value) {
                                              settingsScreenController
                                                  .sleepReminderToggle
                                                  .value = true;
                                              SleepReminderBottomS()
                                                  .setSleepReminderBottomSheet(
                                                      context);
                                            } else {
                                              settingsScreenController
                                                  .sleepReminderToggle
                                                  .value = false;
                                            }
                                          })
                                    ],
                                  ),
                                  Obx(() => settingsScreenController
                                          .sleepReminderToggle.value
                                      ? Padding(
                                          padding:
                                              const EdgeInsets.only(top: 8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Divider(
                                                  color: AppColors
                                                      .textColorCycleInfoMore
                                                      .withOpacity(0.1)),
                                              height10,
                                              Row(
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        right: 10.w),
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .maroonColor
                                                          .withOpacity(0.15),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          8.0.sp),
                                                      child: SvgPicture.asset(
                                                        ImagesUrl.sleepTimeIcon,
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => RichText(
                                                      text: TextSpan(
                                                        text: 'My sleep time\n',
                                                        style: w400_16Poppins(
                                                            color: AppColors
                                                                .textColorQus),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  "${waterLogManagement.durationStartHours.value}:${waterLogManagement.durationStartMinutes.value}  ",
                                                              style: w400_16Poppins(
                                                                  color: AppColors
                                                                      .textColorCycleInfoMore)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              height15,
                                              Row(
                                                children: [
                                                  Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .maroonColor
                                                          .withOpacity(0.15),
                                                      shape: BoxShape.circle,
                                                    ),
                                                    margin: EdgeInsets.only(
                                                        right: 10.w),
                                                    child: Padding(
                                                      padding: EdgeInsets.all(
                                                          8.0.sp),
                                                      child: SvgPicture.asset(
                                                        ImagesUrl
                                                            .notificationRed,
                                                      ),
                                                    ),
                                                  ),
                                                  Obx(
                                                    () => RichText(
                                                      text: TextSpan(
                                                        text:
                                                            'My wakeup time\n',
                                                        style: w400_16Poppins(
                                                            color: AppColors
                                                                .textColorQus),
                                                        children: <TextSpan>[
                                                          TextSpan(
                                                              text:
                                                                  "${waterLogManagement.durationEndHours.value}:${waterLogManagement.durationEndMinutes.value} ",
                                                              style: w400_16Poppins(
                                                                  color: AppColors
                                                                      .textColorCycleInfoMore)),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              height10,
                                            ],
                                          ),
                                        )
                                      : const SizedBox(
                                          height: 0,
                                        )),
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
                                    "Basal Body Temperature",
                                    style: w400_16Poppins(
                                        color: AppColors.blackColor
                                            .withOpacity(0.8)),
                                  ),
                                  height5,
                                  Obx(
                                    () => SizedBox(
                                      height: getProportionateScreenHeight(50),
                                      child: CustomTextFormField(
                                        controller:
                                            homeHealthLifestyleController
                                                .temperatureController.value,
                                        hintText: "Log your temperature",
                                      ),
                                    ),
                                  ),
                                  height10,
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
            padding: const EdgeInsets.all(12.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.05,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: AppColors.buttonColor),
              child: Center(
                child: Text(
                  "Apply",
                  style: w500_16Poppins(color: AppColors.whiteColor),
                ),
              ),
            )),
      ),
    );
  }
}
