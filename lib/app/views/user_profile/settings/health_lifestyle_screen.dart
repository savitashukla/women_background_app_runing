import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/app/views/home/water_mag/water_help_widget/walet_help_widget.dart';
import 'package:o_woman/app/views/user_profile/settings/sleep_reminder/sleep_reminder_bottom_sheet.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/sleep_reminder_common.dart';
import 'package:o_woman/utils/helper_widgets/water_reminder_common.dart';

import '../../../viewmodels/home_controller/water_log_management.dart';

class HealthLifestyleScreen extends StatefulWidget {
  const HealthLifestyleScreen({super.key});

  @override
  State<HealthLifestyleScreen> createState() => _HealthLifestyleScreenState();
}

class _HealthLifestyleScreenState extends State<HealthLifestyleScreen> {
  SettingsScreenController settingsScreenController =
      Get.put(SettingsScreenController());
  WaterLogManagementController waterLogManagement =
      Get.put(WaterLogManagementController());
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
                padding: EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Health & Lifestyle",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            children: [
              const WaterReminderCommonWidget(),
              height10,
              SleepReminderCommonWidget(),
              height10,
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Pill Reminder",
                        style: w400_14Poppins(),
                      ),
                      InkWell(
                        onTap: () {
                          settingsScreenController.pillReminderToggle.value =
                              !settingsScreenController
                                  .pillReminderToggle.value;
                        },
                        child: settingsScreenController.pillReminderToggle.value
                            ? Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 36.sp,
                                color: AppColors.mainColor,
                              )
                            : Icon(
                                Icons.keyboard_arrow_up_rounded,
                                size: 36.sp,
                                color: AppColors.mainColor,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
