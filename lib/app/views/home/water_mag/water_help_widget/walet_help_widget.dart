
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custome_button.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/images_url.dart';
import '../../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../../viewmodels/home_controller/water_log_management.dart';

class WaterHelpWidget {
  var index11 = 0;

  void waterReminder(
      BuildContext context, WaterLogManagementController waterLogManagement) {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10.w,
                    right: 10.w),
                decoration: BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.colorPrimary,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.w),
                        topRight: Radius.circular(20.w))),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                      SizedBox(

                        height: 20.h,
                      ),
                      Container(
                        height: 6.h,
                        width: 46.w,
                        margin: const EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.r)),
                            color: AppColors.colorPrimaryTest),
                      ),

                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        height: 57.h,

                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),


                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.disableColor.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                16.0,
                                FontWeight.w500,
                                AppColors.textColorCycleInfo,
                                "Start time "),
                            GestureDetector(
                              onTap: () {
                                setTimeWaterBottomSheet(
                                    context, waterLogManagement, "AM");
                              },
                              child: Container(
                                  height: 40.h,
                                  width: 90.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                        color: AppColors.containerBorderC,
                                        width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          "${waterLogManagement.durationStartHours.value} : ${waterLogManagement.durationStartMinutes.value}",
                                          style: TextStyle(
                                              color:
                                                  AppColors.textColorCycleInfo,
                                              fontSize: 13.sp),
                                        ),
                                      ),
                                      Container(
                                        width: 13,
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                          ImagesUrl.downArrow,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 57.h,

                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.disableColor.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                16.0,
                                FontWeight.w500,
                                AppColors.textColorCycleInfo,
                                "End Time"),
                            GestureDetector(
                              onTap: () {
                                waterLogManagement.durationEndHours.value =
                                    waterLogManagement.durationStartHours.value;
                                waterLogManagement.durationEndMinutes.value =
                                    waterLogManagement
                                        .durationStartMinutes.value;
                                waterLogManagement.durationEndCountH.value =
                                    24 -
                                        waterLogManagement
                                            .durationStartHours.value;
                                waterLogManagement.durationEndCountM.value =
                                    60 -
                                        waterLogManagement
                                            .durationStartMinutes.value;
                                setTimeWaterBottomSheet(
                                    context, waterLogManagement, "PM");
                              },
                              child: Container(
                                  height: 40.h,
                                  width: 90.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        color: AppColors.containerBorderC,
                                        width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          "${waterLogManagement.durationEndHours.value} : ${waterLogManagement.durationEndMinutes.value}",
                                          style: const TextStyle(
                                              color:
                                                  AppColors.textColorCycleInfo,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(right: 0),
                                        width: 13.w,
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                            ImagesUrl.downArrow,
                                            color: AppColors.mainColor),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        height: 57.h,

                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),


                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.disableColor.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                16.0,
                                FontWeight.w500,
                                AppColors.textColorCycleInfo,
                                "Interval"),
                            Container(
                              height: 40.h,
                              width: 90.w,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: AppColors.containerBorderC,
                                      width: 1)),
                              child: Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    items: waterLogManagement
                                        .intervalTimeWater.value
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: AppColors
                                                      .textColorCycleInfo,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: waterLogManagement
                                        .selectedIntervalTimeWater.value,
                                    onChanged: (String? value) {
                                      waterLogManagement
                                          .selectedIntervalTimeWater
                                          .value = value!;
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 50,
                                      width: 160,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        //color: Colors.white,
                                      ),
                                    ),
                                    iconStyleData: IconStyleData(
                                      icon: SvgPicture.asset(
                                        ImagesUrl.downArrow,
                                        color: AppColors.mainColor,
                                      ),
                                      iconSize: 13,
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                3),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: CustomButton(
                                  buttonText: "Cancel",
                                  buttonColor: AppColors.whiteColor,
                                  borderColor: AppColors.mainColor,
                                  textColor: AppColors.mainColor,
                                )),
                          ),

                          SizedBox(
                            width: 20.h,
                          ),
                          GestureDetector(
                              onTap: () async {
                                waterLogManagement.saveOnTapCondition();
                              },
                              child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.3,
                                  child: CustomButton(
                                    buttonText: "Save",
                                  )))
                        ],
                      ),
                      height15,
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void setTimeWaterBottomSheet(BuildContext context,
      var waterLogManagement, String timeAP) {
    ItemScrollController itemScrollControllerDate = ItemScrollController();
    FixedExtentScrollController scrollController;

    if (timeAP == "AM") {
      scrollController = FixedExtentScrollController(
          initialItem: waterLogManagement.durationStartHours.value);
    } else {
      scrollController = FixedExtentScrollController(
          initialItem: waterLogManagement.durationEndHours.value);
      // waterLogManagement.durationEnd.value = newDuration;
    }
    //  Duration duration = const Duration(hours: 1, minutes: 23);

    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 0,
                    right: 0),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.colorPrimary,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: HelperWidget().testMethodStartAlign(16.0,
                          FontWeight.w500, AppColors.blackColor, "Set Time"),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      height: 2.h,
                      color: AppColors.setTimeDivider,
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Stack(
                            children: [
                              SizedBox(
                                height: 200,
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 00),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 30,
                                        width: 150,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: AppColors.boxShadow),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: 70.w,
                                height: 200.h,
                                margin: EdgeInsets.only(left: 30.w),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      child: CupertinoPicker(
                                        scrollController: scrollController,
                                        itemExtent: 32.0,
                                        selectionOverlay:
                                            const CupertinoPickerDefaultSelectionOverlay(
                                          background: Colors.transparent,
                                        ),
                                        onSelectedItemChanged: (index) {
                                          if (timeAP == "AM") {
                                            waterLogManagement
                                                .durationStartHours
                                                .value = index;
                                          } else {
                                            waterLogManagement
                                                    .durationEndHours.value =
                                                index +
                                                    waterLogManagement
                                                        .durationStartHours
                                                        .value;
                                          }
                                        },
                                        children: List.generate(
                                            timeAP == "PM"
                                                ? waterLogManagement
                                                    .durationEndCountH.value
                                                : 24, (index) {
                                          if (timeAP == "PM") {
                                            if (index == 0) {
                                              index11 = waterLogManagement
                                                  .durationEndHours.value;
                                            } else {
                                              index11 = index11 + 1;
                                            }
                                          }

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                right: 5.0),
                                            child: Center(
                                              child: timeAP == "PM"
                                                  ? HelperWidget().testMethod(
                                                      18.0,
                                                      FontWeight.w600,
                                                      AppColors
                                                          .colorPrimaryTestDarkMore,
                                                      "$index11")
                                                  : HelperWidget().testMethod(
                                                      18.0,
                                                      FontWeight.w600,
                                                      AppColors
                                                          .colorPrimaryTestDarkMore,
                                                      index == 0
                                                          ? "00"
                                                          : index < 10
                                                              ? "0$index"
                                                              : "$index"),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                    Expanded(
                                      child: CupertinoPicker(
                                        itemExtent: 32.0,
                                        selectionOverlay:
                                            const CupertinoPickerDefaultSelectionOverlay(
                                          background: Colors.transparent,
                                        ),
                                        onSelectedItemChanged: (index) {
                                          if (timeAP == "AM") {
                                            waterLogManagement
                                                .durationStartMinutes
                                                .value = index;
                                          } else {
                                            waterLogManagement
                                                    .durationEndMinutes.value =
                                                index +
                                                    waterLogManagement
                                                        .durationStartMinutes
                                                        .value;
                                            // waterLogManagement.durationEnd.value = newDuration;
                                          }
                                        },
                                        children: List.generate(
                                            timeAP == "PM"
                                                ? waterLogManagement
                                                    .durationEndCountM.value
                                                : 60, (index) {
                                          if (timeAP == "PM") {
                                            if (index == 0) {
                                              index11 = waterLogManagement
                                                  .durationEndMinutes.value;
                                            } else {
                                              index11 = index11 + 1;
                                            }
                                          }

                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                left: 5.0),
                                            child: Center(
                                              child: timeAP == "PM"
                                                  ? HelperWidget().testMethod(
                                                      18.0,
                                                      FontWeight.w600,
                                                      AppColors
                                                          .colorPrimaryTestDarkMore,
                                                      "$index11")
                                                  : HelperWidget().testMethod(
                                                      18.0,
                                                      FontWeight.w600,
                                                      AppColors
                                                          .colorPrimaryTestDarkMore,
                                                      index == 0
                                                          ? "00"
                                                          : index < 10
                                                              ? "0$index"
                                                              : "$index"),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    /* SizedBox(
                      height: 200.h, // Adjust the height as needed
                      child: CupertinoTimerPicker(
                        mode: CupertinoTimerPickerMode.hm,
                        initialTimerDuration:
                            waterLogManagement.durationStart.value,

                        onTimerDurationChanged: (Duration newDuration) {
                          print(
                              "newDuration.toString() ${newDuration.toString()}");
                          if (timeAP == "AM") {
                            waterLogManagement.durationStart.value =
                                newDuration;
                          } else {
                            waterLogManagement.durationEnd.value = newDuration;
                          }
                          // setState(() => duration = newDuration);
                        },

                      ),
                    ),*/
                    SizedBox(
                      height: 25.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);

                              // waterLogManagement.indexVStartTime.value = 0;
                            },
                            child: HelperWidget().testMethodStartAlign(16.0,
                                FontWeight.w500, AppColors.mainColor, "Cancel"),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: HelperWidget().testMethodStartAlign(16.0,
                                FontWeight.w500, AppColors.mainColor, "Save"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
