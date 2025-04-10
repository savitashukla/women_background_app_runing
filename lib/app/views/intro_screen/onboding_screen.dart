import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/font_size.dart';
import '../../../utils/hive_helper.dart';
import '../home/circle_paint/const/size_const.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  Future<bool> onWillPop() {
    return Future.value(false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0, right: 30, left: 30),
              child: Image.asset(ImagesUrl.onboardScreenImgSec),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Center(
                child: RichText(
                  text: TextSpan(
                    text: 'Welcome!\n',
                    style: w600_24Poppins(color: AppColors.textColorCycleInfo),
                    children: <TextSpan>[
                      TextSpan(
                        text:
                            "Embark on your Reproduction health journey with us",
                        style: w500_20Poppins(
                            color: AppColors.textColorCycleInfoMore),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            height20,
            height5,
            GestureDetector(
              onTap: () {
                HiveHelper.insertData("today_date", "${DateTime.now()}");

                Navigator.pushNamed(context, Routes.dashBoard);
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xffBF9299).withOpacity(0.5),
                          blurRadius: 30,
                          spreadRadius: 1,
                          offset: const Offset(0, 15))
                    ],
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(22.r)),
                child: Center(
                    child: Text(
                  "Get Started",
                  style: w500_18Poppins(color: AppColors.whiteColor),
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
