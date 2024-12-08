import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../../utils/helper_widgets/bottom_sheet_call.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../viewmodels/home_controller/commonController.dart';
import '../../viewmodels/home_controller/home_page_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({
    super.key,
  });

  HomePageController homePageController = Get.put(HomePageController());
  SettingsScreenController controller = Get.put(SettingsScreenController());

  CommonController commonController = Get.put(CommonController());

  @override
  Widget build(BuildContext context) {
    homePageController.alwaysFalse();

    Future<bool> onWillPop() {
      if (commonController.retakeValueProfile.value) {
        Navigator.pushNamed(context, Routes.dashBoard);
        return Future.value(true);
      } else {
        return Future.value(true);
      }
    }

    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: AppColors.scaffoldBackgroundColor,
            leading: GestureDetector(
                onTap: () {
                  if (commonController.retakeValueProfile.value) {
                    Navigator.pushNamed(context, Routes.dashBoard);
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: SvgPicture.asset(ImagesUrl.iconClose),
                )),
          ),
          body: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 115,
              child: Stack(children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.0.w, vertical: 0.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // HelperWidget().flutterCustomToast("coming soon");
                          Navigator.pushNamed(
                            context,
                            Routes.profileEditScreen,
                          );
                        },
                        child: Card(
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.r),
                          ),
                          color: AppColors.scaffoldBackgroundColor,
                          child: Container(
                            // height: 80.h,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: AppColors.mainColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 5.h),
                              child: Row(
                                children: [
                                  width5,
                                  //const ProfilePicturewithCameraIcon(),
                                  Center(
                                    child: Obx(
                                      () => homePageController
                                                      .profiledata.value.data ==
                                                  null ||
                                              homePageController.profiledata
                                                      .value.data!.profilePic ==
                                                  null
                                          ? Container(
                                              decoration: controller
                                                  .kGradientBoxDecoration.value,
                                              height: 60.h,
                                              width: 60.w,
                                              child: Padding(
                                                padding: EdgeInsets.all(3.0.sp),
                                                child: Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: AppColors.mainColor,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0.sp),
                                                    child: const Icon(
                                                      Icons.person,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              decoration: homePageController
                                                  .kGradientBoxDecoration.value,
                                              // width: 110.w,
                                              height: 60.h,
                                              child: Padding(
                                                padding: EdgeInsets.all(3.0.sp),
                                                child: Container(
                                                  decoration: controller
                                                      .kInnerDecoration.value,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0.sp),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.fill,
                                                      imageUrl:
                                                          "${"https://de4nfar4wtruu.cloudfront.net/"}${homePageController.profiledata.value.data!.profilePic!}",
                                                      placeholder:
                                                          (context, url) =>
                                                              const SizedBox(
                                                        height: 60,
                                                        width: 60,
                                                      ),
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        height: 60,
                                                        width: 60,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                          image:
                                                              DecorationImage(
                                                            image:
                                                                imageProvider,
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                    ),
                                  ),
                                  width10,
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 10.h),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Obx(
                                          () => Text(
                                            homePageController
                                                            .profiledata.value.data !=
                                                        null &&
                                                    homePageController
                                                            .profiledata
                                                            .value
                                                            .data!
                                                            .name !=
                                                        null &&
                                                    homePageController
                                                        .profiledata
                                                        .value
                                                        .data!
                                                        .name!
                                                        .isNotEmpty
                                                ? homePageController.profiledata
                                                    .value.data!.name!
                                                    .toString()
                                                : "",
                                            style: w400_16Poppins(
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                        // height5,
                                        Obx(
                                          () => Text(
                                            homePageController.profiledata.value
                                                            .data !=
                                                        null &&
                                                    homePageController
                                                            .profiledata
                                                            .value
                                                            .data!
                                                            .emailId !=
                                                        null &&
                                                    homePageController
                                                        .profiledata
                                                        .value
                                                        .data!
                                                        .emailId!
                                                        .isNotEmpty
                                                ? homePageController.profiledata
                                                    .value.data!.emailId!
                                                    .toString()
                                                : "",
                                            style: w400_12Poppins(
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                        // height5,
                                        Obx(
                                          () => Text(
                                            homePageController.profiledata.value
                                                            .data !=
                                                        null &&
                                                    homePageController
                                                            .profiledata
                                                            .value
                                                            .data!
                                                            .affiliationId !=
                                                        null &&
                                                    homePageController
                                                        .profiledata
                                                        .value
                                                        .data!
                                                        .affiliationId!
                                                        .isNotEmpty
                                                ? homePageController.profiledata
                                                    .value.data!.affiliationId!
                                                    .toString()
                                                : "",
                                            style: w400_12Poppins(
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      height15,
                      Text(
                        "My Purpose",
                        style: w400_16Poppins(),
                      ),
                      height10,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Padding(
                          padding: EdgeInsets.all(8.0.sp),
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Obx(
                                () => Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.045,
                                  // width: MediaQuery.of(context).size.width * 0.15,
                                  decoration: BoxDecoration(
                                      color: !homePageController
                                              .getPregnant.value
                                          ? AppColors.mainColor.withOpacity(0.1)
                                          : AppColors.whiteColor,
                                      border: Border.all(
                                          color: !homePageController
                                                  .getPregnant.value
                                              ? Colors.transparent
                                              : Colors.grey.shade300),
                                      borderRadius: BorderRadius.circular(5.r)),
                                  child: Padding(
                                    padding: EdgeInsets.all(6.0.sp),
                                    child: Text(
                                      "Track Cycle",
                                      style: w400_13Poppins(),
                                    ),
                                  ),
                                ),
                              ),
                              width20,
                              Obx(
                                () => GestureDetector(
                                  onTap: () async {
                                    homePageController.getPregnant.value =
                                        !homePageController.getPregnant.value;
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.045,
                                    // width: MediaQuery.of(context).size.width * 0.15,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: homePageController
                                              .getPregnant.value
                                          ? AppColors.mainColor.withOpacity(0.1)
                                          : AppColors.whiteColor,
                                      border: Border.all(
                                          color: homePageController
                                                  .getPregnant.value
                                              ? Colors.transparent
                                              : Colors.grey.shade300),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(6.0.sp),
                                      child: Text(
                                        "Get Pregnant",
                                        style: w400_13Poppins(),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      height10,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonContainer(
                            onTap: () {
                              HelperWidget().flutterCustomToast("coming soon");
                              // Navigator.pushNamed(
                              //     context, Routes.settingsMainScreen);
                            },
                            boxColor: AppColors.cyanBackgroundColor,
                            imgString: ImagesUrl.settingsIcon,
                            title: "Settings",
                          ),
                          commonContainer(
                            onTap: () {
                              //  HelperWidget().flutterCustomToast("coming soon");
                              Navigator.pushNamed(
                                  context, Routes.myNotesScreen);
                            },
                            boxColor: AppColors.lightBlueColor,
                            imgString: ImagesUrl.journalIcon,
                            title: "Journal",
                          ),
                        ],
                      ),
                      height15,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          commonContainer(
                            onTap: () {
                              HelperWidget().flutterCustomToast("coming soon");
                              //     Navigator.pushNamed(context, Routes.beSafeScreen);
                            },
                            boxColor: const Color(0xffffedf4),
                            imgString: ImagesUrl.safeIcon,
                            title: "BeSafe",
                          ),
                          commonContainer(
                            onTap: () {},
                            boxColor: AppColors.purpleBackgroundColor,
                            imgString: ImagesUrl.faqIcon,
                            title: "FAQ's",
                          ),
                        ],
                      ),
                      height15,
                      customContainer(context, AppColors.lightBlueColor,
                          "Subscriptions", ImagesUrl.subscriptionIcon),
                      height10,
                      GestureDetector(
                        onTap: () {
                          BottomSheetCall().logoutBottomSheet();
                        },
                        child: customContainer(
                            context,
                            AppColors.greenBackgroundColor,
                            "Logout",
                            ImagesUrl.logoutIcon),
                      ),

                      // height10,
                      // customContainer(context, AppColors.maroonBackgroundColor,
                      //     "Delete Acount", ImagesUrl.deleteAccountIcon),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SizedBox(
                    child: Center(
                      child: Text('Version 1.0.2',
                          style: w400_14Poppins(color: AppColors.colorGray)),
                    ),
                  ),
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

class commonContainer extends StatelessWidget {
  commonContainer(
      {super.key,
      required this.title,
      required this.imgString,
      this.onTap,
      required this.boxColor});
  final Color boxColor;
  final String title;
  String imgString;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.13,
        width: MediaQuery.of(context).size.width * 0.44,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.055,
                width: MediaQuery.of(context).size.width * 0.11,
                decoration: BoxDecoration(
                    color: boxColor, borderRadius: BorderRadius.circular(15.r)),
                child: Padding(
                  padding: EdgeInsets.all(10.0.sp),
                  child: SvgPicture.asset(imgString),
                ),
              ),
              height10,
              Text(
                title,
                style: w400_14Poppins(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget customContainer(
    BuildContext context, Color boxColor, String title, String imgString) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.065,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.08,
            decoration: BoxDecoration(
                color: boxColor, borderRadius: BorderRadius.circular(8.r)),
            child: Padding(
              padding: EdgeInsets.all(7.0.sp),
              child: SvgPicture.asset(imgString),
            ),
          ),
          width10,
          Text(
            title,
            style: w400_14Poppins(),
          )
        ],
      ),
    ),
  );
}

class UnicornOutlineButton extends StatelessWidget {
  final _GradientPainter _painter;
  final Widget _child;
  final VoidCallback _callback;
  final double _radius;
  double? height;
  double? width;

  UnicornOutlineButton({
    super.key,
    required double strokeWidth,
    required double radius,
    required Gradient gradient,
    required Widget child,
    required VoidCallback onPressed,
    double? height,
    double? width,
  })  : _painter = _GradientPainter(
            strokeWidth: strokeWidth, radius: radius, gradient: gradient),
        _child = child,
        _callback = onPressed,
        _radius = radius;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _callback,
        child: GestureDetector(
          // borderRadius: BorderRadius.circular(_radius),
          onTap: _callback,
          child: Container(
            height: height,
            width: width,
            // constraints: const BoxConstraints(minWidth: 88, minHeight: 48),
            decoration: const BoxDecoration(shape: BoxShape.circle),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _child,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _GradientPainter extends CustomPainter {
  final Paint _paint = Paint();
  final double radius;
  final double strokeWidth;
  final Gradient gradient;

  _GradientPainter(
      {required double strokeWidth,
      required double radius,
      required Gradient gradient})
      : strokeWidth = strokeWidth,
        radius = 50.r,
        gradient = gradient;

  @override
  void paint(Canvas canvas, Size size) {
    // create outer rectangle equals size
    Rect outerRect = Offset.zero & size;
    var outerRRect =
        RRect.fromRectAndRadius(outerRect, Radius.circular(radius));

    // create inner rectangle smaller by strokeWidth
    Rect innerRect = Rect.fromLTWH(strokeWidth, strokeWidth,
        size.width - strokeWidth * 2, size.height - strokeWidth * 2);
    var innerRRect = RRect.fromRectAndRadius(
        innerRect, Radius.circular(radius - strokeWidth));

    // apply gradient shader
    _paint.shader = gradient.createShader(outerRect);

    // create difference between outer and inner paths and draw it
    Path path1 = Path()..addRRect(outerRRect);
    Path path2 = Path()..addRRect(innerRRect);
    var path = Path.combine(PathOperation.difference, path1, path2);
    canvas.drawPath(path, _paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => oldDelegate != this;
}
