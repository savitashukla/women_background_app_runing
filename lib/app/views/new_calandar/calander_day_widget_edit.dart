import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/constants/app_colors.dart';

import '../../viewmodels/calendar/new_calander_controller.dart';

class CalendarDayWidgetEdit extends StatelessWidget {
  CalendarDayWidgetEdit(
      {super.key,
      required this.date,
      required this.enabled,
      required this.selected,
      required this.onTap,
      required this.applyBorder,
      this.dotColor,
      this.height});

  final DateTime date;
  final bool enabled;
  final bool selected;
  final bool applyBorder;
  final double? height;
  final Color? dotColor;
  final VoidCallback onTap;

  NewCalendarController newController = Get.put(NewCalendarController());

  @override
  Widget build(BuildContext context) {
    final formattedDay = DateFormat("EEE\ndd").format(date);
    DateTime parsedDate = DateFormat("EEE\ndd").parse(formattedDay);
    DateTime currentDate = DateTime.now();

    final isToday = DateUtils.isSameDay(date, DateTime.now());
    return SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            enabled
                ? InkWell(
                    onTap: () {
                      if (newController.checkBoxValues[
                                  "${date.month}${date.year}${date.day}"] ==
                              null ||
                          newController.checkBoxValues[
                                  "${date.month}${date.year}${date.day}"] ==
                              false) {
                        newController.checkBoxValues[
                            "${date.month}${date.year}${date.day}"] = true;
                      } else {
                        newController.checkBoxValues[
                            "${date.month}${date.year}${date.day}"] = false;
                      }
                    },
                    child: Column(
                      children: [
                        Obx(
                          () => newController.checkBoxValues.isNotEmpty &&
                                  newController.checkBoxValues[
                                          "${date.month}${date.year}${date.day}"] !=
                                      null &&
                                  newController.checkBoxValues[
                                          "${date.month}${date.year}${date.day}"] ==
                                      true
                              ? Text(
                                  '${date.day}',
                                  style:  TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.colorPrimary,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              : Text(
                                  '${date.day}',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: Theme.of(context).hintColor,
                                    fontFamily: "Poppins",
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                        ),
                        SizedBox(
                            height: 10.0.h,
                            width: 10.0.w,
                            child: Obx(
                              () => newController.checkBoxValues.isNotEmpty &&
                                      newController.checkBoxValues[
                                              "${date.month}${date.year}${date.day}"] !=
                                          null &&
                                      newController.checkBoxValues[
                                              "${date.month}${date.year}${date.day}"] ==
                                          true
                                  ? Transform.scale(
                                      scale: .6,
                                      child: Checkbox(
                                        activeColor: newController
                                                        .checkBoxValues[
                                                    "${date.month}${date.year}${date.day}"] ??
                                                false
                                            ? AppColors
                                                .colorPrimary // Set the color when checked
                                            : Colors.transparent,
                                        shape: const CircleBorder(),
                                        checkColor: AppColors.whiteColor,
                                        value: newController.checkBoxValues[
                                            "${date.month}${date.year}${date.day}"],
                                        onChanged: (bool? newValue) {
                                          newController.checkBoxValues[
                                                  "${date.month}${date.year}${date.day}"] =
                                              newValue;
                                        },
                                      ),
                                    )
                                  : Transform.scale(
                                      scale: .6,
                                      child: Checkbox(
                                        shape: const CircleBorder(),
                                        value: false,
                                        checkColor:
                                            AppColors.textColorCycleCalDis,
                                        onChanged: (bool? newValue) {
                                          newController.checkBoxValues[
                                                  "${date.month}${date.year}${date.day}"] =
                                              true;
                                        },
                                      ),
                                    ),
                            )),
                      ],
                    ),
                  )
                : Column(
                    children: [
                      Text(
                        '${date.day}',
                        style: TextStyle(
                          fontSize: 12.sp,
                            color:
                                Theme.of(context).hintColor.withOpacity(0.4), fontFamily: "Poppins",
                          fontWeight: FontWeight.w300,),
                      ),
                      SizedBox(
                        height: 10.h,
                        width: 10.w,
                        child: Transform.scale(
                          scale: .6,
                          child: Checkbox(
                            shape: const CircleBorder(),
                            value: false,
                            activeColor: Colors.transparent,
                            checkColor: Colors.transparent,
                            onChanged: (bool? newValue) {},
                            side: BorderSide(
                              color: Theme.of(context).hintColor.withOpacity(
                                  0.4), // Set your desired border color
                              width: 2.0, // Set the border width
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
          ],
        ));
  }
}
