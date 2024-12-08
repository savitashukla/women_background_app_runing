import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';

import '../../../../constants/app_colors.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../viewmodels/home_controller/home_page_controller.dart';

class HealthLifestyle {
  healthLifestyleWidget(BuildContext context, int index) {
    HomePageController homePageController = Get.find();

    return Container(
      height: 55.h,
      margin: EdgeInsets.only(left: 0, right: 10.w),
      width: 55.w,
      child: index == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // HelperWidget().flutterCustomToast("coming soon");

                    Navigator.pushNamed(
                        context, Routes.homeHealthLifestyleScreen);
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
                    AppColors.colorPrimaryTestDarkMore, "Add\n "),
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 55.h,
                  margin: EdgeInsets.only(left: 0, right: 0, top: 5.h),
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
                        homePageController.healthLifeSyA[index - 1],
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
                    12.0,
                    FontWeight.w400,
                    AppColors.colorPrimaryTestDarkMore,
                    homePageController.healthLifeSyS[index - 1]),
              ],
            ),
    );
  }
}
