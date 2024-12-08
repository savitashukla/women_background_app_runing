import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/models/calander_config.dart';
import 'package:o_woman/app/viewmodels/calendar/new_calander_controller.dart';
import 'package:o_woman/app/viewmodels/notes/notes_controller.dart';
import 'package:o_woman/app/views/calander_date_info.dart';
import 'package:o_woman/app/views/new_calandar/calander_day_widget_edit.dart';
import 'package:o_woman/app/views/new_calandar/calander_view_component_edit.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

class MonthViewWidget extends StatelessWidget {
  const MonthViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewCalendarController controller = Get.put(NewCalendarController());

    DateTime now = DateTime.now();
    DateTime minDate = DateTime(now.year - 5, 1, 1);
    DateTime maxDate = DateTime(now.year + 5, 1, 1);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                controller.changeMonth(-1);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 5.w),
                child: Container(
                  height: 25.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.appBarColor1,
                  ),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: AppColors.colorPrimaryIcon,
                    size: 16.r,
                  ),
                ),
              ),
            ),
            Obx(
              () => Text(
                controller.formatMonthYear(controller.selectedMonth.value),
                style: TextStyle(color: Theme.of(context).hintColor),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5.w),
              child: GestureDetector(
                onTap: () {
                  controller.changeMonth(1);
                },
                child: Container(
                  height: 25.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    color: AppColors.appBarColor1,
                  ),
                  child: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: AppColors.colorPrimaryIcon,
                    size: 16.r,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.only(left: 20.w, right: 20.w, top: 10.h),
            padding: EdgeInsets.only(
                right: 8.0.w, left: 8.0.w, bottom: 0.0.h, top: 5.0.h),
            decoration: BoxDecoration(
              color: AppColors.homeBgColor,
              //,
              borderRadius: BorderRadius.circular(6.r),
            ),
            child: Column(
              children: [
                CalendarViewEdit(
                    month: controller.selectedMonth.value,
                    config: CalendarConfig(maxDate: maxDate, minDate: minDate),
                    builder: (CalendarDateInfo e) {
                      return CalendarDayWidgetEdit(
                        date: e.date,
                        enabled: e.enabled &&
                            e.date.month ==
                                controller.selectedMonth.value.month &&
                            e.date.year == controller.selectedMonth.value.year,
                        selected: e.enabled &&
                            controller.selectedDay.value.day == e.date.day &&
                            e.enabled &&
                            controller.selectedDay.value.month == e.date.month,
                        onTap: () {
                          controller.selectedDay.value = e.date;
                        },
                        applyBorder: e.applyBorder,
                      );
                    }),
              ],
            )),
      ],
    );
  }
}
