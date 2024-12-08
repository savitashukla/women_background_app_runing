import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/dashboard_controller.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

import '../../../constants/app_colors.dart';
import '../../viewmodels/alarm_controller.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.only(top: 2.0.h, bottom: 2.0.h, right: 15.w, left: 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              dashboardController.currentIndex.value = 0;
            },
            child: Obx(
              () => dashboardController.currentIndex.value == 0
                  ? Container(
                      height: 32.h,
                      width: 78.w,
                      decoration: BoxDecoration(
                        color: AppColors.bottomButtonColor,
                        borderRadius: BorderRadius.circular(20.r),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImagesUrl.homePageRed,
                            color: AppColors.colorPrimary,
                            height: 20.h,
                            width: 20.w,
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                              color: AppColors.textColorPaint,
                              fontFamily: "Poppins",
                              fontSize: getFontSize(12),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          ImagesUrl.homeIcon,
                          height: 22.h,
                          fit: BoxFit.fill,
                          width: 20.w,
                        )
                      ],
                    ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              /* YourAlarmController con=Get.put(YourAlarmController());
              con.setAlarmHere();*/
              //HelperWidget().flutterCustomToast("Coming Soon");
              dashboardController.currentIndex.value = 1;
            },
            child: Container(
              padding: const EdgeInsets.only(right: 0),
              child: Obx(
                () => dashboardController.currentIndex.value == 1
                    ? Container(
                        height: 32.h,
                        width: 90.w,
                        decoration: BoxDecoration(
                          color: AppColors.bottomButtonColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImagesUrl.bottomIconCalendarRose,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Calendar",
                              style: TextStyle(
                                color: AppColors.textColorPaint,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                fontSize: getFontSize(12),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImagesUrl.bottomIconCalendar,
                            height: 24.h,
                            width: 21.w,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              // HelperWidget().flutterCustomToast("Coming Soon");
              dashboardController.currentIndex.value = 2;
            },
            child: Container(
              padding: const EdgeInsets.only(right: 0),
              child: Obx(
                () => dashboardController.currentIndex.value == 2
                    ? Container(
                        height: 32.h,
                        width: 88.w,
                        decoration: BoxDecoration(
                          color: AppColors.bottomButtonColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImagesUrl.vectorIconBottomColorRose,
                              height: 18.h,
                              width: 18.w,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "Analytics",
                              style: TextStyle(
                                color: AppColors.textColorPaint,
                                fontFamily: "Poppins",
                                fontSize: getFontSize(12),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImagesUrl.vectorIconBottom,
                            height: 21.h,
                            width: 21.w,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
             // HelperWidget().flutterCustomToast("Coming Soon");
              dashboardController.currentIndex.value = 3;
            },
            child: Container(
              padding: const EdgeInsets.only(right: 0),
              child: Obx(
                () => dashboardController.currentIndex.value == 3
                    ? Container(
                        height: 32.h,
                        width: 88.w,
                        padding: EdgeInsets.only(left: 6.w, right: 7.w),
                        decoration: BoxDecoration(
                          color: AppColors.bottomButtonColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImagesUrl.presentionChartColorsFullIconRose,
                              height: 23.h,
                              width: 21.w,
                            ),
                            SizedBox(
                              width: 4.w,
                            ),
                            Text(
                              "Insights",
                              style: TextStyle(
                                color: AppColors.textColorPaint,
                                fontFamily: "Poppins",
                                fontSize: getFontSize(12),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImagesUrl.presentionChartIcon,
                            height: 23.h,
                            width: 21.w,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
             // HelperWidget().flutterCustomToast("Coming Soon");
               dashboardController.currentIndex.value = 4;
            },
            child: Container(
              padding: const EdgeInsets.only(right: 0),
              child: Obx(
                () => dashboardController.currentIndex.value == 4 ||
                        dashboardController.currentIndex.value == 5
                    ? Container(
                        height: 32.h,
                        // width: 96.w,
                        padding: EdgeInsets.only(left: 6.w, right: 7.w),
                        decoration: BoxDecoration(
                          color: AppColors.bottomButtonColor,
                          borderRadius: BorderRadius.circular(20.r),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              ImagesUrl.peopleIconBottomRose,
                              height: 20.h,
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Text(
                              "Community",
                              style: TextStyle(
                                color: AppColors.textColorPaint,
                                fontFamily: "Poppins",
                                fontSize: getFontSize(12),
                              ),
                            ),
                          ],
                        ),
                      )
                    : Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            ImagesUrl.peopleIconBottom,
                            height: 24.h,
                            width: 21.w,
                            fit: BoxFit.fill,
                          )
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
