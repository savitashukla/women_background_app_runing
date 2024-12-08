import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/post_login/cycle_track_controller.dart';
import 'package:o_woman/app/views/cycle_track/calendar/cycle_calendar.dart';
import 'package:o_woman/constants/app_colors.dart';

import '../../../constants/images_url.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';
import '../health_query/help_weight_health_query/help_weight_health_query.dart';

class CycleTrackFastScreen extends StatefulWidget {
  const CycleTrackFastScreen({super.key});

  @override
  State<CycleTrackFastScreen> createState() => _CycleTrackFastScreenState();
}

class _CycleTrackFastScreenState extends State<CycleTrackFastScreen> {
  CycleTrackController cycleTrackController = Get.put(CycleTrackController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: true,
      right: true,
      child: Scaffold(
        backgroundColor: AppColors.colorGrayDarkBg,
        body: Padding(
          padding: EdgeInsets.only(right: 8.w, left: 8.w, top: 8.h),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0.sp),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            ImagesUrl.backwardIcon,
                            color: AppColors.mainColor,
                          )),
                    ),
                  ),
                  // SvgPicture.asset(ImagesUrl.lastPeriodImage),
                  Center(
                    child: Image.asset(
                      ImagesUrl.cycleTrackCalendar,
                      height: 185.h,
                      width: 260.w,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: HelperWidget().testMethodStartAlign(
                        16.0,
                        FontWeight.w500,
                        Colors.black,
                        "When did your last period start?"),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w400,
                        AppColors.colorGrayCycleTrack,
                        "For getting more information fill your last three cycle data"),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: CycleTrackCalendar(),
                  ),
                  SizedBox(
                    height: 55.h,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 5.h),
                    decoration: const BoxDecoration(
                        color: AppColors.homeBgColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: GestureDetector(
                      onTap: () {


                        cycleTrackController.isDateBelongsToTwoMonths(context);

/*
                        Set<int> mapData = {};
                        var checkTrue = false;
                        cycleTrackController.checkBoxValues
                            .forEach((key, value) {
                              if(value==true)
                                {
                            cycleTrackController.isDateBelongsToTwoMonths(
                                key, mapData);
                            *//*    cycleTrackController.checkDateBelongsMonth(
                                      key, mapData);*//*

                            if (mapData.isNotEmpty) {
                              checkTrue = true;
                            }
                          }
                        });

                        if (checkTrue) {
                          Navigator.pushNamed(
                              context, Routes.cycleTrackSecondPage);
                        } else {
                          HelperWidget()
                              .flutterCustomToast("Select 2 Month Date");
                        }*/
                      },
                      child: Center(
                          child: Obx(
                        () => HelpWeightHealthQuery().nextContainer(
                            buttonColor: cycleTrackController
                                        .checkBoxValues.value.isNotEmpty &&
                                    cycleTrackController.checkBoxValues
                                        .containsValue(true)
                                ? true
                                : false),
                      )),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
