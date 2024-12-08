import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_createpost_controller.dart';
import 'package:o_woman/app/viewmodels/hum_profile/be_safe_controller.dart';
import 'package:o_woman/app/viewmodels/home_controller/pill_corner_controller.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/app/viewmodels/post_login/cycle_track_controller.dart';
import 'package:o_woman/app/views/home/water_mag/water_help_widget/walet_help_widget.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/hive_helper.dart';
import 'package:o_woman/utils/logger_utils.dart';
import '../../app/app.dart';
import '../../app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import '../../constants/app_colors.dart';
import 'helper_widgets.dart';

class BottomSheetCall {
  PillCornerController pillCornerController = Get.put(PillCornerController());
  void calendarBottomSheet(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                //  height: 250,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.colorPrimary,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          Container(
                            height: 6,
                            width: 46,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(9),
                                    topRight: Radius.circular(9)),
                                color: AppColors.homePageBottomColorLine1),
                          ),
                          Container(
                            height: 6,
                            width: 46,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 0),
                            decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                color: AppColors.mainColor.withOpacity(0.3)),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 0),
                      child: Text(
                        "8 Dec 2008",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycle),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 0),
                      child: Text(
                        "Symptoms & Mood",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycle),
                      ),
                    ),
                    HelpWeightHealthQuery().answerWidgetContainerBottomSheet(
                        context,
                        "Log your mood & symptoms  ",
                        AppColors.whiteColor),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 0),
                      child: Text(
                        "Health & Lifestyle",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycle),
                      ),
                    ),
                    HelpWeightHealthQuery().answerWidgetContainerBottomSheet(
                        context,
                        "Log your mood & symptoms  ",
                        AppColors.whiteColor),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 0),
                      child: Text(
                        "Cycle day summay",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycle),
                      ),
                    ),
                    HelpWeightHealthQuery().answerWidgetContainerBottomSheet(
                        context,
                        "Day 14  Ovulation phase  ",
                        AppColors.whiteColor),
                    const Padding(
                      padding: EdgeInsets.only(top: 15, left: 0),
                      child: Text(
                        "Notes",
                        textScaleFactor: 1.0,
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColors.textColorCycle),
                      ),
                    ),
                    HelpWeightHealthQuery().answerWidgetContainerBottomSheet(
                        context, "Add Notes", AppColors.whiteColor),
                  ],
                ),
              )
            ],
          );
        });
  }

  void logoutBottomSheet() {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: navigatorKey.currentState!.context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10),
                decoration: const BoxDecoration(
                    color: AppColors.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.colorPrimary,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 6,
                          width: 46,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColors.mainColor.withOpacity(0.3)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w500,
                        AppColors.colorPrimaryTestDarkMore,
                        "Account Logout",
                      ),
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w500,
                        AppColors.privacyPolicyText,
                        "Are you sure you want to logout?",
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 30, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: HelperWidget().testMethodStartAlign(
                                14.0,
                                FontWeight.w500,
                                AppColors.mainColor.withOpacity(0.3),
                                "Cancel",
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                //   Navigator.pushNamed(context, Routes.cycleTrackFastScreen);
                                logoutMethods();
                              },
                              child: HelperWidget().testMethodStartAlign(
                                14.0,
                                FontWeight.w600,
                                AppColors.mainColor,
                                "Yes",
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void addProfilePicBottomSheet(
      SettingsScreenController settingsScreenController) {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: navigatorKey.currentState!.context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.mainColor,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 6,
                          width: 46,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColors.mainColor.withOpacity(0.3)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w500,
                        AppColors.blackColor,
                        "Add Image",
                      ),
                      height10,
                      Row(
                        children: [
                          InkWell(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                );
                                if (image != null) {
                                  final croppedImage =
                                      await cropImage(File(image.path));
                                  if (croppedImage != null) {
                                    settingsScreenController
                                        .saveProfilePic(croppedImage);
                                    settingsScreenController.imagePicker.value =
                                        croppedImage.path;
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              child: SvgPicture.asset(ImagesUrl.cameraPicIcon)),
                          width15,
                          width15,
                          InkWell(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (image != null) {
                                  final croppedImage =
                                      await cropImage(File(image.path));
                                  print("image cropped${croppedImage!.path}");
                                  settingsScreenController.imagePicker.value =
                                      croppedImage.path;
                                  settingsScreenController
                                      .saveProfilePic(croppedImage);
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              child:
                                  SvgPicture.asset(ImagesUrl.galleryPicIcon)),
                        ],
                      ),
                      height15,
                      Row(
                        children: [
                          HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.colorGray,
                            "Camera",
                          ),
                          width15,
                          width15,
                          HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.colorGray,
                            "Gallery",
                          ),
                        ],
                      ),
                      height10,
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void addAttachmentsBottomSheet(BeSafeController beSafeController) {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: navigatorKey.currentState!.context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.mainColor,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 6,
                          width: 46,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColors.mainColor.withOpacity(0.3)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w500,
                        AppColors.blackColor,
                        "Add Attachments",
                      ),
                      height10,
                      Row(
                        children: [
                          InkWell(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                );
                                if (image != null) {
                                  final croppedImage =
                                      await cropImage(File(image.path));
                                  if (croppedImage != null) {
                                    beSafeController.imagePicker.value =
                                        croppedImage.path;
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              child: SvgPicture.asset(ImagesUrl.cameraPicIcon)),
                          width15,
                          width15,
                          InkWell(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (image != null) {
                                  final croppedImage =
                                      await cropImage(File(image.path));
                                  print("image cropped${croppedImage!.path}");
                                  beSafeController.imagePicker.value =
                                      croppedImage.path;
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              child:
                                  SvgPicture.asset(ImagesUrl.galleryPicIcon)),
                        ],
                      ),
                      height15,
                      Row(
                        children: [
                          HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.colorGray,
                            "Camera",
                          ),
                          width15,
                          width15,
                          HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.colorGray,
                            "Gallery",
                          ),
                        ],
                      ),
                      height10,
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void addAttachmentsCommunityBottomSheet(
      CommunityProfileController communityScreenController) {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: navigatorKey.currentState!.context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.mainColor,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                          height: 6,
                          width: 46,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColors.mainColor.withOpacity(0.3)),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w500,
                        AppColors.blackColor,
                        "Add Attachments",
                      ),
                      height10,
                      Row(
                        children: [
                          InkWell(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(
                                  source: ImageSource.camera,
                                );
                                if (image != null) {
                                  final croppedImage =
                                      await cropImage(File(image.path));
                                  if (croppedImage != null) {
                                    communityScreenController
                                        .imagePicker.value = croppedImage.path;
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              child: SvgPicture.asset(ImagesUrl.cameraPicIcon)),
                          width15,
                          width15,
                          InkWell(
                              onTap: () async {
                                final image = await ImagePicker().pickImage(
                                  source: ImageSource.gallery,
                                );
                                if (image != null) {
                                  final croppedImage =
                                      await cropImage(File(image.path));
                                  print("image cropped${croppedImage!.path}");
                                  communityScreenController.imagePicker.value =
                                      croppedImage.path;
                                  // ignore: use_build_context_synchronously
                                  Navigator.pop(context);
                                }
                              },
                              child:
                                  SvgPicture.asset(ImagesUrl.galleryPicIcon)),
                        ],
                      ),
                      height15,
                      Row(
                        children: [
                          HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.colorGray,
                            "Camera",
                          ),
                          width15,
                          width15,
                          HelperWidget().testMethodStartAlign(
                            14.0,
                            FontWeight.w500,
                            AppColors.colorGray,
                            "Gallery",
                          ),
                        ],
                      ),
                      height10,
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  static Future<CroppedFile?> cropImage(File image) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: image.path,
      aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
      aspectRatioPresets: [CropAspectRatioPreset.square],
      cropStyle: CropStyle.circle,
      compressQuality: 70,
      maxWidth: 700,
      maxHeight: 700,
      uiSettings: [
        AndroidUiSettings(
          hideBottomControls: true,
          toolbarTitle: 'Crop Image',
          toolbarColor: Colors.blue,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: false,
        )
      ],
    );
    return croppedFile;
  }

  void logoutMethods() {
    /*  Get.findBindings().forEach((binding) {
      // Check if binding is a GetxController
      if (binding is GetxController) {
        // Dispose the controller
        binding.dispose();
      }
    });*/
    Get.deleteAll();

    HiveHelper.clearUserData();
    Navigator.pushNamedAndRemoveUntil(
        navigatorKey.currentState!.context, Routes.login, (route) => false);
  }

  void setReminderBottomSheet() {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: navigatorKey.currentState!.context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.colorPrimary,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height20,
                      Center(
                        child: Container(
                          height: 6,
                          width: 46,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 0),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              color: AppColors.mainColor.withOpacity(0.3)),
                        ),
                      ),
                      height30,
                      HelperWidget().testMethodStartAlign(
                        16.0,
                        FontWeight.w500,
                        AppColors.blackColor,
                        "Set Reminder",
                      ),
                      height10,
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w400,
                        AppColors.privacyPolicyText,
                        "Contraception",
                      ),
                      height10,
                      InkWell(
                        onTap: () {
                          BottomSheetCall().seeReminderBottomSheet();
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.mainColor.withOpacity(0.05)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                HelperWidget().testMethodStartAlign(
                                  14.0,
                                  FontWeight.w400,
                                  AppColors.blackColor.withOpacity(0.8),
                                  "Implant",
                                ),
                                SvgPicture.asset(
                                  ImagesUrl.forwardIcon,
                                  color: AppColors.mainColor,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      height10,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.mainColor.withOpacity(0.05)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HelperWidget().testMethodStartAlign(
                                14.0,
                                FontWeight.w400,
                                AppColors.blackColor.withOpacity(0.8),
                                "IUD",
                              ),
                              SvgPicture.asset(
                                ImagesUrl.forwardIcon,
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      height15,
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w400,
                        AppColors.privacyPolicyText,
                        "Supplements",
                      ),
                      height10,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.mainColor.withOpacity(0.05)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HelperWidget().testMethodStartAlign(
                                14.0,
                                FontWeight.w400,
                                AppColors.blackColor.withOpacity(0.8),
                                "Vitamin A",
                              ),
                              SvgPicture.asset(
                                ImagesUrl.forwardIcon,
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      height15,
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w400,
                        AppColors.privacyPolicyText,
                        "Other",
                      ),
                      height10,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: AppColors.mainColor.withOpacity(0.05)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                children: [
                                  Container(
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.09,
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      // 0.05,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.buttonColor
                                                  .withOpacity(0.4)),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0.sp),
                                        child: SvgPicture.asset(
                                          ImagesUrl.pillShape1Icon,
                                          color: AppColors.mainColor,
                                        ),
                                      )),
                                  width15,
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HelperWidget().testMethodStartAlign(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.blackColor.withOpacity(0.8),
                                        "PCM",
                                      ),
                                      HelperWidget().testMethodStartAlign(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.privacyPolicyText,
                                        "Headache",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SvgPicture.asset(
                                ImagesUrl.forwardIcon,
                                color: AppColors.mainColor,
                              )
                            ],
                          ),
                        ),
                      ),
                      height20,
                      InkWell(
                        onTap: () {
                          pillCornerController.loggedPills.value =
                              !pillCornerController.loggedPills.value;
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: AppColors.buttonColor),
                          child: Center(
                            child: Text(
                              "See Reminder",
                              style:
                                  w400_14Poppins(color: AppColors.whiteColor),
                            ),
                          ),
                        ),
                      ),
                      height15,
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }

  void seeReminderBottomSheet() {
    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: navigatorKey.currentState!.context,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                    left: 10,
                    right: 10),
                decoration: const BoxDecoration(
                    color: AppColors.colorGrayDarkBg,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(
                          0.0,
                          5.0,
                        ),
                        blurRadius: 1.0,
                        spreadRadius: .3,
                        color: AppColors.colorPrimary,
                        //   inset: true,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      height20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HelperWidget().testMethodStartAlign(
                            18.0,
                            FontWeight.w500,
                            AppColors.blackColor,
                            "Contraceoption",
                          ),
                          // Obx(
                          //   () => InkWell(
                          //       onTap: () {
                          //         pillCornerController
                          //                 .seeReminiderToggle.value =
                          //             !pillCornerController
                          //                 .seeReminiderToggle.value;
                          //       },
                          //       child: pillCornerController
                          //               .seeReminiderToggle.value
                          //           ? SvgPicture.asset(ImagesUrl.toggleOnIcon)
                          //           : SvgPicture.asset(
                          //               ImagesUrl.toggleOffIcon)),
                          // )
                        ],
                      ),
                      height10,
                      HelperWidget().testMethodStartAlign(
                        14.0,
                        FontWeight.w400,
                        AppColors.privacyPolicyText,
                        "Contraception",
                      ),
                      height10,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.r),
                            color: AppColors.mainColor.withOpacity(0.05)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Wrap(
                                children: [
                                  Container(
                                      // width: MediaQuery.of(context).size.width *
                                      //     0.09,
                                      // height:
                                      //     MediaQuery.of(context).size.height *
                                      // 0.05,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: AppColors.buttonColor
                                                  .withOpacity(0.4)),
                                          shape: BoxShape.circle),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0.sp),
                                        child: SvgPicture.asset(
                                          ImagesUrl.pillShape1Icon,
                                          color: AppColors.mainColor,
                                        ),
                                      )),
                                  width15,
                                  Column(
                                    // mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      HelperWidget().testMethodStartAlign(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.blackColor.withOpacity(0.8),
                                        "Implant",
                                      ),
                                      HelperWidget().testMethodStartAlign(
                                        14.0,
                                        FontWeight.w400,
                                        AppColors.privacyPolicyText,
                                        "Headache",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.delete_outline,
                                color: AppColors.mainColor,
                                size: 26.sp,
                              )
                            ],
                          ),
                        ),
                      ),
                      height10,
                      Container(
                        height: MediaQuery.of(context).size.height * 0.065,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.mainColor.withOpacity(0.05)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HelperWidget().testMethodStartAlign(
                                14.0,
                                FontWeight.w400,
                                AppColors.blackColor.withOpacity(0.8),
                                "Set dose frequency",
                              ),
                              Obx(
                                () => DropdownButtonHideUnderline(
                                  child: DropdownButton2<String>(
                                    isExpanded: true,
                                    items: pillCornerController.doseList
                                        .map((String item) =>
                                            DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style: w400_14Poppins(
                                                  color: AppColors
                                                      .textColorCycleInfo,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: pillCornerController.dosevalue
                                        .toString(),
                                    onChanged: (String? value) {
                                      pillCornerController.dosevalue.value =
                                          value!;
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 30.h,
                                      width: 80.w,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.colorGray
                                                .withOpacity(0.5)),
                                        borderRadius: BorderRadius.circular(5),
                                        // color: Colors.white,
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
                                      maxHeight: 180.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.white,
                                      ),
                                      offset: const Offset(0, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(5),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                3),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      height15,
                      HelperWidget().testMethodStartAlign(
                        16.0,
                        FontWeight.w500,
                        AppColors.blackColor,
                        "Set Reminder",
                      ),
                      height10,
                      Container(
                        height: 57.h,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.disableColor.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                16.0,
                                FontWeight.w500,
                                AppColors.textColorCycleInfo,
                                "Dose 1 "),
                            GestureDetector(
                              onTap: () {
                                WaterHelpWidget().setTimeWaterBottomSheet(
                                    context, pillCornerController, "AM");
                              },
                              child: Container(
                                  height: 40.h,
                                  width: 90.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                        color: AppColors.containerBorderC,
                                        width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          "${pillCornerController.durationStart1Hours.value} : ${pillCornerController.durationStart1Minutes.value.remainder(60)}",
                                          style: const TextStyle(
                                              color:
                                                  AppColors.textColorCycleInfo,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        width: 13,
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                          ImagesUrl.downArrow,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      height10,
                      Container(
                        height: 57.h,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.disableColor.withOpacity(0.15)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                16.0,
                                FontWeight.w500,
                                AppColors.textColorCycleInfo,
                                "Dose 2 "),
                            GestureDetector(
                              onTap: () {
                                WaterHelpWidget().setTimeWaterBottomSheet(
                                    context, pillCornerController, "AM");
                              },
                              child: Container(
                                  height: 40.h,
                                  width: 90.w,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10.h, horizontal: 5.w),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    border: Border.all(
                                        color: AppColors.containerBorderC,
                                        width: 1),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Obx(
                                        () => Text(
                                          "${pillCornerController.durationEndHours} : ${pillCornerController.durationEndMinutes.value.remainder(60)}",
                                          style: const TextStyle(
                                              color:
                                                  AppColors.textColorCycleInfo,
                                              fontSize: 13),
                                        ),
                                      ),
                                      Container(
                                        width: 13,
                                        alignment: Alignment.center,
                                        child: SvgPicture.asset(
                                          ImagesUrl.downArrow,
                                          color: AppColors.mainColor,
                                        ),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        ),
                      ),
                      height15,
                      Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.r),
                            color: AppColors.disableColor.withOpacity(0.15)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperWidget().testMethodStartAlign(
                              14.0,
                              FontWeight.w400,
                              AppColors.privacyPolicyText,
                              "Set Days",
                            ),
                            height10,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.colorGray
                                              .withOpacity(0.5)),
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(2.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Text(
                                      "Daily",
                                      style: w400_16Poppins(),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.colorGray
                                              .withOpacity(0.5)),
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(2.r)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Text(
                                      "Alternate Days",
                                      style: w400_16Poppins(),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: AppColors.colorGray
                                              .withOpacity(0.5)),
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(2)),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10.w, vertical: 5.h),
                                    child: Text(
                                      "Customize",
                                      style: w400_16Poppins(),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      height10,
                      height20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 37,
                            width: 115,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: AppColors.colorPrimary, width: 2),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: HelperWidget().testMethod(
                                  14.0,
                                  FontWeight.w500,
                                  AppColors.colorPrimary,
                                  "Cancel"),
                            ),
                          ),
                          width20,
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              height: 37,
                              width: 115,
                              decoration: BoxDecoration(
                                  color: AppColors.colorPrimary,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: HelperWidget().testMethod(14.0,
                                    FontWeight.w500, Colors.white, "Save"),
                              ),
                            ),
                          )
                        ],
                      ),
                      height15,
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
