import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class PrivacySecurityScreen extends StatefulWidget {
  const PrivacySecurityScreen({super.key});

  @override
  State<PrivacySecurityScreen> createState() => _PrivacySecurityScreenState();
}

class _PrivacySecurityScreenState extends State<PrivacySecurityScreen> {
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
                padding: EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              )),
          title: Text(
            "Privacy & Security",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            children: [
              Container(
                // height: MediaQuery.of(context).size.height * 0.065,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(5.r)),
                child: Padding(
                  padding: EdgeInsets.all(12.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data Privacy",
                              style: w400_14Poppins(),
                            ),
                            Text(
                              "Lorum backup your data to O-Drive. You can retrieve the data when you needed.",
                              style: w400_10Poppins(),
                            )
                          ],
                        ),
                      ),
                      CustomSwitch(
                          initialValue:
                              settingsScreenController.dataPrivacyToggle.value,
                          onChanged: (value) {
                            settingsScreenController.dataPrivacyToggle.value =
                                !settingsScreenController
                                    .dataPrivacyToggle.value;
                          })
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
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Encryption",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                          initialValue:
                              settingsScreenController.encryptionToggle.value,
                          onChanged: (value) {
                            settingsScreenController.encryptionToggle.value =
                                !settingsScreenController
                                    .encryptionToggle.value;
                          })
                    ],
                  ),
                ),
              ),
              height10,
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Routes.applockTypeScreen);
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.065,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "App Lock",
                          style: w400_14Poppins(),
                        ),
                        CustomSwitch(
                            initialValue:
                                settingsScreenController.applockToggle.value,
                            onChanged: (value) {
                              settingsScreenController.applockToggle.value =
                                  !settingsScreenController.applockToggle.value;
                            })
                      ],
                    ),
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
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Account Recovery",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                          initialValue: settingsScreenController
                              .accountRecoveryToggle.value,
                          onChanged: (value) {
                            settingsScreenController
                                    .accountRecoveryToggle.value =
                                !settingsScreenController
                                    .accountRecoveryToggle.value;
                          })
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
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Two Factor Authentication",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                          initialValue:
                              settingsScreenController.twoFactorToggle.value,
                          onChanged: (value) {
                            settingsScreenController.twoFactorToggle.value =
                                !settingsScreenController.twoFactorToggle.value;
                          })
                    ],
                  ),
                ),
              ),
              height10,
            ],
          ),
        ),
      ),
    );
  }
}
