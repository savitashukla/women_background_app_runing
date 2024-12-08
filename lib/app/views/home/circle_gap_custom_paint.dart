import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../viewmodels/home_controller/home_page_controller.dart';

class CircleGapCustomPaint extends StatelessWidget {
  final Color color;
  final double opacity;
  final double strokeWidth;
  final double gapPercentage;

  CircleGapCustomPaint({
    super.key,
    required this.color,
    required this.opacity,
    required this.strokeWidth,
    required this.gapPercentage,
  });
  HomePageController homePageController = Get.put(HomePageController());
  SettingsScreenController controller = Get.put(SettingsScreenController());
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: CirclePainter(color, opacity, strokeWidth, gapPercentage),
        child: Obx(() => homePageController.isProfileLoading.value
            ? const Center(
                child: CircularProgressIndicator(
                color: Colors.transparent,
              ))
            : homePageController.profiledata.value.data != null &&
                    homePageController.profiledata.value.data!.profilePic !=
                        null &&
                    homePageController
                        .profiledata.value.data!.profilePic!.isNotEmpty
                ? SizedBox(
                    height: 45.h,
                    width: 45.w,
                    // decoration: homePageController.kGradientBoxDecoration.value,
                    child: Padding(
                      padding: EdgeInsets.all(2.sp),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.mainColor.withOpacity(0.1),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(1.0.sp),
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl:
                                "${"https://de4nfar4wtruu.cloudfront.net/"}${homePageController.profiledata.value.data!.profilePic!}",
                            placeholder: (context, url) => SizedBox(
                              height: 85.h,
                              width: 85.w,
                            ),
                            imageBuilder: (context, imageProvider) => Container(
                              height: 85.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ))
                : Padding(
                    padding: EdgeInsets.all(2.0.sp),
                    child: Container(
                        height: 45.h,
                        width: 45.w,
                        // decoration: controller.kGradientBoxDecoration.value,
                        padding: EdgeInsets.all(4.sp),
                        child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.mainColor.withOpacity(0.1),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0.sp),
                              child: const Icon(Icons.person),
                            ))),
                  )));
  }
}

class CirclePainter extends CustomPainter {
  final Color color;
  final double opacity;
  final double strokeWidth;
  final double gapPercentage;

  CirclePainter(this.color, this.opacity, this.strokeWidth, this.gapPercentage);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color.withOpacity(opacity)
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double radius = min(size.width / 2, size.height / 2);

    double startAngle = 70.r;
    double endAngle = 271.r;

    canvas.drawArc(
      Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: radius),
      radians(startAngle),
      radians(endAngle),
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  double radians(double degrees) {
    return degrees * (pi / 180);
  }
}
