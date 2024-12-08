import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../viewmodels/calendar/calendar_controller.dart';
import '../../viewmodels/calendar/new_calander_controller.dart';

class YearMonthDayWidget extends StatefulWidget {
  final int currentYear;
  final int monthIndex;

  const YearMonthDayWidget({
    Key? key,
    required this.currentYear,
    required this.monthIndex,
  }) : super(key: key);

  @override
  State<YearMonthDayWidget> createState() => _YearMonthDayWidgetState();
}

class _YearMonthDayWidgetState extends State<YearMonthDayWidget> {
  int pregnancyTime = 0;
  Map<String, int> periodsTimeGoing = {};
  Map<String, int> pregnancyGoodDate = {};
  int dayNumber = 0;
  CalendarController controllerCalendar = Get.find();

  NewCalendarController controllerCalendarNew = Get.find();
  late int firstDayOfWeek;

  @override
  void initState() {
    super.initState();

    dayNumber = 0;
    DateTime monthDate = DateTime(widget.currentYear, widget.monthIndex, 1);
    firstDayOfWeek = monthDate.weekday;

    if (monthDate.weekday == 7) {
      dayNumber = 0;
      firstDayOfWeek = 0;
    }
    if (widget.currentYear == 2023) {
      if (widget.monthIndex == 12) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        periodsTimeGoing["1"] = 1;
        periodsTimeGoing["2"] = 2;
        periodsTimeGoing["3"] = 3;
        periodsTimeGoing["4"] = 4;
        periodsTimeGoing["5"] = 5;
        pregnancyTime = 19;
        pregnancyGoodDate["17"] = 17;
        pregnancyGoodDate["18"] = 18;
        pregnancyGoodDate["20"] = 20;
        pregnancyGoodDate["21"] = 21;
      } else if (widget.monthIndex == 1) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        pregnancyTime = 9;
        pregnancyGoodDate["24"] = 24;
        pregnancyGoodDate["25"] = 25;
        pregnancyGoodDate["26"] = 26;
        pregnancyGoodDate["27"] = 27;
        pregnancyGoodDate["28"] = 28;
      } else if (widget.monthIndex == 2) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        pregnancyTime = 6;
        pregnancyGoodDate["21"] = 21;
        pregnancyGoodDate["22"] = 22;
        pregnancyGoodDate["23"] = 23;
        pregnancyGoodDate["24"] = 24;
        pregnancyGoodDate["25"] = 25;
      } else if (widget.monthIndex == 3) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        pregnancyTime = 5;
        pregnancyGoodDate["20"] = 20;
        pregnancyGoodDate["21"] = 21;
        pregnancyGoodDate["22"] = 22;
        pregnancyGoodDate["23"] = 23;
        pregnancyGoodDate["24"] = 24;
      } else if (widget.monthIndex == 4) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        pregnancyTime = 2;
        pregnancyGoodDate["17"] = 17;
        pregnancyGoodDate["18"] = 18;
        pregnancyGoodDate["19"] = 19;
        pregnancyGoodDate["20"] = 20;
        pregnancyGoodDate["21"] = 21;
      } else if (widget.monthIndex == 5) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        pregnancyTime = 28;
        pregnancyGoodDate["15"] = 15;
        pregnancyGoodDate["16"] = 16;
        pregnancyGoodDate["17"] = 17;
        pregnancyGoodDate["18"] = 18;
        pregnancyGoodDate["19"] = 19;
      } else if (widget.monthIndex == 6) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        pregnancyTime = 25;
        pregnancyGoodDate["12"] = 12;
        pregnancyGoodDate["13"] = 13;
        pregnancyGoodDate["14"] = 14;
        pregnancyGoodDate["15"] = 15;
        pregnancyGoodDate["16"] = 16;
      } else if (widget.monthIndex == 8) {
        pregnancyGoodDate = {};
      } else if (widget.monthIndex == 7) {
        periodsTimeGoing["4"] = 4;
        periodsTimeGoing["5"] = 5;
        periodsTimeGoing["6"] = 6;
        periodsTimeGoing["7"] = 7;
        periodsTimeGoing["8"] = 8;
        periodsTimeGoing["9"] = 9;
        pregnancyTime = 15;
        pregnancyGoodDate["13"] = 13;
        pregnancyGoodDate["14"] = 14;
      //  pregnancyGoodDate["12"] = 12;
        pregnancyGoodDate["17"] = 17;
        pregnancyGoodDate["16"] = 16;
      } else if (widget.monthIndex == 9) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        periodsTimeGoing["1"] = 1;
        periodsTimeGoing["2"] = 2;
        periodsTimeGoing["3"] = 3;
        periodsTimeGoing["4"] = 4;
        periodsTimeGoing["5"] = 5;
        pregnancyTime = 29;
        pregnancyGoodDate["27"] = 27;
        pregnancyGoodDate["28"] = 28;
        pregnancyGoodDate["30"] = 30;
        pregnancyGoodDate["31"] = 31;
      }
      else if (widget.monthIndex == 10) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        periodsTimeGoing["1"] = 1;
        periodsTimeGoing["2"] = 2;
        periodsTimeGoing["3"] = 3;
        periodsTimeGoing["4"] = 4;
        periodsTimeGoing["5"] = 5;
        pregnancyTime = 29;
        pregnancyGoodDate["27"] = 27;
        pregnancyGoodDate["28"] = 28;
        pregnancyGoodDate["30"] = 30;
        pregnancyGoodDate["31"] = 31;
      }
      else if (widget.monthIndex == 11) {
        pregnancyGoodDate = {};
        periodsTimeGoing = {};

        periodsTimeGoing["1"] = 7;
        periodsTimeGoing["2"] = 8;
        periodsTimeGoing["3"] = 9;
        periodsTimeGoing["4"] = 10;
        periodsTimeGoing["5"] = 11;
        pregnancyTime = 29;
        pregnancyGoodDate["27"] = 27;
        pregnancyGoodDate["28"] = 28;
        pregnancyGoodDate["30"] = 30;
        pregnancyGoodDate["31"] = 31;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: GestureDetector(
        onTap: () {
          //  controllerCalendar.isMonthStatus.value = true;
          //  controllerCalendar.isYearStatus.value = false;
          controllerCalendarNew.isYearView.value = false;

          Future.delayed(const Duration(milliseconds: 30), () {
            controllerCalendarNew.selectedMonth.value = DateTime(
              widget.currentYear,
              widget.monthIndex
            );
            var initialIndex =
                (widget.currentYear - 1970) * 12 + widget.monthIndex;

            /*   controllerCalendar.yearScrollController.jumpTo(
                index: initialIndex,
                alignment:
                    0.5);*/

            //   Navigator.pushNamed(context, Routes.calenderMain);
          });
        },
        child: GridView.builder(
          shrinkWrap: false,
          cacheExtent: 20,
          padding: const EdgeInsets.all(0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemCount:
              DateTime(widget.currentYear, widget.monthIndex + 1, 0).day +
                  firstDayOfWeek,
          physics: const NeverScrollableScrollPhysics(),
          // Set the physics property
          itemBuilder: (context, index) {
            if (index < firstDayOfWeek) {
              dayNumber = 0;
            } else {
              if(index==0)
                {
                  dayNumber=1;
                }
              else
                {
                  dayNumber = dayNumber + 1;
                }

            }
            return index < firstDayOfWeek
                ? const SizedBox()
                : pregnancyGoodDate["$dayNumber"] == dayNumber
                    ? DottedBorder(
                padding: EdgeInsets.zero, // Set padding to zero

                        borderType: BorderType.Circle,
                        dashPattern: const [3, 2, 2, 2],
                        color: AppColors.pregnancyTimeGoodText,
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.pregnancyTimeGood,
                          ),

                          child: Center(
                            child: Text('$dayNumber',
                                style: const TextStyle(
                                    fontSize: 8.0,
                                    color: AppColors.pregnancyTimeGoodText,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ))
                    : Container(
                        decoration: periodsTimeGoing["$dayNumber"] == dayNumber
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColors.periodsTimeGoing,
                              )
                            : pregnancyTime == dayNumber
                                ? BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.ovulationTime,
                                  )
                                : null,
                        child: Center(
                          child: Text('$dayNumber',
                              style: TextStyle(
                                  fontSize: 8.0,
                                  color: periodsTimeGoing["$dayNumber"] ==
                                          dayNumber ||pregnancyTime == dayNumber
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w400)),
                        ),
                      );
          },
        ),
      ),
    );
  }
}
