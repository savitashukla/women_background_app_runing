import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';

import '../../../../constants/app_colors.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../routes/routes.dart';
import '../../../viewmodels/home_controller/home_page_controller.dart';

class ListSymptomsMoodOnly {
  listSymptomsMoodPreOnly(
      BuildContext context, int index, HomePageController homePageController) {
    return Container(
      height: 55.h,
      margin: EdgeInsets.only(left: 0, right: 10.w),
      //width: (MediaQuery.of(context).size.width - 5) / 4.7,
      width: 55.w,
      child: index == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    //  HelperWidget().flutterCustomToast("Coming Soon");
                    Navigator.pushNamed(context, Routes.symptomsAndMoodScreen);
                  },
                  child: Container(
                    height: 55.h,
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    width: 55.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.bottomButtonColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 28.h,
                          width: 28.w,
                          decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.colorPrimaryLight),
                          child: const Icon(
                            Icons.add,
                            size: 20,
                            color: AppColors.whiteColor,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                HelperWidget().testMethod(12.0, FontWeight.w400,
                    AppColors.colorPrimaryTestDarkMore, "Add"),
              ],
            )
          : Padding(
              padding: EdgeInsets.only(bottom: 0.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 55.h,
                    margin: EdgeInsets.only(left: 0, right: 0, top: 0.h),
                    width: 55.w,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.bottomButtonColor,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          homePageController.syModeImage[index - 1],
                          height: 15.h,
                          width: 15.w,
                          fit: BoxFit.fill,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  HelperWidget().testMethod(
                      getFontSize(12),
                      FontWeight.w400,
                      AppColors.colorPrimaryTestDarkMore,
                      homePageController.syModeString[index - 1]),
                ],
              ),
            ),
    );
  }
}
