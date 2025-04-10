import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/views/user_profile/settings/sleep_reminder/sleep_cycle_show.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/font_size.dart';
import '../../../../../constants/images_url.dart';

class SleepReminderBottomS {
  ValueNotifier<double> cycleLength = ValueNotifier(60);

  Rx<ui.Image?> startImage = Rx<ui.Image?>(null);
  Rx<ui.Image?> endImage = Rx<ui.Image?>(null);
  //ui.Image? endImage;

  Future<void> loadImages() async {
    ByteData startImageData = await rootBundle.load(ImagesUrl.sleepWhite);
    Uint8List startImageList = startImageData.buffer.asUint8List();
    startImage.value = await decodeImageFromList(startImageList);

    ByteData endImageData = await rootBundle.load(ImagesUrl.notificationPng);
    Uint8List endImageList = endImageData.buffer.asUint8List();
   endImage.value = await decodeImageFromList(endImageList);

// Refresh the UI after loading images
  }

  void setSleepReminderBottomSheet(BuildContext context) {
    loadImages();
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 15,
                    right: 15),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.colorPrimary,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    HelperWidget().centerWidget(),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                      height: 250.h,
                      width: MediaQuery.of(context).size.width - 10,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child: SizedBox(
                                height: 250.h,
                                width: 250.w,
                                child: Obx(
                          ()=> SimpleCircularProgressBarReminder(
                                size: 220.sp,
                                maxValue: 110.sp,

                                valueNotifier: cycleLength,
                                progressColors: const [
                                  AppColors.avgCycleDayProgressBarFull2
                                ],
                                backColor: AppColors.avgCycleDayProgressBarEmpty2,
                                fullProgressColor:
                                    AppColors.avgCycleDayProgressBarFull2,
                                mergeMode: true,
                                startImage: startImage.value!,
                                endImage:  endImage.value!,
                              ),
                            ),
                          ),)
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.homePageBottomColorLine
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(5.r)),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10.w),
                              decoration: BoxDecoration(
                                color: AppColors.maroonColor.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.sp),
                                child: SvgPicture.asset(
                                  ImagesUrl.sleepTimeIcon,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("My sleep time",
                                    style: w500_14Poppins(
                                      color: AppColors.textColorCycleInfo,
                                    )),
                                Text("3:00 Am",
                                    style: w500_14Poppins(
                                      color: AppColors.textColorCycleInfo,
                                    ))
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Container(

                      decoration: BoxDecoration(
                          color: AppColors.homePageBottomColorLine
                              .withOpacity(0.1),borderRadius: BorderRadius.circular(5.r)),
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width,
                      child: Padding(
                        padding: EdgeInsets.all(8.0.sp),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.maroonColor.withOpacity(0.15),
                                shape: BoxShape.circle,
                              ),
                              margin: EdgeInsets.only(right: 10.w),
                              child: Padding(
                                padding: EdgeInsets.all(8.0.sp),
                                child: SvgPicture.asset(
                                  ImagesUrl.notificationRed,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("My wakeup time",
                                    style: w500_14Poppins(
                                      color: AppColors.textColorCycleInfo,
                                    )),
                                Text("7:20 Am",
                                    style: w500_14Poppins(
                                      color: AppColors.textColorCycleInfo,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SizedBox(
                      //  color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      height: 59,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 37,
                              width: 115,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: AppColors.colorPrimary, width: 2),
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: HelperWidget().testMethod(
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.colorPrimary,
                                    "Cancel"),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 25,
                          ),
                          Container(
                            height: 37,
                            width: 115,
                            decoration: BoxDecoration(
                                color: AppColors.colorPrimary,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: HelperWidget().testMethod(
                                  14.0, FontWeight.w500, Colors.white, "Save"),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }
}
