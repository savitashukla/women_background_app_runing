import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

class HealthTrackingScreen extends StatefulWidget {
  const HealthTrackingScreen({super.key});

  @override
  State<HealthTrackingScreen> createState() => _HealthTrackingScreenState();
}

class _HealthTrackingScreenState extends State<HealthTrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        appBar: AppBar(
          centerTitle: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding:  EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Health Tracking Screen",
            style: w500_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Cycle Tracking",
                style: w500_14Poppins(),
              ),
              height10,
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.whiteColor),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My cycle usually last",
                        style: w400_14Poppins(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            ImagesUrl.backwardIcon,
                            color: AppColors.mainColor,
                          ),
                          width15,
                          Container(
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.colorGray),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 2.h),
                              child: Text(
                                "29 Days",
                                style: w400_12Poppins(),
                              ),
                            ),
                          ),
                          width15,
                          SvgPicture.asset(
                            ImagesUrl.forwardIcon,
                            color: AppColors.mainColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              height10,
              Container(
                height: MediaQuery.of(context).size.height * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5.r),
                    color: AppColors.whiteColor),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "My period usually last",
                        style: w400_14Poppins(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            ImagesUrl.backwardIcon,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.21,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.colorGray),
                                borderRadius: BorderRadius.circular(5.r)),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 2.h),
                              child: Text(
                                "5 Days",
                                style: w400_12Poppins(),
                              ),
                            ),
                          ),
                          width15,
                          SvgPicture.asset(
                            ImagesUrl.forwardIcon,
                            color: AppColors.mainColor,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              height15,
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.whiteColor),
                child: Padding(
                  padding:  EdgeInsets.all(15.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Pregnancy tracking",
                            style: w400_16Poppins(),
                          ),
                          height10,
                          Lottie.asset(ImagesUrl.comingSoonImg, height: 100.h)
                        ],
                      ),
                      SvgPicture.asset(ImagesUrl.pregnancyTrackingIcon)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
