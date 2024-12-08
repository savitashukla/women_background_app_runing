import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../constants/app_colors.dart';
import '../../../viewmodels/home_controller/home_page_controller.dart';

class ListOneMonthDate
{
  //late String dayName;
  //late String date;

  Widget oneMonthDateList(HomePageController homePageController) {
    Future.delayed(const Duration(milliseconds: 10), () {

      homePageController.selectedIndexMonth.value=10000000;
      homePageController.itemScrollControllerDate.jumpTo(
          index: DateTime.now().day - 1,
          alignment:
              0.6); //   Navigator.pushNamed(context, Routes.calenderMain);
    });

    return SizedBox(
      height: 70.h,
      child: ScrollablePositionedList.builder(
        itemScrollController: homePageController.itemScrollControllerDate,
        scrollOffsetController: homePageController.scrollOffsetController,
        itemPositionsListener: homePageController.itemPositionsListener,
        scrollOffsetListener: homePageController.scrollOffsetListener,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        padding: const EdgeInsets.all(0.0),
        itemCount:
        DateTime(DateTime.now().year, DateTime.now().month + 1, 0).day,
        itemBuilder: (context, index) {
          DateTime currentDate =
              DateTime(DateTime.now().year, DateTime.now().month, index + 1);
          //  dayName = DateFormat('E').format(currentDate); // Full day name (e.g., Monday)
          // date = DateFormat('d').format(currentDate);

          return SizedBox(
            width: (MediaQuery.of(context).size.width - 25) / 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    homePageController.selectedIndexMonth.value = index;
                    DateTime currentDate = DateTime(
                        DateTime.now().year, DateTime.now().month, index + 1);
                    homePageController.dateClick.value =
                        DateFormat('d').format(currentDate);
                    homePageController.getOffsetAccording(
                        homePageController.dateClick.value);
                  },
                  child: Obx(
                      ()=> homePageController.selectedIndexMonth.value ==
                          index
                          ? Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                AppColors.circlePaint,
                                AppColors.circlePaint2
                              ],
                            )),
                        height: 36.h,
                        width: 36.w,
                        padding: const EdgeInsets.all(0.0),
                        child: Center(
                          child: Text(
                            homePageController.getDateValues(index),
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: getFontSize(14),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ):currentDate.day == DateTime.now().day
                        ? Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    AppColors.circlePaint,
                                    AppColors.circlePaint2
                                  ],
                                )),
                            height: 36.h,
                            width: 36.w,
                            padding: const EdgeInsets.all(0.0),
                            child: Center(
                              child: Text(
                                homePageController.getDateValues(index),
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: getFontSize(14),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        : homePageController.ovulationTime[homePageController
                                        .getDateValues(index)] ==
                                    homePageController.getDateValues(index) ||
                                homePageController.periodTimeGoing[
                                        homePageController
                                            .getDateValues(index)] ==
                                    homePageController.getDateValues(index)
                            ? DottedBorder(
                                padding: EdgeInsets.zero,
                                borderType: BorderType.Circle,
                                dashPattern: const [3, 2, 2, 2],
                                color: homePageController.ovulationTime[
                                            homePageController
                                                .getDateValues(index)] ==
                                        homePageController.getDateValues(index)
                                    ? AppColors.ovulationTime
                                    : homePageController.periodTimeGoing[
                                                homePageController
                                                    .getDateValues(index)] ==
                                            homePageController
                                                .getDateValues(index)
                                        ? AppColors.periodsTimeGoing
                                        : AppColors.whiteColor,
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: homePageController.ovulationTime[
                                                homePageController
                                                    .getDateValues(index)] ==
                                            homePageController
                                                .getDateValues(index)
                                        ? AppColors.ovulationTime
                                            .withOpacity(0.5)
                                        : homePageController.periodTimeGoing[
                                                    homePageController
                                                        .getDateValues(
                                                            index)] ==
                                                homePageController
                                                    .getDateValues(index)
                                            ? AppColors.periodsTimeGoing
                                                .withOpacity(0.5)
                                            : AppColors.whiteColor,
                                  ),
                                  height: 36.h,
                                  width: 36.w,
                                  padding: const EdgeInsets.all(0.0),
                                  child: Center(
                                    child: Text(
                                      homePageController.getDateValues(index),
                                      style: TextStyle(
                                        color: AppColors.textColorNum,
                                        fontSize: getFontSize(14),
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : homePageController.selectedIndexMonth.value ==
                                    index
                                ? Container(
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            AppColors.circlePaint,
                                            AppColors.circlePaint2
                                          ],
                                        )),
                                    height: 36.h,
                                    width: 36.w,
                                    padding: const EdgeInsets.all(0.0),
                                    child: Center(
                                      child: Text(
                                        homePageController.getDateValues(index),
                                        style: TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: getFontSize(14),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentDate.day ==
                                              DateTime.now().day
                                          ? AppColors.greenColorLight
                                          : homePageController.luteal[homePageController.getDateValues(index)] ==
                                                  homePageController
                                                      .getDateValues(index)
                                              ? AppColors.lutealColor
                                                  .withOpacity(0.7)
                                              : homePageController.follicular[homePageController.getDateValues(index)] ==
                                                      homePageController
                                                          .getDateValues(index)
                                                  ? AppColors.follicularColor
                                                      .withOpacity(0.8)
                                                  : homePageController
                                                              .ovulationTimeMore
                                                              .value ==
                                                          homePageController.getDateValues(
                                                              index)
                                                      ? AppColors.ovulationTime
                                                          .withOpacity(0.5)
                                                      : homePageController
                                                                  .oneDayPeriodMore
                                                                  .value ==
                                                              homePageController.getDateValues(index)
                                                          ? AppColors.colorPrimary.withOpacity(0.5)
                                                          : "${DateTime.now().day}" == homePageController.getDateValues(index)
                                                              ? AppColors.textColorLight2
                                                              : AppColors.whiteColor,
                      ),
                      height: 36.h,
                      width: 36.w,
                      padding: const EdgeInsets.all(0.0),
                      child: Center(
                        child: Text(
                                        homePageController.getDateValues(index),
                                        style: TextStyle(
                                          color: AppColors.textColorNum,
                                          fontSize: getFontSize(14),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 15.0.w),
                  child: Center(
                    child: Text(
                      homePageController.getDayNameValues(index),
                      style: TextStyle(
                        color: AppColors.textColorQus,
                        fontSize: getFontSize(10),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }


}