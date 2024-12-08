import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/home_controller/water_log_management.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/app/views/home/water_mag/water_help_widget/walet_help_widget.dart';
import 'package:o_woman/app/views/user_profile/settings/sleep_reminder/sleep_reminder_bottom_sheet.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class SleepReminderCommonWidget extends StatefulWidget {
  String? text;
  SleepReminderCommonWidget({super.key, this.text});

  @override
  State<SleepReminderCommonWidget> createState() =>
      _SleepReminderCommonWidgetState();
}

class _SleepReminderCommonWidgetState extends State<SleepReminderCommonWidget> {
  WaterLogManagementController waterLogManagement =
      Get.put(WaterLogManagementController());
  SettingsScreenController settingsScreenController =
      Get.put(SettingsScreenController());
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: !waterLogManagement.autoOnToggleWaterReminder.value ? 57 : 110,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5), color: AppColors.whiteColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HelperWidget().testMethodStartAlign(
                  18.0,
                  FontWeight.w500,
                  AppColors.textColorCycleInfo,
                  widget.text ?? "Sleep Reminder"),

              //TODO :Put Switch widget instead of switch image.
            
              CustomSwitch(
                  initialValue:
                      settingsScreenController.sleepReminderToggle.value,
                  onChanged: (value) {
                    if (value) {
                      settingsScreenController.sleepReminderToggle.value = true;
                      SleepReminderBottomS()
                          .setSleepReminderBottomSheet(context);
                    } else {
                      settingsScreenController.sleepReminderToggle.value =
                          false;
                    }
                  })
            ],
          ),
          Obx(() => settingsScreenController.sleepReminderToggle.value
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                          color: AppColors.textColorCycleInfoMore
                              .withOpacity(0.1)),
                      height10,
                      Row(
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
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: 'My sleep time\n',
                                style: w400_16Poppins(
                                    color: AppColors.textColorQus),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${waterLogManagement.durationStartHours.value}:${waterLogManagement.durationStartMinutes.value}  ",
                                      style: w400_16Poppins(
                                          color: AppColors
                                              .textColorCycleInfoMore)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      height15,
                      Row(
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
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: 'My wakeup time\n',
                                style: w400_16Poppins(
                                    color: AppColors.textColorQus),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${waterLogManagement.durationEndHours.value}:${waterLogManagement.durationEndMinutes.value} ",
                                      style: w400_16Poppins(
                                          color: AppColors
                                              .textColorCycleInfoMore)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      height10,
                      GestureDetector(
                        onTap: () {
                          SleepReminderBottomS()
                              .setSleepReminderBottomSheet(context);
                        },
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: SizedBox(
                              width: 120.w,
                              // color: AppColors.addIconColor,
                              child: Padding(
                                padding: EdgeInsets.all(5.0.sp),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(ImagesUrl.timerIcon),
                                    width10,
                                    Text(
                                      "Set Time",
                                      style: w400_16Poppins(
                                        color: AppColors.mainColor,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ),
                      )
                    ],
                  ),
                )
              : const SizedBox(
                  height: 0,
                )),
        ],
      ),
    );
  }
}
