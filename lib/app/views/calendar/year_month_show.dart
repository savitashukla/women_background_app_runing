import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/views/calendar/year_month_day_view.dart';

import '../../../constants/app_colors.dart';

class MonthListView extends StatelessWidget {
  final int currentYear;
  final int currentMonth;

  const MonthListView(
      {super.key, required this.currentYear, required this.currentMonth});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      cacheExtent: 20,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 7.0,
      ),
      itemCount: 12,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        int displayMonth = index + 1;

        return Container(
          margin: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 33),
                child: YearMonthDayWidget(
                  currentYear: currentYear,
                  monthIndex: displayMonth,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 0, top: 3),
                      child: Text(
                        DateFormat.MMMM()
                            .format(DateTime(currentYear, displayMonth, 1)),
                        style: const TextStyle(
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: AppColors.textColorCycleCal),
                      ),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        for (var day in ['S', 'M', 'T', 'W', 'T', 'F', 'S'])
                          Text(
                            day,
                            style: const TextStyle(
                              fontSize: 8,
                              color: AppColors.blackColor,
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
