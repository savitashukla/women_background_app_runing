import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/home_controller/water_log_management.dart';
import 'package:o_woman/app/views/home/water_mag/water_help_widget/walet_help_widget.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class WaterReminderCommonWidget extends StatefulWidget {
  const WaterReminderCommonWidget({super.key});

  @override
  State<WaterReminderCommonWidget> createState() =>
      _WaterReminderCommonWidgetState();
}

class _WaterReminderCommonWidgetState extends State<WaterReminderCommonWidget> {
  WaterLogManagementController waterLogManagement =
      Get.put(WaterLogManagementController());
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
              HelperWidget().testMethodStartAlign(18.0, FontWeight.w500,
                  AppColors.textColorCycleInfo, "Water Intake"),

              //TODO :Put Switch widget instead of switch image.
              Obx(() => 
              CustomSwitch(
                  initialValue:
                      waterLogManagement.autoOnToggleWaterReminder.value,
                  onChanged: (value) {
                    if (value) {
                      WaterHelpWidget()
                          .waterReminder(context, waterLogManagement);
                    } else {
                      waterLogManagement.autoOnToggleWaterReminder.value =
                          false;
                    }
                  })
                  )
            ],
          ),
          Obx(() => waterLogManagement.autoOnToggleWaterReminder.value
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Column(
                    children: [
                      Divider(
                          color: AppColors.textColorCycleInfoMore
                              .withOpacity(0.1)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // const Image(
                          //   image: AssetImage(ImagesUrl.glassSmall),
                          //   height: 24,
                          //   width: 16,
                          // ),
                          // const SizedBox(
                          //   width: 20,
                          // ),
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: 'Start time\n',
                                style: w400_16Poppins(
                                    color: AppColors.textColorCycleInfoMore),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${waterLogManagement.durationStartHours.value}:${waterLogManagement.durationStartMinutes.value}  ",
                                      style: w400_16Poppins(
                                          color: AppColors.textColorQus)),
                                ],
                              ),
                            ),
                          ),
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: 'End time\n',
                                style: w400_16Poppins(
                                    color: AppColors.textColorCycleInfoMore),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${waterLogManagement.durationEndHours.value}:${waterLogManagement.durationEndMinutes.value} ",
                                      style: w400_16Poppins(
                                          color: AppColors.textColorQus)),
                                ],
                              ),
                            ),
                          ),
                          Obx(
                            () => RichText(
                              text: TextSpan(
                                text: 'Interval\n',
                                style: w400_16Poppins(
                                    color: AppColors.textColorCycleInfoMore),
                                children: <TextSpan>[
                                  TextSpan(
                                      text:
                                          "${waterLogManagement.selectedIntervalTimeWater.value} ",
                                      style: w400_16Poppins(
                                          color: AppColors.textColorQus)),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      height10,
                      GestureDetector(
                        onTap: () {
                          WaterHelpWidget()
                              .waterReminder(context, waterLogManagement);
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
