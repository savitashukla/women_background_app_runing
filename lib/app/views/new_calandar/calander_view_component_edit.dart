import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/app/models/calander_config.dart';
import 'package:o_woman/app/views/calander_date_info.dart';
import 'package:o_woman/constants/app_colors.dart';

class CalendarViewEdit extends StatelessWidget {
  const CalendarViewEdit({
    super.key,
    required this.month,
    required this.builder,
    required this.config,
  });
  final DateTime month;
  final CalendarConfig config;
  final Widget Function(CalendarDateInfo info) builder;

  @override
  Widget build(BuildContext context) {
    final offset = DateUtils.firstDayOffset(
        month.year, month.month, MaterialLocalizations.of(context));
    final weekdays = ["S", "M", "T", "W", "T", "F", "S"];
    final nextMonth = DateUtils.addMonthsToMonthDate(month, 1);
    final endOffset = nextMonth.weekday == 7 ? 0 : 7 - nextMonth.weekday;
    final start =
        DateTime(month.year, month.month).subtract(Duration(days: offset));
    final end = nextMonth.add(Duration(days: endOffset));

    final List<CalendarDateInfo> data = [];
    for (DateTime d = start;
        d.isBefore(end);
        d = d.add(const Duration(days: 1))) {
      final enabled =
          (d.isAfter(config.minDate) && d.isBefore(config.maxDate)) ||
              DateUtils.isSameDay(d, config.minDate);
      data.add(CalendarDateInfo(date: d, applyBorder: false, enabled: enabled));
    }

    for (int i = data.length - 1; i >= data.length - 7; i--) {
      data[i] = data[i].copyWith(applyBorder: false);
    }

    final children = data
        .map(
          (e) => GridTile(
            child: builder(e),
          ),
        )
        .toList();
    print("data.lengt ${data.length}");
    return Column(
      children: [
        Row(
          children: weekdays
              .map(
                (e) => Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 8.0,
                    ),
                    margin: const EdgeInsets.only(right: 3),
                    child: Center(
                      child: Text(
                        e,
                        maxLines: 1,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          color: AppColors.colorPrimaryTestDarkMore,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
        SizedBox(
          height: data.length / 7 > 5 ? 260.h : 210.h,
          child: GridView.custom(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              mainAxisExtent: 45,
              mainAxisSpacing: 4,
              crossAxisSpacing: 6,
            ),
            childrenDelegate: SliverChildListDelegate(children),
          ),
        ),
      ],
    );
  }
}
