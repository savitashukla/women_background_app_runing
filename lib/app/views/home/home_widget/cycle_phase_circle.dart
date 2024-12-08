import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import '../../../../constants/app_colors.dart';
import '../../../../constants/font_size.dart';
import '../../../routes/routes.dart';
import '../../../services/local_notification_service.dart';
import '../../../viewmodels/home_controller/home_page_controller.dart';
import '../circle_paint/CirclePaint.dart';
import '../move_button_custom_paint.dart';

class CyclePhaseCircle {
  final _len = 10.0;

  Widget cyclePhaseCircleMethod(
      BuildContext context, HomePageController homePageController) {
    return Center(
      child: SizedBox(
        height: getProportionateScreenHeight(250),
        width: getProportionateScreenWidth(250),
        child: Stack(
          children: [
            Container(
              height: getProportionateScreenHeight(250),
              width: getProportionateScreenWidth(250),
              margin:  EdgeInsets.all(3.sp),
              child: Obx(
                () => CustomPaint(
                  painter: CirclePainter(
                      startAngle: _len,
                      cyclePeriods: homePageController.cyclePeriods.value / 10,
                      cycleFollicular:
                          homePageController.cycleFollicular.value / 10,
                      cycleOvulation:
                          homePageController.cycleOvulation.value / 10,
                      cycleLuteal: homePageController.cycleLuteal.value / 10),
                ),
              ),
            ),
            Center(
              child: GestureDetector(child: Obx(() {
                return CustomPaint(
                  painter: MoveButtonCustomPaint(
                    pointerOffset: homePageController.offset.value,
                   //   pointerOffset: Offset.zero,
                      dateText: homePageController.dateClick.value),
                  child: Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(
                        () => Text(homePageController.testData.value,
                            textAlign: TextAlign.center,
                            style:  TextStyle(
                              fontSize: getFontSize(12.0),
                              color: AppColors.colorPrimaryTestDarkMore,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins',
                            )),
                      ),
                      height10,
                      GestureDetector(
                        onTap: () {
                          if (homePageController.circleCenterTextData.value
                                  .compareTo("Edit Period Dates") ==
                              0) {
                            Navigator.pushNamed(context, Routes.calenderMain);
                          }
                          // Fluttertoast.showToast(msg: "msg do there");
                        },
                        child: GestureDetector(
                          onTap: () {
                            // homePageController.getTimeWorkManagerShowTask(
                            //     4, 13);
                            // LocalNotificationService.scheduleReminder(7,7,15);
                          },
                          child: Container(
                            height: 25.h,
                            padding:  EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 5.h),
                            decoration:  BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0.r)),
                              color: Colors.deepOrangeAccent,
                              gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.circlePaint2,
                                    AppColors.circlePaint,
                                  ]),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:  EdgeInsets.symmetric(
                                      horizontal: 3.w),
                                  child: Obx(
                                    () => Text(
                                        homePageController
                                            .circleCenterTextData.value,
                                        textAlign: TextAlign.center,
                                        style:  TextStyle(
                                          fontSize: getFontSize(12.0),
                                          color: AppColors.whiteColor,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Poppins',
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
                );
              })),
            ),
          ],
        ),
      ),
    );
  }
}
