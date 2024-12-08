import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/constants/app_colors.dart';

import '../../viewmodels/dashboard_controller.dart';

class CommunityWelcome extends StatelessWidget {
   CommunityWelcome({super.key});


  DashboardController controllerDashBoard = Get.find();

  @override
  Widget build(BuildContext context) {
    SizeUtil.getInstance()?.logicSize = MediaQuery.of(context).size;

    SizeUtil.initDesignSize();
    return SafeArea(
        child: Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          Center(
            child: SvgPicture.asset(
              "assets/images/com_wel.svg",
            ),
          ),
          SizedBox(
            height: 30.h,
          ),
          const Center(
              child: Text(
            "Welcome...!",
            style: TextStyle(
              letterSpacing: 1.5,
              color: AppColors.colorPrimaryTestDarkMore,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          )),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Continue with your",
                style: TextStyle(
                  color: AppColors.colorPrimaryTestDarkMore,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              GestureDetector(
                onTap: () {

                  controllerDashBoard.currentIndex.value =5;
            //      Navigator.pushNamed(context, Routes.communityHomeScreen);
                },
                child: const Text(
                  "  OWOMEN",
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const Text(
                " account",
                style: TextStyle(
                  color: AppColors.colorPrimaryTestDarkMore,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15.h,
          ),
          const Center(
            child: Text(
              "OR",
              style: TextStyle(
                color: AppColors.colorPrimaryTestDarkMore,
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.communityEditProfile);
              },
              child: const Text(
                "Create new",
                style: TextStyle(
                  color: AppColors.mainColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
