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

class DataBackupScreen extends StatefulWidget {
  const DataBackupScreen({super.key});

  @override
  State<DataBackupScreen> createState() => _DataBackupScreenState();
}

class _DataBackupScreenState extends State<DataBackupScreen> {
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
                padding:  EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Data Backup",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding:  EdgeInsets.all(12.0.sp),
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
                  padding:  EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Last Backup",
                              style: w400_14Poppins(),
                            ),
                            Text(
                              "Backup your data to O-Drive. You can retrieve the data when you needed.",
                              style: w400_10Poppins(),
                            ),
                          ],
                        ),
                      ),
                      CustomSwitch(
                        onChanged: (value) {
                          settingsScreenController.lastBackupToggle.value=!settingsScreenController.lastBackupToggle.value;
                        },
                        initialValue:
                            settingsScreenController.lastBackupToggle.value,
                      )
                     
                    ],
                  ),
                ),
              ),
              height10,
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "End-to-end Encryption",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                        onChanged: (value) {settingsScreenController.endToEndToggle.value=!
                        settingsScreenController.endToEndToggle.value;},
                        initialValue:
                            settingsScreenController.endToEndToggle.value,
                      )
                    ],
                  ),
                ),
              ),
              height20,
              Padding(
                padding:  EdgeInsets.all(5.0.sp),
                child: Text(
                  "O-Drive Backup",
                  style: w400_14Poppins(),
                ),
              ),
              height5,
              Container(
                // height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "OMail account",
                        style: w400_14Poppins(),
                      ),
                      Text(
                        "abc@omail.com",
                        style: w400_10Poppins(),
                      )
                    ],
                  ),
                ),
              ),
              height10,
              Container(
                height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding:  EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Backup using cellular",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                        onChanged: (value) {
                          settingsScreenController.backupCellularToggle.value=!
                          settingsScreenController.backupCellularToggle.value;
                        },
                        initialValue:
                            settingsScreenController.backupCellularToggle.value,
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
