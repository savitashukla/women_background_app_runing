import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/app/views/home/circle_paint/CirclePaint.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/app_string.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/font_size.dart';
import '../../viewmodels/home_controller/home_page_controller.dart';

class InfoAboutCycle {
  final _len = 10.0;

  void infoAboutCycleBottomSheet(
      BuildContext context, HomePageController homePageController) {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height - 100,
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 10.w,
                right: 10.w),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      0.0,
                      5.0,
                    ),
                    blurRadius: 1.0,
                    spreadRadius: .3.r,
                    color: AppColors.colorPrimary,
                    //   inset: true,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        height50,
                        SizedBox(
                          height: getProportionateScreenHeight(250),
                          width: getProportionateScreenWidth(250),
                          child: CustomPaint(
                            painter: CirclePainter(
                                startAngle: _len,
                                cyclePeriods:
                                    homePageController.cyclePeriods.value / 10,
                                cycleFollicular:
                                    homePageController.cycleFollicular.value /
                                        10,
                                cycleOvulation:
                                    homePageController.cycleOvulation.value /
                                        10,
                                cycleLuteal:
                                    homePageController.cycleLuteal.value / 10),
                            child: Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image(
                                  image: const AssetImage(
                                    ImagesUrl.cycleImages,
                                  ),
                                  height: 100.h,
                                  width: 100.w,
                                )
                              ],
                            )),
                          ),
                        ),
                        height10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Phases of the menstrual cycle",
                                textAlign: TextAlign.start,
                                style: w500_16Poppins(
                                    color: AppColors.textColorCycleInfo)),
                          ],
                        ),
                        height10,
                        phasesWidget(context, "Period", AppString.periodText),
                        height15,
                        phasesWidget(
                            context, "Follicular", AppString.follicular),
                        height15,
                        phasesWidget(
                            context, "Ovulation", AppString.ovulation),
                        height15,
                        phasesWidget(context, "Luteal", AppString.luteal),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 50,

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 6,
                          width: 46,
                          margin: const EdgeInsets.only(top: 0),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: AppColors.colorPrimaryTest),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}

Widget phasesWidget(BuildContext context, String title, String description) {
  return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          color: AppColors.scaffoldBackgroundColor),
      child: RichText(
        text: TextSpan(
          text: '$title  \n',
          style: w400_16Poppins(color: AppColors.textColorQus),
          children: <TextSpan>[
            TextSpan(
                text: description,
                style: w400_12Poppins(color: AppColors.textColorCycleInfoMore)),
          ],
        ),
      ));
}
