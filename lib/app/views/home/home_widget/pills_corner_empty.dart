import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class PillCornerEmptyScreen extends StatelessWidget {
  const PillCornerEmptyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100.h,
        margin: EdgeInsets.only(top: 5.h),
        decoration: BoxDecoration(
          color: AppColors.targetV,
          borderRadius: BorderRadius.circular(12.sp),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HelperWidget().testMethodStartAlign(
                        12.0,
                        FontWeight.w400,
                        AppColors.blackColor,
                        "symptoms & mood we can predict  in better way"),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.addPillScreen);
                      },
                      child: Container(
                        padding: EdgeInsets.only(
                            left: 20.w, right: 20.w, bottom: 7.h, top: 7.h),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0.r)),
                          color: Colors.deepOrangeAccent,
                          gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                AppColors.circlePaint2,
                                AppColors.circlePaint,
                              ]),
                        ),
                        child: HelperWidget().testMethod(
                            14.0, FontWeight.w300, AppColors.whiteColor, "Add"),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: SvgPicture.asset(ImagesUrl.pillEmpty),
              ),
            )
          ],
        ));
  }
}
