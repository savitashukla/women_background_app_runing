import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/home_controller/home_page_controller.dart';
import 'package:o_woman/app/views/home/home_widget/one_month_date.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class CycleHistoryScreen extends StatelessWidget {
  const CycleHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    return Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 35.h,
            ),
            Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: AppColors.colorPrimaryTestDarkMore,
                      )),
                  const Text(
                    "Cycle History",
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  Padding(
                      padding: EdgeInsets.only(right: 10.w, top: 6.h),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.allYearCalendar);
                        },
                        child: Container(
                          // height: 25.h,
                          // width: 80.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6.r),
                              border: Border.all(color: AppColors.mainColor)),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.w, vertical: 3.h),
                            child: Row(
                              children: [
                                const Text("2024"),
                                width10,
                                SvgPicture.asset(
                                  ImagesUrl.calendarIcon,
                                  height: 19.h,
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
            height10,
            Row(
              children: [
                width10,
                periodWidget(context, "Period", AppColors.heavyFlowColor),
                width10,
                periodWidget(context, "Follicular",
                    AppColors.maroonColor.withOpacity(0.15)),
                width10,
                periodWidget(
                    context, "Fertile", AppColors.maroonColor.withOpacity(0.5)),
                width10,
                periodWidget(context, "Ovulation",
                    AppColors.maroonColor.withOpacity(0.8)),
                width10,
                periodWidget(context, "Luteal", AppColors.maroonColor)
              ],
            ),
            height15,
            // Wrap(
            //     spacing: 3,
            //     runSpacing: 3,
            //     children: List.generate(
            //         3,
            //         (index) => Container(
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Padding(
            //                     padding: EdgeInsets.symmetric(horizontal: 10.w),
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         RichText(
            //                           text: TextSpan(
            //                               text: "Current Cycle: ",
            //                               style: w500_16Poppins(
            //                                   color: AppColors.blackColor),
            //                               children: [
            //                                 TextSpan(
            //                                     text: "Started 21 Nov - 22 Dec",
            //                                     style: w500_16Poppins(
            //                                         color: Colors.grey))
            //                               ]),
            //                         ),
            //                         GestureDetector(
            //                           onTap: () {
            //                             Navigator.pushNamed(
            //                                 context, Routes.cycleDetailsScreen);
            //                           },
            //                           child: Padding(
            //                             padding: EdgeInsets.all(10.sp),
            //                             child: SvgPicture.asset(
            //                               ImagesUrl.forwardIcon,
            //                               height: 16.h,
            //                               width: 16.w,
            //                             ),
            //                           ),
            //                         )
            //                       ],
            //                     ),
            //                   ),
            //                   Padding(
            //                     padding: EdgeInsets.symmetric(horizontal: 10.w),
            //                     child: Text(
            //                       "4-day period",
            //                       style: w400_14Poppins(
            //                           color: AppColors.blackColor
            //                               .withOpacity(0.8)),
            //                     ),
            //                   ),
            //                   height20,
            //                   Padding(
            //                     padding: EdgeInsets.symmetric(horizontal: 15.w),
            //                     child: ListOneMonthDate()
            //                         .oneMonthDateList(homePageController),
            //                   ),
            //                 ],
            //               ),
            //             )))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: commonWidget(context)),
            )
          ],
        ),
      ),
    );
  }

  Widget periodWidget(BuildContext context, String title, Color color) {
    return Row(
      children: [
        Container(
          height: 8.h,
          width: 8.w,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        width5,
        Text(
          title,
          style: w400_12Poppins(),
        )
      ],
    );
  }
}

Widget commonWidget(BuildContext context) {
  HomePageController homePageController = Get.put(HomePageController());
  return Container(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                    text: "Current Cycle: ",
                    style: w500_16Poppins(color: AppColors.blackColor),
                    children: [
                      TextSpan(
                          text: "Started 21 Nov - 22 Dec",
                          style: w500_16Poppins(color: Colors.grey))
                    ]),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.cycleDetailsScreen);
                },
                child: Padding(
                  padding: EdgeInsets.all(10.sp),
                  child: SvgPicture.asset(
                    ImagesUrl.forwardIcon,
                    height: 16.h,
                    width: 16.w,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Text(
            "4-day period",
            style: w400_14Poppins(color: AppColors.blackColor.withOpacity(0.8)),
          ),
        ),
        height20,
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListOneMonthDate().oneMonthDateList(homePageController),
        ),
      ],
    ),
  );
}
