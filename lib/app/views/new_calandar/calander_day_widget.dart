import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/constants/app_colors.dart';

import '../../viewmodels/calendar/new_calander_controller.dart';

class CalanderDayWidget extends StatelessWidget {
   CalanderDayWidget({super.key,
  required this.date,
      required this.enabled,
      required this.selected,
      required this.onTap,
      required this.applyBorder,
      this.dotColor,
      this.height,
  });

    final DateTime date;
  final bool enabled;
  final bool selected;
  final bool applyBorder;
  final double? height;
  final Color? dotColor;
  final VoidCallback onTap;
  NewCalendarController newController = Get.find();



  @override
  Widget build(BuildContext context) {
    final formattedDay = DateFormat("EEE\ndd").format(date);
    DateTime parsedDate = DateFormat("EEE\ndd").parse(formattedDay);
    DateTime currentDate = DateTime.now();
    print("parsedDate ${date.year}${date.month}${date.day}");
    final isToday = DateUtils.isSameDay(date, DateTime.now());
    return Column(
      children: [
        newController.pregnancyTimeGoing[
                    "${date.year}${date.month}${date.day}"] !=
                null
            ? DottedBorder(
                padding: EdgeInsets.zero,
                borderType: BorderType.Circle,
                dashPattern: const [3, 2, 2, 2],
                color: AppColors.avgCycleDayProgressBarFull3,
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.pregnancyTimeGood.withOpacity(0.2),
                  ),
                  child: Center(
                      child: getColumList(isToday: false, context: context)),
                ))
            :  isToday?Container(
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppColors.circlePaint,
                    AppColors.circlePaint2
                  ],
                )
            ),
            height: 32.h,
            width: 32.w,
            child: Center(
                child: getColumList(isToday: isToday, context: context))):Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isToday
                      ? AppColors.greenColorLight
                      : newController.pregnancyTimeGood[
                                  "${date.year}${date.month}${date.day}"] ==
                              date.day
                          ? AppColors.avgCycleDayProgressBarFull3
                          : newController.periodsTimeGoing[
                                      "${date.year}${date.month}${date.day}"] !=
                                  null
                              ? AppColors.periodsTimeGoing
                              : selected
                                  ? Colors.blue.shade300
                                  : Colors.transparent,
                ),
                height: 32.h,
                width: 32.w,
                child: Center(
                    child: getColumList(isToday: isToday, context: context)))
      ],
    );
  }

  Widget  getColumList({isToday,required context})
  {
   return Column(
     crossAxisAlignment: CrossAxisAlignment.center,
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
       enabled
           ? InkWell(
         onTap: onTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        '${date.day}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          color: isToday
                              ? AppColors.whiteColor
                              : newController.pregnancyTimeGood[
                                          "${date.year}${date.month}${date.day}"] ==
                                      date.day
                                  ? AppColors.whiteColor
                                  : newController.periodsTimeGoing[
                                              "${date.year}${date.month}${date.day}"] !=
                                          null
                                      ? AppColors.whiteColor
                                      : selected
                                          ? Colors.white
                                          : newController.pregnancyTimeGoing[
                                                      "${date.year}${date.month}${date.day}"] !=
                                                  null
                                              ? AppColors
                                                  .avgCycleDayProgressBarFull3
                                              : AppColors.blackColor,
                        ),
               ),
             ),
           ],
         ),
       )
           : Center(
         child: Text(
           '${date.day}',
           style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).hintColor.withOpacity(0.4)),
         ),
       ),


     ],
   );
  }
}