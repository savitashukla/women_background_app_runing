import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/dashboard_controller.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

import '../../../constants/app_colors.dart';
import '../home/circle_gap_custom_paint.dart';

class AppbarCustom extends StatefulWidget implements PreferredSizeWidget {
  final String? title;
  final bool? menuicon;
  final bool? iconnotifiction;
  final bool? is_supporticon;
  final bool? is_whatsappicon;
  final bool? menuback;
  final bool? is_wallaticon;
  final Widget? child;
  final Function? onPressed;
  final Function? onTitleTapped;

  @override
  final Size preferredSize;

  //const TopBar({Key key}) : super(key: key);
  const AppbarCustom(
      {super.key,
      @required this.title,
      @required this.menuicon,
      @required this.menuback,
      this.iconnotifiction,
      this.is_wallaticon,
      this.is_supporticon,
      this.is_whatsappicon,
      this.child,
      this.onPressed,
      this.onTitleTapped})
      : preferredSize = const Size.fromHeight(90);

  @override
  State<AppbarCustom> createState() => _AppbarCustomState();
}

class _AppbarCustomState extends State<AppbarCustom>
    with TickerProviderStateMixin {
  DashboardController controllerDashBoard = Get.put(DashboardController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 52.h,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [AppColors.appBarColor1, AppColors.appBarColor1],
              )),
              child: Row(
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
                              width: 48.w,
                              height: 48.h,
                              margin: EdgeInsets.only(left: 10.w),
                              child: CircleGapCustomPaint(
                                color: const Color(0xff9DA4FB),
                                opacity: 0.4,
                                strokeWidth: 2.0.w,
                                gapPercentage: 60,
                              ),
                            ),
                            InkWell(
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
                                      widget.title ?? "OWOMEN"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: 38.w,
                          bottom: 1.h,
                          child: Container(
                            height: 21.h,
                            width: 21.w,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: EdgeInsets.only(left: 12.w),
                          child: SvgPicture.asset(
                            ImagesUrl.searchIcon,
                            color: AppColors.colorPrimary,
                          )),
                      Padding(
                          padding:
                              EdgeInsets.only(left: 7.w, top: 0.h, right: 7.w),
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.w, right: 5.w),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.insightNotification);
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
            ),
          ],
        ));
    // );
  }
}
