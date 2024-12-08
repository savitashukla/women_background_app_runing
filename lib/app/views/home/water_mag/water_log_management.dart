import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/views/home/water_mag/water_help_widget/walet_help_widget.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/utils/helper_widgets/custome_button.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/helper_widgets/water_reminder_common.dart';

import '../../../../constants/app_colors.dart';
import '../../../../constants/images_url.dart';
import '../../../viewmodels/home_controller/water_log_management.dart';

class WaterLogManagement extends StatelessWidget {
  WaterLogManagement({super.key});

  WaterLogManagementController waterLogManagement =
      Get.put(WaterLogManagementController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 18.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: SvgPicture.asset(
                          ImagesUrl.backArrowIcon,
                          color: AppColors.blackColor,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      HelperWidget().testMethodStartAlign(16.0, FontWeight.w500,
                          AppColors.textColorCycleInfo, "Water Log Management")
                    ],
                  ),
                  SizedBox(
                    height: 13.h,
                  ),
                  Container(
                    height: 55.h,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.whiteColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.textColorCycleInfo,
                            "Water Log Management"),
                        Container(
                          height: 45,
                          width: 90,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.containerBorderC, width: 1),
                          ),
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                items: waterLogManagement
                                    .waterInTakeVolume.value
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.textColorCycleInfo,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: waterLogManagement
                                    .selectedWaterInTakeVolume.value,
                                onChanged: (String? value) {
                                  waterLogManagement
                                      .selectedWaterInTakeVolume.value = value!;
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: 160,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData: IconStyleData(
                                  icon: SvgPicture.asset(
                                    ImagesUrl.downArrow,
                                    color: AppColors.mainColor,
                                  ),
                                  iconSize: 13,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(3),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 55.h,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.whiteColor),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.textColorCycleInfo,
                            "Water Container Volume"),
                        Container(
                          height: 40,
                          width: 110,
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: AppColors.containerBorderC, width: 1),
                          ),
                          child: Obx(
                            () => DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                items: waterLogManagement.waterContainerVolume
                                    .map((String item) =>
                                        DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(
                                            item,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                                  AppColors.textColorCycleInfo,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ))
                                    .toList(),
                                value: waterLogManagement
                                    .selectedWaterContainerVolume.value,
                                onChanged: (String? value) {
                                  waterLogManagement
                                      .selectedWaterContainerVolume
                                      .value = value!;
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: 50,
                                  width: 160,
                                  padding: const EdgeInsets.only(
                                      left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData: IconStyleData(
                                  icon: SvgPicture.asset(
                                    ImagesUrl.downArrow,
                                    color: AppColors.mainColor,
                                  ),
                                  iconSize: 13,
                                ),
                                dropdownStyleData: DropdownStyleData(
                                  maxHeight: 200,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: Colors.white,
                                  ),
                                  scrollbarTheme: ScrollbarThemeData(
                                    radius: const Radius.circular(40),
                                    thickness:
                                        MaterialStateProperty.all<double>(3),
                                    thumbVisibility:
                                        MaterialStateProperty.all<bool>(true),
                                  ),
                                ),
                                menuItemStyleData: const MenuItemStyleData(
                                  height: 40,
                                  padding: EdgeInsets.only(left: 14, right: 14),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    height: 55.h,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.whiteColor),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.textColorCycleInfo,
                            "Water Analysis"),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.waterAnalytics);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5.0),
                            child: SvgPicture.asset(
                              ImagesUrl.rightBack,
                              color: AppColors.colorPrimary,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  const WaterReminderCommonWidget(),
                  SizedBox(
                    height: 28.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CustomButton(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.25,
                          buttonText: "Cancel",
                          buttonColor: AppColors.whiteColor,
                          borderColor: AppColors.mainColor,
                          textColor: AppColors.mainColor,
                        ),
                      ),
                      width20,
                      GestureDetector(
                          onTap: () {
                            waterLogManagement.autoOnToggleWaterReminder.value =
                                true;

                            Navigator.pop(context);
                          },
                          child: CustomButton(
                            width: MediaQuery.of(context).size.width * 0.25,
                            height: MediaQuery.of(context).size.height * 0.05,
                            buttonText: "Save",
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
