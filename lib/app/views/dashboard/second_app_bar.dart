import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/images_url.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';
import '../../viewmodels/dashboard_controller.dart';
import '../home/circle_gap_custom_paint.dart';

class AppBarSec {
  appBarSecondMethod(BuildContext context) {
    DashboardController controllerDashBoard = Get.find();

    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.profileScreen);
                    },
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40.w,
                              height: 40.h,
                              margin: EdgeInsets.only(
                                  left: 15.w, top: 7, bottom: 4),
                              child: CircleGapCustomPaint(
                                color: AppColors.whiteColor,
                                opacity: 0.4,
                                strokeWidth: 2.0.w,
                                gapPercentage: 60,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 35.w,
                          bottom: 2.h,
                          child: Container(
                            height: 20.h,
                            width: 20.w,
                            decoration: const BoxDecoration(
                              color: AppColors.whiteColor,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                ImagesUrl.drawIcon,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Obx(
                    () => controllerDashBoard.currentIndex.value == 5
                        ? InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.profileScreen);
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 18.w),
                              child: Center(
                                child: HelperWidget().testMethod(
                                    16.0,
                                    FontWeight.w700,
                                    AppColors.colorPrimary,
                                    "Community"),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.profileScreen);
                            },
                            child: Center(
                                child: SvgPicture.asset(
                              ImagesUrl.appLogo,
                              height: 25.h,
                              width: 25.w,
                            )),
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 0.w),
                          child: GestureDetector(
                            onTap: () {
                              HelperWidget().flutterCustomToast("coming soon");
                              //  Navigator.pushNamed(context, Routes.searchPage);
                            },
                            child: SvgPicture.asset(
                              ImagesUrl.searchIcon,
                              color: AppColors.colorPrimary,
                            ),
                          )),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 7.w, top: 0.h, right: 7.w),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 5.w),
                            child: GestureDetector(
                              onTap: () {
                                // context, Routes.insightNotification);
                                HelperWidget()
                                    .flutterCustomToast("coming soon");
                                /* Navigator.pushNamed(

                                context, Routes.communityNotification);*/
                              },
                              child: SvgPicture.asset(
                                ImagesUrl.notificationRed,
                                color: AppColors.colorPrimary,
                              ),
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ],
          );
        });
  }
}
