import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:o_woman/app/viewmodels/community_controller/community_edit_profile_controller.dart';
import 'package:o_woman/app/views/dashboard/second_app_bar.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/crop.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/logger_utils.dart';

import '../../app.dart';

class CommunityEditProfile extends StatelessWidget {
  CommunityEditProfile({super.key});
  CommunityProfileEditController controller = Get.put(CommunityProfileEditController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 52.h,
                color: Colors.transparent,
                child: ClipRRect(
                  child: Container(
                    height: 52.h,
                    decoration: const BoxDecoration(
                      color: AppColors.appBarColor1,
                    ),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 52.0),
                      child: AppBarSec().appBarSecondMethod(context),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                'Complete profile',
                style: TextStyle(
                    color: AppColors.colorPrimaryTestDarkMore,
                    fontWeight: FontWeight.w500,
                    fontSize: 16.h),
              ),
            SizedBox(
                height: 20.h,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: controller.kGradientBoxDecoration,
                      // width: 110.w,
                      height: 90.h,
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: DecoratedBox(
                          decoration: controller.kInnerDecoration,
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Image.asset(
                              ImagesUrl.profileImage,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
                          //Image picker
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
                                          bottom: MediaQuery.of(context)
                                              .viewInsets
                                              .bottom,
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
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            Center(
                                              child: centerWidget(),
                                            ),
                                            const SizedBox(
                                              height: 30,
                                            ),
                                            HelperWidget().testMethodStartAlign(
                                              14.0,
                                              FontWeight.w500,
                                              AppColors.blackColor,
                                              "Choose Image",
                                            ),
                                            height10,
                                            Row(
                                              children: [
                                                InkWell(
                                                    onTap: () async {
                                                      final image =
                                                          await ImagePicker()
                                                              .pickImage(
                                                        source:
                                                            ImageSource.camera,
                                                      );
                                                      if (image != null) {
                                                        final croppedImage =
                                                            await CropImage
                                                                .cropImage(File(
                                                                    image
                                                                        .path));
                                                        if (croppedImage !=
                                                            null) {
                                                          controller.imagePicker
                                                                  .value =
                                                              croppedImage.path;
                                                          print(
                                                              "Image Path ==>> ${controller.imagePicker.value}");
                                                          Navigator.pop(
                                                              context);
                                                        }
                                                      }
                                                    },
                                                    child: SvgPicture.asset(
                                                        ImagesUrl
                                                            .cameraPicIcon)),
                                                width15,
                                                width15,
                                                InkWell(
                                                    onTap: () async {
                                                      final image =
                                                          await ImagePicker()
                                                              .pickImage(
                                                        source:
                                                            ImageSource.gallery,
                                                      );
                                                      if (image != null) {
                                                        final croppedImage =
                                                            await CropImage
                                                                .cropImage(File(
                                                                    image
                                                                        .path));
                                                        print(
                                                            "image cropped${croppedImage!.path}");
                                                        controller.imagePicker
                                                                .value =
                                                            croppedImage.path;
                                                        // ignore: use_build_context_synchronously
                                                        Navigator.pop(context);
                                                      }
                                                    },
                                                    child: SvgPicture.asset(
                                                        ImagesUrl
                                                            .galleryPicIcon)),
                                              ],
                                            ),
                                            height15,
                                            Row(
                                              children: [
                                                HelperWidget()
                                                    .testMethodStartAlign(
                                                  14.0,
                                                  FontWeight.w500,
                                                  AppColors.colorGray,
                                                  "Camera",
                                                ),
                                                width15,
                                                width15,
                                                HelperWidget()
                                                    .testMethodStartAlign(
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
                        },
                        child: Container(
                          height: 25.h,
                          width: 28.w,
                          decoration: BoxDecoration(
                            color: AppColors.lightPinkColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: SvgPicture.asset(
                              ImagesUrl.cameraIcon,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 15.h,
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //First Name
                        Container(
                          width: 156,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                            cursorColor: AppColors.mainColor,
                            style: const TextStyle(
                                color: AppColors.colorPrimaryTestDarkMore,
                                fontSize: 14),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Enter FirstName",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        //Last Name..
                        Container(
                          width: 156,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: TextFormField(
                            cursorColor: AppColors.mainColor,
                            style: const TextStyle(
                                color: AppColors.colorPrimaryTestDarkMore,
                                fontSize: 14),
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              hintText: "Enter Last Name",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: AppColors.borderColor,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        cursorColor: AppColors.mainColor,
                        style: const TextStyle(
                            color: AppColors.colorPrimaryTestDarkMore,
                            fontSize: 14),
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "User name",
                           hintStyle: TextStyle(color: Colors.grey.shade400),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: TextFormField(
                        cursorColor: AppColors.mainColor,
                        style: const TextStyle(
                            color: AppColors.colorPrimaryTestDarkMore,
                            fontSize: 14),
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "About",
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          filled: true,
                          fillColor: Colors.white,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: const BorderSide(
                              color: AppColors.borderColor,
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                height: 32,
                width: 95,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.mainColor),
                child: const Center(
                    child: Text(
                  "Save",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  centerWidget() {
    Container(
      height: 6,
      width: 46,
      alignment: Alignment.center,
      margin: const EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppColors.mainColor.withOpacity(0.3)),
    );
  }
}
