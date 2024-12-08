import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  SettingsScreenController settingsScreenController =
      Get.put(SettingsScreenController());
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
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Date & Time",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Automatic date & time",
                              style: w400_14Poppins(),
                            ),
                            Text(
                              "Use the date & time provided by your network.",
                              style: w400_10Poppins(),
                            ),
                          ],
                        ),
                      ),
                      CustomSwitch(
                        onChanged: (value) {
                          settingsScreenController
                            .automaticDatetimeToggle.value=!
                            settingsScreenController
                            .automaticDatetimeToggle.value;
                        },
                        initialValue: settingsScreenController
                            .automaticDatetimeToggle.value,
                      )
                    ],
                  ),
                ),
              ),
              height10,
              Container(
                // height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Use 24-hour format",
                              style: w400_14Poppins(),
                            ),
                            Text(
                              "11:00 AM",
                              style: w400_10Poppins(),
                            ),
                          ],
                        ),
                      ),
                      CustomSwitch(
                        onChanged: (value) { settingsScreenController.useFormatToggle.value=!
                         settingsScreenController.useFormatToggle.value;},
                        initialValue:
                            settingsScreenController.useFormatToggle.value,
                      )
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
