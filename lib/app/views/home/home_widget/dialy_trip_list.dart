import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/images_url.dart';
import '../../../../utils/helper_widgets/helper_widgets.dart';
import '../../../viewmodels/home_controller/home_page_controller.dart';
import '../info_about_cycle.dart';

class DailyTrip extends StatefulWidget {
  DailyTrip({super.key});

  @override
  State<DailyTrip> createState() => _DailyTripState();
}

class _DailyTripState extends State<DailyTrip> {
  late FixedExtentScrollController _scrollController;

  HomePageController homePageController = Get.find();
  var indexIntValues=0;
  bool varUpDate=false;
var offceT;
  @override
  void initState() {
    super.initState();
    _scrollController = FixedExtentScrollController();
    _scrollController.addListener(() {

      print("fcsfcdksdjhvc");

      if(indexIntValues==9)
        {
          indexIntValues=0;
        }

    });
   /* WidgetsBinding.instance!.addPostFrameCallback((_) {
      print("Jumping to item 5");
      _scrollController.animateToItem(5,
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      child: RotatedBox(
        quarterTurns: -1,
        child: ListWheelScrollView(
          itemExtent: MediaQuery.of(context).size.width - 80,
          // this is use for item between dis
          diameterRatio: 1.6,
          controller: _scrollController,
          // this is use for second item down
          offAxisFraction: 0.1,
          // Add other properties as needed
          clipBehavior: Clip.antiAlias,
          squeeze: 1.1,
          onSelectedItemChanged: (index) {
            // Handle selected item change
            print("Selected item: $index");

            indexIntValues = index;
            varUpDate = true;
            //    _scrollController.jumpToItem(index);
            WidgetsBinding.instance!.addPostFrameCallback((_) {
              print("Jumping to item 5");
              _scrollController.animateToItem(indexIntValues,
                  duration: const Duration(milliseconds: 50), curve: Curves.easeInOut);
            });
          },
          children: List.generate(10, (index) {
            print("calll hear scrollEndNotification$index");
            return Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onHorizontalDragUpdate: (details) {
                    print("onHorizontalDragUpdate");
                  },
                  onHorizontalDragDown: (details) {
                    print("details $details");
                    if (varUpDate) {
                      varUpDate = false;
                    }
                    if (varUpDate) {
                    } else {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        print("Jumping to item 5");
                        _scrollController.animateToItem(indexIntValues + 1,
                            duration: const Duration(seconds: 1),
                            curve: Curves.easeInOut);
                      });
                    }
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.width - 80,
                    padding: EdgeInsets.only(
                        left: 10.h, top: 0, bottom: 00, right: 0),
                    margin: const EdgeInsets.only(right: 0),
                    width: 110.h,
                    child: Card(
                      elevation: 5.0,
                      color: AppColors.whiteColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0.r),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.whiteColor,
                          borderRadius: BorderRadius.circular(20.0.r),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: 5.h, bottom: 0, top: 0),
                                child: Transform(
                                  alignment: Alignment.center,
                                  transform: Matrix4.rotationZ(
                                    3.1415926535897932 / 2,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      HelperWidget().testMethodStartAlign(
                                          12.0,
                                          FontWeight.w500,
                                          AppColors.colorPrimaryTestDarkMore,
                                          "Live the actual OWOMEN"),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      HelperWidget().testMethodStartAlign(
                                          12.0,
                                          FontWeight.w400,
                                          AppColors.dailyTipTextC,
                                          "Only This Actual Moment Is LIFE")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: EdgeInsets.only(
                                  top: 20.h, right: 1.w, bottom: 0, left: 0),
                              child: Transform(
                                alignment: Alignment.center,
                                transform: Matrix4.rotationZ(
                                  3.1415926535897932 / 2,
                                ),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 6.0.sp,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Opacity(
                                            opacity: 0.1,
                                            child: Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10,
                                                  bottom: 0,
                                                  right: 20),
                                              decoration: const BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.only(
                                                  topRight:
                                                      Radius.circular(0),
                                                  bottomLeft:
                                                      Radius.circular(100),
                                                  bottomRight:
                                                      Radius.circular(100),
                                                ),
                                                color: AppColors.buttonColor,
                                              ),
                                              height: 55,
                                              width: 210,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 8.0.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 0,
                                                bottom: 15.h,
                                                top: 0.h),
                                            child: SvgPicture.asset(
                                                ImagesUrl.girlsForDailyTri),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, bottom: 15),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: AppColors
                                                        .buttonColor
                                                        .withOpacity(0.7),
                                                    blurRadius: 30,
                                                    spreadRadius: 5,
                                                    offset:
                                                        const Offset(0, -4))
                                              ],
                                              borderRadius:
                                                  const BorderRadius.only(
                                                topRight: Radius.circular(50),
                                                topLeft: Radius.circular(50),
                                                bottomRight:
                                                    Radius.circular(50),
                                                bottomLeft:
                                                    Radius.circular(50),
                                              ),
                                            ),
                                            height: 10,
                                            width: 100,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
