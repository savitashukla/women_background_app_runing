import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_woman/constants/app_string.dart';
import 'package:o_woman/constants/font_size.dart%20';
import 'package:o_woman/constants/images_url.dart';

import '../../../../constants/app_colors.dart';

class InfoCycleSummary {
  final _len = 10.0;

  void infoCycleSummaryBottomSheet(BuildContext context) {
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
                        SvgPicture.asset(ImagesUrl.cycleSummaryInfo),
                        height10,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Dummy Text",
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
                        phasesWidget(context, "Ovulation", AppString.ovulation),
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
