import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class EmptyScreenUI extends StatelessWidget {
  VoidCallback? onTap;
  EmptyScreenUI({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      margin: EdgeInsets.only(top: 5.h),
      decoration: BoxDecoration(
        color: AppColors.bottomButtonColor,
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(ImagesUrl.volumeLike),
                      SvgPicture.asset(ImagesUrl.leverEmpty)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(ImagesUrl.sitingPu),
                      SvgPicture.asset(ImagesUrl.menEmpty)
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 45.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(ImagesUrl.womenBodyEmpty),
                      SvgPicture.asset(ImagesUrl.sitingPu)
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 65.w),
                child: HelperWidget().testMethod(
                    12.0,
                    FontWeight.w400,
                    AppColors.blackColor,
                    "symptoms & mood we can predict  in better way"),
              ),
              SizedBox(
                height: 7.h,
              ),
              GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: EdgeInsets.only(
                      left: 20.w, right: 20.w, bottom: 7.h, top: 7.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0.r)),
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
          )
        ],
      ),
    );
  }
}
