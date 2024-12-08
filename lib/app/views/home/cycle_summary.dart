
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/constants/app_colors.dart';

import '../../../utils/appBarheader.dart';
import 'home_widget/progressbar_three.dart';


class CycleSummary extends StatelessWidget {
  const CycleSummary({Key? key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          /*   mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,*/
          children: [
            const AppBarHeader(title: "Cycle Summary"),
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 25.h, bottom: 10.w),
                child: SizedBox(
                  height: 110.h,
                  width: 110.w,
                  child: ProgressBarThree(),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            margin: const EdgeInsets.only(
                                top: 5, right: 10, left: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.avgCycleDayProgressBarFull,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Average Cycle length',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: AppColors.homePageDailyRCS),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " \n ABNORMAL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      color: AppColors.homePageDailyRCST),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "  39 Days",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycleInfo),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: 1.h,
                    color: AppColors.divider,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Cycle typically last between 21-35 days",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: "Poppins",
                          color: AppColors.blackColor),
                    ),
                  ),
                  SizedBox(
                    height:2.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 0.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            margin: const EdgeInsets.only(
                                top: 5, right: 10, left: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.avgCycleDayProgressBarFull,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Average Cycle length',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: AppColors.homePageDailyRCS),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " \n ABNORMAL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      color: AppColors.homePageDailyRCST),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "  39 Days",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycleInfo),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: 1.h,
                    color: AppColors.divider,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Cycle typically last between 21-35 days",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: "Poppins",
                          color: AppColors.blackColor),
                    ),
                  ),
                  SizedBox(
                    height:2.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 90.h,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.whiteColor),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 8,
                            width: 8,
                            margin: const EdgeInsets.only(
                                top: 5, right: 10, left: 5),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.avgCycleDayProgressBarFull,
                            ),
                          ),
                          RichText(
                            text: const TextSpan(
                              text: 'Average Cycle length',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: AppColors.homePageDailyRCS),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " \n ABNORMAL",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      fontFamily: "Poppins",
                                      color: AppColors.homePageDailyRCST),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "  39 Days",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycleInfo),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Container(
                    height: 1.h,
                    color: AppColors.divider,
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      "Cycle typically last between 21-35 days",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          fontFamily: "Poppins",
                          color: AppColors.blackColor),
                    ),
                  ),
                  SizedBox(
                    height:2.h,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}



/*
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/constants/app_colors.dart';

import '../../../utils/appBarheader.dart';
import 'home_widget/progressbar_three.dart';

class CycleSummary extends StatelessWidget {
  const CycleSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColors.homeBgColor,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AppBarHeader(title: "Cycle Summary"),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 65.h,
                    ),
                    child: SizedBox(
                      height: 110.h,
                      width: 110.w,
                      child: ProgressBarThree(),
                    ),
                  ),
                ),
                Container(
                  height: 220.h,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Column(
                    children: [
                      Container(
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 8,
                                  width: 8,
                                  margin:
                                      const EdgeInsets.only(top: 5, right: 3),
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.avgCycleDayProgressBarFull,
                                  ),
                                ),
                                Expanded(
                                  child: RichText(
                                    text: const TextSpan(
                                      text: 'Average Cycle length',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 12,
                                          fontFamily: "Poppins",
                                          color: AppColors.homePageDailyRCS),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: " \n ABNORMAL",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              fontFamily: "Poppins",
                                              color:
                                                  AppColors.homePageDailyRCST),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Text(
                              "  39 Days",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  fontFamily: "Poppins",
                                  color: AppColors.textColorCycleInfo),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 2,
                        color: AppColors.homeBgColor,
                      ),
                      Text(
                        "Cycle typically last between 21-35 days",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10.sp,
                            fontFamily: "Poppins",
                            color: AppColors.homePageDailyRCS),
                      )
                    ],
                  ),
                )
              ],
            )));
  }
}
*/
