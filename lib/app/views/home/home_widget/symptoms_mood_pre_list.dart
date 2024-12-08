import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';

class SymptomsMoodPreList {
  Widget listSymptomsMoodPre(BuildContext context, int index) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.only(left: 0.w, top: 0.h, right: 10.w),
      width: 55.w,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 55.h,
              margin: const EdgeInsets.only(left: 0, right: 0),
              width: 55.w,
              decoration: const BoxDecoration(
                  color: AppColors.bottomButtonColor, shape: BoxShape.circle),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    index == 0
                        ? Image.asset(
                            ImagesUrl.loveIcon,
                            height: 25.h,
                            width: 25.w,
                          )
                        : index == 1
                            ? SvgPicture.asset(
                                ImagesUrl.syMoodPre,
                                height: 23.h,
                                fit: BoxFit.fill,
                                color: AppColors.homePageIconColor,
                                width: 20.w,
                              )
                            : index == 2
                                ? SvgPicture.asset(
                                    ImagesUrl.nounStomachBloating,
                                    height: 20.h,
                                    color: AppColors.homePageIconColor,
                                    fit: BoxFit.fill,
                                    width: 20.w,
                                  )
                                : SvgPicture.asset(
                                    ImagesUrl.sweaty,
                                    height: 20.h,
                                    color: AppColors.homePageIconColor,
                                    fit: BoxFit.fill,
                                    width: 20.w,
                                  )
                  ]),
            ),
            index == 0
                ? HelperWidget().testMethodStartAlign(
                    12.0, FontWeight.w400, AppColors.textColorQus, "Sad")
                : index == 1
                    ? HelperWidget().testMethodStartAlign(
                        12.0, FontWeight.w400, AppColors.textColorQus, "Cramps")
                    : index == 2
                        ? HelperWidget().testMethodStartAlign(12.0,
                            FontWeight.w400, AppColors.textColorQus, "Bloating")
                        : HelperWidget().testMethodStartAlign(12.0,
                            FontWeight.w400, AppColors.textColorQus, "Sweaty")
          ],
        ),
      ),
    );
  }
}
