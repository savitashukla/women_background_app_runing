import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/viewmodels/calendar/calendar_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/bottom_sheet_call.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';
import 'all_year_show.dart';

class CalenderMain extends StatefulWidget {
  const CalenderMain({super.key});

  @override
  State<CalenderMain> createState() => _CalenderMainState();
}

class _CalenderMainState extends State<CalenderMain> {
  CalendarController controllerCalendar = Get.put(CalendarController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    DateTime currentDate = DateTime.now();
    int currentYear = currentDate.year;
    int futureMonth = 12; // Adjust the number of future years you want to show

    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.colorGrayDarkBg,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => controllerCalendar.isYearStatus.value
                        ? Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: SvgPicture.asset(
                              ImagesUrl.charmCross,
                            ),
                        )
                        : const Text("       "),
                  ),
                  Container(
                    width: 140,
                    height: 30,
                    decoration: BoxDecoration(
                      color: AppColors.colorPrimaryLight,
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
                                  Future.delayed(
                                      const Duration(milliseconds: 10), () {
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
                                        color: controllerCalendar
                                                .isMonthStatus.value
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
                                        color: controllerCalendar
                                                .isMonthStatus.value
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
          ),
          body: Stack(
            children: [
              Obx(
                () => controllerCalendar.isMonthStatus.value
                    ? Container(
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        decoration: const BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10))),
                        child: ScrollablePositionedList.builder(
                          itemScrollController:
                              controllerCalendar.yearScrollController,
                          itemCount:
                              (currentYear - 1970 + 1) * 12 + futureMonth,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          initialScrollIndex: controllerCalendar.initialIndex,
                          itemBuilder: (context, yearIndex) {
                            int displayYear = 1970 + yearIndex ~/ 12;
                            int displayMonth = yearIndex % 12 + 1;
                            return MonthWidget(
                              currentYear: displayYear,
                              monthIndex: displayMonth,
                            );
                          },
                        ),
                      )
                    : AllYearCalendar(),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 59,
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.colorGrayDarkBg,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.editCalendarMain);
                      },
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.colorPrimary),
                          height: 37,
                          width: 191,
                          child: Center(
                            child: HelperWidget().testMethodStartAlign(
                                14.0,
                                FontWeight.w500,
                                Colors.white,
                                "Edit your period"),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),

        ),
      ],
    );
  }

  getDelay() {
    Future.delayed(const Duration(milliseconds: 300), () {});
  }
}

class MonthWidget extends StatefulWidget {
  final int currentYear;
  final int monthIndex;

  const MonthWidget({
    Key? key,
    required this.currentYear,
    required this.monthIndex,
  }) : super(key: key);

  @override
  State<MonthWidget> createState() => _MonthWidgetState();
}

class _MonthWidgetState extends State<MonthWidget> {
  var pregnancyTime = 0;
  var periodsTimeGoing = {};
  var pregnancyGoodDate = {};
  int currentDay = 0;

  late DateTime monthDate;
  late int firstDayOfWeek;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    monthDate = DateTime(widget.currentYear, widget.monthIndex, 1);

    if (monthDate.weekday == 7) {
      firstDayOfWeek = 0;
    } else {
      firstDayOfWeek = monthDate.weekday;
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
      } else if (widget.monthIndex == 10) {
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
      } else if (widget.monthIndex == 11) {
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
    int dayNumber = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            '${DateFormat.MMMM().format(DateTime(widget.currentYear, widget.monthIndex, 1))}  ${monthDate.year}',
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textColorCycle,
              fontFamily: "Poppins",
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),

        Padding(
          padding:
              const EdgeInsets.only(left: 20, right: 20, top: 7, bottom: 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var day in ['S', 'M', 'T', 'W', 'T', 'F', 'S'])
                Text(
                  day,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: AppColors.textColorWeek,
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                  ),
                ),
            ],
          ),
        ),
        // Calendar Grid
        GridView.builder(
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 7,
            crossAxisSpacing: 1.0,
            mainAxisSpacing: 1.0,
          ),
          itemCount:
              DateTime(widget.currentYear, widget.monthIndex + 1, 0).day +
                  firstDayOfWeek,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            if (index < firstDayOfWeek) {
              dayNumber = 0;
            } else {
              dayNumber = dayNumber + 1;
            }
            return index < firstDayOfWeek
                ? Container()
                : pregnancyGoodDate["$dayNumber"] == dayNumber
                    ? GestureDetector(
              onTap: ()
              {
                BottomSheetCall().calendarBottomSheet(context);
              },
                      child: Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: DottedBorder(
                              padding: EdgeInsets.zero,
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
                              )),
                        ),
                    )
                    : GestureDetector(
              onTap: ()
              {
                BottomSheetCall().calendarBottomSheet(context);

              },
                      child: Container(
                          margin: const EdgeInsets.all(4.0),
                          decoration: periodsTimeGoing["$dayNumber"] == dayNumber
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.periodsTimeGoing,
                                )
                              : pregnancyTime == dayNumber
                                  ? BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: AppColors.ovulationTime,
                                    )
                                  : null,
                          child: Center(
                            child: Text('$dayNumber',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  color: periodsTimeGoing["$dayNumber"] ==
                                              dayNumber ||
                                          pregnancyTime == dayNumber
                                      ? Colors.white
                                      : Colors.black,
                                  fontFamily: "Poppins",
                                  decoration: TextDecoration.none,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                        ),
                    );
          },
        ),
        const SizedBox(height: 0.0),

        Container(
          height: 2,
          color: AppColors.colorGrayDarkBg,
        )

        // Add spacing between months
      ],
    );
  }
}
