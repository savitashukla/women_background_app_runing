import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../constants/app_colors.dart';
import '../../../viewmodels/post_login/cycle_track_controller.dart';

class CycleTrackMonthWidget extends StatefulWidget {
  final int currentYear;
  final int monthIndex;

  const CycleTrackMonthWidget({
    Key? key,
    required this.currentYear,
    required this.monthIndex,
  }) : super(key: key);

  @override
  State<CycleTrackMonthWidget> createState() => _CycleTrackMonthWidgetState();
}

class _CycleTrackMonthWidgetState extends State<CycleTrackMonthWidget> {
  late DateTime monthDate;
  late int firstDayOfWeek;
  CycleTrackController cycleTrackController = Get.put(CycleTrackController());

  late int dayNumberCheckBoxIndex = 0;
  int dayNumberOld = 1;
  int dayNumber = 0;

  @override
  void initState() {
    super.initState();
    monthDate = DateTime(widget.currentYear, widget.monthIndex, 1);
    if (monthDate.weekday == 7) {
      firstDayOfWeek = 0;
    } else {
      firstDayOfWeek = monthDate.weekday;
    }
  }

  @override
  Widget build(BuildContext context) {
    dayNumber = firstDayOfWeek;

    // int dayNumberOld = DateTime(widget.currentYear, widget.monthIndex + 1, 0).day;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 13, bottom: 7),
          child: Text(
            '${DateFormat.MMMM().format(DateTime(widget.currentYear, widget.monthIndex, 1))}  ${monthDate.year}',
            style: TextStyle(
              fontSize: 12.sp,
              color: AppColors.colorPrimaryTestDarkMore,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w400,
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

              print("dayNumberOlddd$dayNumber");
              print(
                  "widget.currentYear, widget.monthIndex${DateTime(widget.currentYear, widget.monthIndex, 0)}");

              DateTime lastDayOfLastMonth = DateTime(
                      widget.currentYear, widget.monthIndex, 0)
                  .subtract(Duration(days: dayNumber < 0 ? 0 : dayNumber - 1));

              dayNumberOld = lastDayOfLastMonth.day;
              dayNumber = dayNumber - 1;
            } else {}
            return index < firstDayOfWeek
                ? Column(
                    children: [
                      Text('$dayNumberOld',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: AppColors.textColorCycleCalDis.withOpacity(0.6),
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w300,
                          )),
                      SizedBox(
                        height: 10.0, // Set the height of the checkbox
                        width: 10.0,
                        child: Transform.scale(
                          scale: .6,
                          child: Checkbox(
                            visualDensity: const VisualDensity(
                                horizontal: -1.0, vertical: -4.0),
                            checkColor: AppColors.textColorSkip,
                            // overlayColor:  AppColors.textFieldBackGroundDarkColor,
                            shape: const CircleBorder(),
                            side: MaterialStateBorderSide.resolveWith(
                              (states) => BorderSide(
                                  width: 1.5,
                                  color: AppColors.textColorCycleCalDis
                                      .withOpacity(0.7)),
                            ),
                            value: false,
                            onChanged: (bool? newValue) {
                              /*  cycleTrackController.checkBoxValues[
                                      "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] =
                                  true;*/
                            },
                          ),
                        ),
                      ),
                    ],
                  )
                : InkWell(
                    onTap: () {
                      if (cycleTrackController.checkBoxValues[
                                  "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] ==
                              null ||
                          cycleTrackController.checkBoxValues[
                                  "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] ==
                              false) {
                        cycleTrackController.checkBoxValues[
                                "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] =
                            true;
                      } else {
                        cycleTrackController.checkBoxValues[
                                "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] =
                            false;
                      }
                    },
                    child: Column(
                      children: [
                        Obx(
                          () => Text('${index - firstDayOfWeek + 1}',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: cycleTrackController.checkBoxValues[
                                            "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] ==
                                        true
                                    ? AppColors.colorPrimary
                                    : AppColors.textColorCycleCal,
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                        SizedBox(
                            height: 10.0,
                            width: 10.0,
                            child: Obx(
                              () =>
                              cycleTrackController.checkBoxValues[
                                              "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] !=
                                          null &&
                                  cycleTrackController.checkBoxValues[
                                              "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] ==
                                          true
                                  ? Transform.scale(
                                      scale: .6,
                                      child: Checkbox(
                                        activeColor: cycleTrackController
                                                            .checkBoxValues[
                                                        "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] !=
                                                    null &&
                                                cycleTrackController
                                                            .checkBoxValues[
                                                        "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] ==
                                                    true
                                            ? AppColors
                                                .colorPrimary // Set the color when checked
                                            : Colors.transparent,
                                        shape: const CircleBorder(),
                                        checkColor: AppColors.whiteColor,
                                        value: cycleTrackController
                                                .checkBoxValues[
                                            "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"],
                                        onChanged: (bool? newValue) {
                                          cycleTrackController.checkBoxValues[
                                                  "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] =
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
                                          cycleTrackController.checkBoxValues[
                                                  "${widget.currentYear}-${widget.monthIndex}-${index - firstDayOfWeek + 1}"] =
                                              true;
                                        },
                                      ),
                                    ),
                            )),
                      ],
                    ),
                  );
          },
        ),
         SizedBox(height: 10.0.h),
      ],
    );
  }
}
