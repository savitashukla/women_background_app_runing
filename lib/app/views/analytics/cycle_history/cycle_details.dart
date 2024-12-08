import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/app/views/home/home_widget/symptoms_mood_pre_list.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/appBarheader.dart';

class CycleDetailsScreen extends StatelessWidget {
  const CycleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const int initialValue = 18;
    final List<Color> innerContainerColors = [
      AppColors.heavyFlowColor,
      AppColors.heavyFlowColor,
      AppColors.moderateFlowColor,
      AppColors.moderateFlowColor,
      AppColors.lightFlowColor,
      AppColors.lightFlowColor,
      AppColors.spottingFlowColor,
      AppColors.spottingFlowColor,
      Colors.transparent,
      Colors.transparent,
      Colors.transparent
    ];

    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppBarHeader(title: "Cycle Details"),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Text(
              "You can edit if the cycle history is not appropriate",
              style: w400_12Poppins(),
            ),
          ),
          height20,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.sp),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height10,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Menstrual Record",
                      style: w400_18Poppins(),
                    ),
                  ),
                  height5,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "8 Dec - 22 Dec",
                      style: w400_16Poppins(color: AppColors.hitText),
                    ),
                  ),
                  height10,
                  Divider(
                    thickness: 0.3,
                    color: AppColors.colorGrayCycleTrack.withOpacity(0.7),
                  ),
                  height10,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Menstrual Symptoms",
                      style: w400_18Poppins(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: SizedBox(
                      height: 96.h,
                      child: ListView.builder(
                          itemCount: 6,
                          shrinkWrap: true,
                          padding: const EdgeInsets.all(0),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return SymptomsMoodPreList()
                                .listSymptomsMoodPre(context, index);
                          }),
                    ),
                  ),
                  height10,
                  Divider(
                    thickness: 0.3,
                    color: AppColors.colorGrayCycleTrack.withOpacity(0.7),
                  ),
                  height10,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Flow Intensity",
                      style: w400_18Poppins(),
                    ),
                  ),
                  height15,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Wrap(
                      spacing: 14.w,
                      runSpacing: 20.h,
                      children: List.generate(
                        11,
                        (index) => Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(5.r),
                              child: SizedBox(
                                height: 50.h,
                                width: 15.w,
                                child: Stack(
                                  children: [
                                    Container(
                                      color: AppColors.colorGrayCycleTrack
                                          .withOpacity(0.15),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: innerContainerColors[index %
                                                innerContainerColors.length],
                                            borderRadius:
                                                BorderRadius.circular(4.r)),
                                        height: 50.h * 0.7,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            height5,
                            Text(
                              "${initialValue + index}",
                              style: w400_14Poppins(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  height15,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Row(
                      children: [
                        flowWidget(context, "Heavy", AppColors.heavyFlowColor),
                        width20,
                        flowWidget(
                            context, "Moderate", AppColors.moderateFlowColor),
                        width20,
                        flowWidget(context, "Light", AppColors.lightFlowColor),
                        width20,
                        flowWidget(
                            context, "Spotting", AppColors.spottingFlowColor)
                      ],
                    ),
                  ),
                  height10,
                  Divider(
                    thickness: 0.3,
                    color: AppColors.colorGrayCycleTrack.withOpacity(0.7),
                  ),
                  height10,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Previous Cycle Length: 28 days",
                      style: w400_18Poppins(),
                    ),
                  ),
                  height5,
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Text(
                      "Normal",
                      style: w400_16Poppins(color: AppColors.hitText),
                    ),
                  ),
                  height15,
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

Widget flowWidget(BuildContext context, String title, Color color) {
  return Row(
    children: [
      Container(
        height: 10.h,
        width: 10.w,
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
      width5,
      Text(
        title,
        style: w400_14Poppins(),
      )
    ],
  );
}
