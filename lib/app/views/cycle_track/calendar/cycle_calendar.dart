import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../../constants/app_colors.dart';
import 'cycler_calendar_day_show.dart';

class CycleTrackCalendar extends StatelessWidget {
  CycleTrackCalendar({super.key});

  late ItemScrollController cycleTrackScrollController = ItemScrollController();
  var initialIndexCycleTrack = (DateTime.now().year - DateTime.now().year) * 12 + 12 + 1;
  //initialIndexCycleTrack = (currentYear - lastYear) * 12 + currentMonth - lastYearMonth;
  DateTime currentDate = DateTime.now();
  int currentYear = DateTime.now().year;
  int currentMonth = DateTime.now().month;

  int lastYear = DateTime.now().year - 1;
  int lastYearMonth =  DateTime.now().month;

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(milliseconds: 30),
            () {
          cycleTrackScrollController.jumpTo(
              index: 12,
              alignment:
              0.0); //   Navigator.pushNamed(context, Routes.calenderMain);
        });
    return Scaffold(
      backgroundColor: AppColors.colorGrayDarkBg,
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.only(top: 12),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            color: Colors.white),
        child: ScrollablePositionedList.builder(
          itemScrollController: cycleTrackScrollController,
          itemCount: 13,
          shrinkWrap: true,
          itemBuilder: (context, yearIndex) {
            int displayYear = lastYear + (lastYearMonth + yearIndex - 1) ~/ 12;
            int displayMonth = (lastYearMonth + yearIndex - 1) % 12 + 1;


            /*  int displayMonth;
            int displayYear;
            if (yearIndex == 0) {
              displayYear = DateTime.now().year - 1;
              displayMonth = 12; // December of previous year
            } else {
              displayYear = DateTime.now().year + (yearIndex - 1) ~/ 12;
              displayMonth = (yearIndex - 1) % 12 + 1;
            }*/

            return CycleTrackMonthWidget(
              currentYear: displayYear,
              monthIndex: displayMonth,
            );
          },
        ),
      ),
    );
  }
}
