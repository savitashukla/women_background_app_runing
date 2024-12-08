import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/calendar/year_month_show.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../viewmodels/calendar/calendar_controller.dart';

class AllYearCalendar extends StatelessWidget {
  CalendarController controllerCalendar = Get.put(CalendarController());

  AllYearCalendar({super.key});

  int currentMonth = DateTime.now().month;

  @override
  Widget build(BuildContext context) {
    return ScrollablePositionedList.builder(
      itemScrollController: controllerCalendar.allYearShowList,
      itemCount: controllerCalendar.allYearCount,
      physics: const BouncingScrollPhysics(), // Set the physics property

      initialScrollIndex: controllerCalendar.allYearListInitial,
      itemBuilder: (context, yearIndex) {
        int displayYear = 1970 + yearIndex;
        return Column(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10,top: 10),
              child: Text(
                '$displayYear',
                style: const TextStyle(
                  color: AppColors.textColorCycle,
                    fontSize: 14.0, fontWeight: FontWeight.w400),
              ),
            ),
            MonthListView(currentYear: displayYear, currentMonth: currentMonth),

            const SizedBox(height: 1.0), // Add spacing between years
          ],
        );
      },
    );
  }
}
