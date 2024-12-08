import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class OneDayDailyTrip extends StatelessWidget {
  const OneDayDailyTrip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:100.h ,
      padding: EdgeInsets.only(
          left: 15.w, top: 0, bottom: 00, right: 15.w),
      margin: const EdgeInsets.only(right: 0),
      width: MediaQuery.of(context).size.width,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.w, bottom: 0, top: 0,right: 5.w),
                  child:     HelperWidget().testMethodStartAlign(
                      12.0,
                      FontWeight.w400,
                      AppColors.dailyTipTextC,
                      "Practice meditation or deep breathing to manage stress and promote relaxation.")
                ),
              ),
              Expanded(
                flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 00.h, right: 1.w, bottom: 0, left: 0),
                    child: Stack(
                      children: [

                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.start,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                bottom: 0.0.sp,
                              ),
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 10,
                                    bottom: 0,
                                    right: 30),
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
                                  color: AppColors.buttonColorDaily,
                                ),
                                height: 55,
                                width: 220,
                              ),
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          crossAxisAlignment:
                          CrossAxisAlignment.
                          end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 25, bottom: 15),
                              child: Container(
                                decoration: const BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.buttonColorDaily,
                                        blurRadius: 5,
                                        spreadRadius: 10,
                                        offset:
                                        Offset(-2, -3))
                                  ],
                                  borderRadius:
                                  BorderRadius.only(
                                    topRight: Radius.circular(0),
                                    topLeft: Radius.circular(0),
                                    bottomRight:
                                    Radius.circular(0),
                                    bottomLeft:
                                    Radius.circular(0),
                                  ),
                                ),
                                height: 10,
                                width: 50,
                              ),
                            )
                          ],
                        ),

                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.end,
                          crossAxisAlignment:
                          CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                  left:70,
                                  bottom: 0,

                                  right:10),
                              decoration: const BoxDecoration(
                                borderRadius:
                                BorderRadius.only(
                                  topRight:
                                  Radius.circular(130),
                                  bottomLeft: Radius.circular(150),

                                  bottomRight:
                                  Radius.circular(130),
                                ),
                                color: AppColors.buttonColorDaily,
                              ),
                              height: 40,
                              width: 210,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20.0.w),
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
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
