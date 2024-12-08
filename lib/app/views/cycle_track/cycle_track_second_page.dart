import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';

import '../../../constants/images_url.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';
import '../../viewmodels/post_login/cycle_track_controller.dart';
import '../health_query/help_weight_health_query/help_weight_health_query.dart';

class CycleTrackSecondPage extends StatefulWidget {
  const CycleTrackSecondPage({super.key});

  @override
  State<CycleTrackSecondPage> createState() => _CycleTrackSecondPageState();
}

class _CycleTrackSecondPageState extends State<CycleTrackSecondPage> {
  CycleTrackController controller = Get.put(CycleTrackController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
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
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 3),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            ImagesUrl.backwardIcon,
                            color: AppColors.mainColor,
                          )),
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      ImagesUrl.cycleTrackSecondImages,
                      height: 160,
                      width: 235,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: HelperWidget().testMethodStartAlign(
                          18.0,
                          FontWeight.w500,
                          Colors.black,
                          "Menstrual cycle tracking data")),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, bottom: 8),
                    child: HelperWidget().testMethodStartAlign(
                        13.0,
                        FontWeight.w400,
                        AppColors.colorPrimaryTestDarkMore,
                        "Cycle length"),
                  ),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                items: controller.periodsCycleLengthA
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: w400_14Poppins(
                                              color:
                                                  AppColors.textColorCycleInfo,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: controller.periodsCycleLength.toString(),
                                onChanged: (String? value) {
                                  controller.periodsCycleLength.value = value!;
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 30.h,
                                  width: 80.w,
                                  padding:
                                      EdgeInsets.only(left: 14.w, right: 1.4.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData: IconStyleData(
                                  icon: SvgPicture.asset(ImagesUrl.downArrow),
                                  iconSize: 13,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 240.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.white,
                                  ),
                                  offset: const Offset(0, 0),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: Radius.circular(5.r),
                                    thickness:
                                        MaterialStateProperty.all<double>(3),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: MenuItemStyleData(
                                  height: 40.h,
                                  padding:
                                      EdgeInsets.only(left: 14.w, right: 14.w),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                            color: AppColors.mainColor.withOpacity(0.1),
                          ),
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: 40,
                          child: const Center(child: Text("Days")),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: HelperWidget().testMethodStartAlign(
                        12.0,
                        FontWeight.w400,
                        AppColors.colorPrimaryTestDarkMore,
                        "Period length"),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    height: 44,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                items: controller.dayOfPeriodsA
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: w400_14Poppins(
                                              color:
                                                  AppColors.textColorCycleInfo,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: controller.dayOfPeriods.toString(),
                                onChanged: (String? value) {
                                  controller.dayOfPeriods.value = value!;
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 30.h,
                                  width: 80.w,
                                  padding:
                                      EdgeInsets.only(left: 14.w, right: 14.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData: IconStyleData(
                                  icon: SvgPicture.asset(ImagesUrl.downArrow),
                                  iconSize: 13,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 220.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5.r),
                                    color: Colors.white,
                                  ),
                                  offset: const Offset(0, 0),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: Radius.circular(5.r),
                                    thickness:
                                        MaterialStateProperty.all<double>(3),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: MenuItemStyleData(
                                  height: 40.h,
                                  padding:
                                      EdgeInsets.only(left: 14.w, right: 14.w),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(6),
                                bottomRight: Radius.circular(6)),
                            color: AppColors.mainColor.withOpacity(0.1),
                          ),
                          width: MediaQuery.of(context).size.width * 0.18,
                          height: 40,
                          child: const Center(child: Text("Days")),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.menstrualFastScreen);
                    },
                    child: (HelpWeightHealthQuery()
                        .nextContainer(buttonColor: true)),
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
