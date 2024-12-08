import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

import '../../../constants/app_colors.dart';
import '../../viewmodels/calendar/calendar_controller.dart';
import '../cycle_track/calendar/cycle_calendar.dart';

class EditCalendar extends StatelessWidget {
  EditCalendar({super.key});

  CalendarController controllerCalendar = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorGrayDarkBg,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40, left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                ),
                Container(
                  width: 140,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Theme.of(context).highlightColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(50.r),
                    ),
                  ),
                  child: Stack(
                    children: [
                      Obx(
                        () => AnimatedAlign(
                          alignment: Alignment(
                              controllerCalendar.isMonthStatus.value ? -1 : 1,
                              0),
                          duration: const Duration(milliseconds: 300),
                          child: Container(
                            width: 70,
                            // margin: EdgeInsets.all(4.sp),
                            height: 30.h,
                            decoration: BoxDecoration(
                              color: AppColors.colorPrimary,
                              borderRadius: BorderRadius.all(
                                Radius.circular(50.0.r),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (!controllerCalendar.isMonthStatus.value) {
                                Future.delayed(const Duration(milliseconds: 10),
                                    () {
                                  controllerCalendar.yearScrollController.jumpTo(
                                      index: controllerCalendar.initialIndex,
                                      alignment:
                                          0.6); //   Navigator.pushNamed(context, Routes.calenderMain);
                                });
                              }
                              controllerCalendar.isMonthStatus.value = true;
                              controllerCalendar.isYearStatus.value = false;
                            },
                            child: Align(
                              alignment: const Alignment(-1, 0),
                              child: Container(
                                width: 70,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Obx(
                                  () => Text(
                                    "Month",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      fontSize: 12.sp,
                                      fontFamily: "Poppins",
                                      color:
                                          controllerCalendar.isMonthStatus.value
                                              ? AppColors.whiteColor
                                              : AppColors.blackColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controllerCalendar.isMonthStatus.value = false;
                              controllerCalendar.isYearStatus.value = true;
                              Navigator.pop(context);
                            },
                            child: Align(
                              alignment: const Alignment(1, 0),
                              child: Container(
                                width: 70,
                                color: Colors.transparent,
                                alignment: Alignment.center,
                                child: Obx(
                                  () => Text(
                                    'Year',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: "Poppins",
                                      decoration: TextDecoration.none,
                                      color:
                                          controllerCalendar.isMonthStatus.value
                                              ? AppColors.blackColor
                                              : AppColors.whiteColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Obx(
                    () => controllerCalendar.isMonthStatus.value
                        ? GestureDetector(
                            onTap: () {
                              Future.delayed(const Duration(milliseconds: 30),
                                  () {
                                controllerCalendar.yearScrollController.jumpTo(
                                    index: controllerCalendar.initialIndex,
                                    alignment:
                                        0.6); //   Navigator.pushNamed(context, Routes.calenderMain);
                              });
                            },
                            child: Text(
                              "Today",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: AppColors.darkPinkColor,
                                fontFamily: "Poppins",
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          )
                        : const SizedBox(
                            height: 0,
                          ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 5, right: 5, top: 85),
            decoration: const BoxDecoration(
                color: AppColors.whiteColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10))),
            child: CycleTrackCalendar(),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  color: Colors.white,
                  width: MediaQuery.of(context).size.width,
                  height: 59,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 37,
                        width: 115,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: AppColors.colorPrimary, width: 2),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: HelperWidget().testMethod(
                              14.0,
                              FontWeight.w500,
                              AppColors.colorPrimary,
                              "Cancel"),
                        ),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      Container(
                        height: 37,
                        width: 115,
                        decoration: BoxDecoration(
                            color: AppColors.colorPrimary,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: HelperWidget().testMethod(
                              14.0, FontWeight.w500, Colors.white, "Save"),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
