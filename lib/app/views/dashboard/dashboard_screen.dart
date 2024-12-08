import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/community/community_welcome.dart';
import 'package:o_woman/app/views/dashboard/bottom_bar.dart';
import 'package:o_woman/app/views/dashboard/second_app_bar.dart';
import 'package:o_woman/app/views/home/home_second.dart';
import 'package:o_woman/app/views/new_calandar/new_calander.dart';

import '../../../constants/app_colors.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../viewmodels/dashboard_controller.dart';
import '../analytics/analytics_screen.dart';
import '../community/community_home.dart';
import '../community/insight_home_screen.dart';
import '../home/circle_paint/const/size_const.dart';
import '../user_profile/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  DashboardController dashboardController = Get.put(DashboardController());
  DateTime? currentBackPressTime;

  final List<Widget> _children = [
    const HomePageSecond(),
    NewCalander(),
    const AnalyticsScreen(),
    InsightHomePage(),
    //CommunityWelcome(),
     CommunityWelcome(),
    const CommunityHomeScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //  _children = [const SafetyScreen()];
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil.getInstance()?.logicSize = MediaQuery.of(context).size;

    SizeUtil.initDesignSize();
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: AppColors.colorAccent,
      ),
      child: WillPopScope(
        onWillPop: () async {


          if (dashboardController.currentIndex.value == 0) {
            DateTime now = DateTime.now();
            if (currentBackPressTime == null ||
                now.difference(currentBackPressTime!) >
                    const Duration(seconds: 1)) {
              currentBackPressTime = now;
              HelperWidget().flutterCustomToast("back again to exit");
              return Future.value(false);
            }
            return Future.value(true);
          } else if (dashboardController.currentIndex.value == 1) {
            dashboardController.currentIndex.value = 0;
            return false;
          } else if (dashboardController.currentIndex.value == 2) {
            dashboardController.currentIndex.value = 0;
            return false;
          } else if (dashboardController.currentIndex.value == 3) {
            dashboardController.currentIndex.value = 0;
            return false;
          } else if (dashboardController.currentIndex.value == 4) {
            dashboardController.currentIndex.value = 0;
            return false;
          } else {
            return false;
          }
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.homeBgColor,
            resizeToAvoidBottomInset: false,
            // backgroundColor: AppColors.colorSecondary,
            drawer:  ProfileScreen(),

            body: Stack(
              children: [

                Padding(
                  padding:  EdgeInsets.only(top:52.0.h,bottom: 53.h),
                  child: Obx(() => _children[dashboardController.currentIndex.value]),
                ),
                Padding(
                  padding:  EdgeInsets.only(top: 00.h),
                  child: Obx(
                    ()=>  dashboardController.currentIndex.value == 4?const IgnorePointer(): Container(
                      height: 52.h,
                      color: Colors.transparent,
                      child: ClipRRect(
                        child: Container(
                          height: 55.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0),
                                color: AppColors.appBarColor1,
                            ),
                          child: BackdropFilter(

                            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY:52.0),
                            child: AppBarSec().appBarSecondMethod(context),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: const Color(0xffBF9299)
                                  .withOpacity(0.3),
                              blurRadius: 30,

                              spreadRadius: 0,
                              offset: const Offset(0, 15))
                        ],
                        color: AppColors.whiteColor,

                      ),
                      width: MediaQuery.of(context).size.width,
                  height: 53.h,

                  child: BottomBar(),
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
