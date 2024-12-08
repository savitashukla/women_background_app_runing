import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';
import 'package:o_woman/utils/hive_helper.dart';

import '../../../viewmodels/hum_profile/app_lock_typescreen_controller.dart';

class AppLockTypeScreen extends StatelessWidget {
  AppLockTypeScreen({super.key});

  AppLockTypeScreenController controller =
      Get.put(AppLockTypeScreenController());

  @override
  Widget build(BuildContext context) {
    controller.checkDeviceSupport();
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
            "App lock type",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // Navigator.pushNamed(context, Routes.setAccessCodeScreen);
                },
                child: Container(
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
                          "Access code",
                          style: w400_14Poppins(),
                        ),
                        CustomSwitch(
                            initialValue: controller.accessCodeToggle.value,
                            onChanged: (value) {
                              if (controller.youDeviceSupported.value) {
                                controller.accessCodeToggle.value =
                                    !controller.accessCodeToggle.value;

                                HiveHelper.insertData("accessCodeToggle",
                                    controller.accessCodeToggle.value);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Your device not Support");
                              }
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
                        "Fingerprints",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                          initialValue: controller.fingerprintsToggle.value,
                          onChanged: (value) {
                            if (controller.youDeviceSupported.value) {
                              if (controller.canCheckBiometrics.value) {
                                controller.fingerprintsToggle.value =
                                    !controller.fingerprintsToggle.value;

                                HiveHelper.insertData("fingerprintsToggle",
                                    controller.fingerprintsToggle.value);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Your device not Support");
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Your device not Support");
                            }
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
                  padding: EdgeInsets.all(8.0.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Face",
                        style: w400_14Poppins(),
                      ),
                      CustomSwitch(
                          initialValue: controller.faceToggle.value,
                          onChanged: (value) {
                            if (controller.youDeviceSupported.value) {
                              if (controller.canCheckBiometrics.value) {
                                controller.faceToggle.value =
                                    !controller.faceToggle.value;

                                HiveHelper.insertData("faceToggle",
                                    controller.fingerprintsToggle.value);
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Your device not Support");
                              }
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Your device not Support");
                            }
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
