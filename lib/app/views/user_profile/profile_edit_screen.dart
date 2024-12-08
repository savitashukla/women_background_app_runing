import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/home_controller/commonController.dart';
import 'package:o_woman/app/viewmodels/home_controller/home_page_controller.dart';
import 'package:o_woman/app/viewmodels/hum_profile/settings_screen_controller.dart';
import 'package:o_woman/app/viewmodels/post_login/qa_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/bottom_sheet_call.dart';
import 'package:o_woman/utils/helper_widgets/customTextformfield.dart';
import 'package:o_woman/utils/helper_widgets/custome_button.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  SettingsScreenController controller = Get.put(SettingsScreenController());
  CommonController commonController = Get.put(CommonController());
  HomePageController homePageController = Get.put(HomePageController());
  QAController qaController = Get.put(QAController());

  @override
  void initState() {
    controller.profileViewData();
    controller.femaleController.value.text = "Female";
    controller.dobController.value.text = "12/04/1999";
    super.initState();
  }

  Future<bool> onWillPop() {
    if (commonController.retakeValueProfile.value) {
      Navigator.pushNamed(context, Routes.profileScreen);
      return Future.value(true);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          backgroundColor: AppColors.scaffoldBackgroundColor,
          appBar: AppBar(
            centerTitle: false,
            backgroundColor: AppColors.homeBgColor,
            leading: InkWell(
              onTap: () {
                if (commonController.retakeValueProfile.value) {
                  Navigator.pushNamed(context, Routes.profileScreen);
                } else {
                  Navigator.pop(context);
                }

                controller.editprofile.value = false;
              },
              child: Padding(
                padding: EdgeInsets.all(12.0.sp),
                child: SvgPicture.asset(
                  ImagesUrl.backArrowIcon,
                  color: AppColors.blackColor,
                ),
              ),
            ),
            title: Obx(
              () => Text(
                controller.editprofile.value ? "Edit Profile" : "Profile",
                style: w500_16Poppins(),
              ),
            ),
            actions: [
              Obx(
                () => InkWell(
                  onTap: () {
                    controller.editprofile.value = true;
                  },
                  child: !controller.editprofile.value
                      ? SvgPicture.asset(
                          ImagesUrl.profileEditIcon,
                          color: AppColors.mainColor,
                        )
                      : const SizedBox.shrink(),
                ),
              ),
              width15,
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              child: Stack(
                children: [
                  Obx(
                    () => controller.isProfileLoading.value == false
                        ? Column(
                            children: [
                              Center(
                                child: Obx(
                                  () => controller.profiledata.value.data !=
                                              null &&
                                          controller.profiledata.value.data!
                                                  .profilePic ==
                                              null
                                      ? Stack(children: [
                                          Container(
                                            decoration: controller
                                                .kGradientBoxDecoration.value,
                                            height: 85.h,
                                            width: 85.w,
                                            child: controller.imagePicker.value
                                                    .isNotEmpty
                                                ? Padding(
                                                    padding:
                                                        EdgeInsets.all(2.0.sp),
                                                    child: Container(
                                                      width: 100.w,
                                                      height: 100.h,
                                                      decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        image: DecorationImage(
                                                          image: FileImage(File(
                                                              controller
                                                                  .imagePicker
                                                                  .value)),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0.sp),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .scaffoldBackgroundColor,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            4.0.sp),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            border: Border.all(
                                                                color: AppColors
                                                                    .colorGray
                                                                    .withOpacity(
                                                                        0.2)),
                                                            color: AppColors
                                                                .whiteColor,
                                                            shape:
                                                                BoxShape.circle,
                                                          ),
                                                          child: const Icon(
                                                            Icons.person,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                          controller.editprofile.value
                                              ? Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      BottomSheetCall()
                                                          .addProfilePicBottomSheet(
                                                              controller);
                                                    },
                                                    child: Container(
                                                      height: 25.h,
                                                      width: 28.w,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .lightPinkColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.r),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            2.0.sp),
                                                        child: SvgPicture.asset(
                                                          ImagesUrl.cameraIcon,
                                                          color: AppColors
                                                              .mainColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox()
                                        ])
                                      : Stack(children: [
                                          controller
                                                  .imagePicker.value.isNotEmpty
                                              ? Padding(
                                                  padding:
                                                      EdgeInsets.all(3.0.sp),
                                                  child: Container(
                                                    width: 100.w,
                                                    height: 100.h,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          AppColors.whiteColor,
                                                      image: DecorationImage(
                                                        image: FileImage(File(
                                                            controller
                                                                .imagePicker
                                                                .value)),
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : Container(
                                                  decoration: controller
                                                      .kGradientBoxDecoration
                                                      .value,
                                                  // width: 110.w,
                                                  height: 90.h,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0.sp),
                                                    child: Container(
                                                      decoration:
                                                          const BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: AppColors
                                                            .whiteColor,
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            3.0.sp),
                                                        child:
                                                            CachedNetworkImage(
                                                          fit: BoxFit.fill,
                                                          imageUrl:
                                                              "${"https://de4nfar4wtruu.cloudfront.net/"}${controller.profiledata.value.data!.profilePic!}",
                                                          placeholder: (context,
                                                                  url) =>
                                                              const SizedBox(
                                                            height: 85,
                                                            width: 85,
                                                          ),
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            height: 85.h,
                                                            width: 85.w,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )),
                                          controller.editprofile.value
                                              ? Positioned(
                                                  right: 0,
                                                  bottom: 0,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      BottomSheetCall()
                                                          .addProfilePicBottomSheet(
                                                              controller);
                                                    },
                                                    child: Container(
                                                      height: 25.h,
                                                      width: 28.w,
                                                      decoration: BoxDecoration(
                                                        color: AppColors
                                                            .lightPinkColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.r),
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            2.0.sp),
                                                        child: SvgPicture.asset(
                                                          ImagesUrl.cameraIcon,
                                                          color: AppColors
                                                              .mainColor,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              : const SizedBox()
                                        ]),
                                ),
                              ),
                              height10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: CustomTextFormField(
                                      enableborderColor: AppColors
                                          .colorPrimaryTestDarkMore
                                          .withOpacity(0.2),
                                      fillColor: controller.editprofile.value
                                          ? AppColors.whiteColor
                                          : AppColors.homeBgColor,
                                      readOnly:
                                          controller.editprofile.value == true
                                              ? false
                                              : true,
                                      label: "Name",
                                      labelStyle: const TextStyle(
                                          color: AppColors.mainColor),
                                      controller:
                                          controller.nameController.value,
                                    ),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: CustomTextFormField(
                                      enableborderColor: AppColors
                                          .colorPrimaryTestDarkMore
                                          .withOpacity(0.2),
                                      fillColor: controller.editprofile.value
                                          ? AppColors.whiteColor
                                          : AppColors.homeBgColor,
                                      readOnly:
                                          controller.editprofile.value == true
                                              ? false
                                              : true,
                                      label: "Last",
                                      labelStyle: const TextStyle(
                                          color: AppColors.mainColor),
                                      controller:
                                          controller.nameControllerLast.value,
                                    ),
                                  ),
                                ],
                              ),
                              /*    CustomTextFormField(
                                enableborderColor: AppColors
                                    .colorPrimaryTestDarkMore
                                    .withOpacity(0.2),
                                fillColor: controller.editprofile.value
                                    ? AppColors.whiteColor
                                    : AppColors.homeBgColor,
                                readOnly: controller.editprofile.value == true
                                    ? false
                                    : true,
                                label: "Name",
                                labelStyle:
                                    const TextStyle(color: AppColors.mainColor),
                                controller: controller.nameController.value,
                              ),*/

                              height10,
                              CustomTextFormField(
                                enableborderColor: AppColors
                                    .colorPrimaryTestDarkMore
                                    .withOpacity(0.2),
                                fillColor: AppColors.homeBgColor,
                                readOnly: true,
                                label: "O-mail ID",
                                labelStyle:
                                    const TextStyle(color: AppColors.mainColor),
                                controller: controller.omailIDController.value,
                              ),

                              height10,

                              // IgnorePointer(
                              //   ignoring: controller.editprofile.value == true
                              //       ? false
                              //       : true,
                              Obx(
                                () => IgnorePointer(
                                  ignoring: controller.editprofile.value
                                      ? false
                                      : true,
                                  child: GestureDetector(
                                    onTap: () {
                                      showModalBottomSheet(
                                        context: context,
                                        isScrollControlled: true,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(10.r),
                                                topLeft:
                                                    Radius.circular(10.r))),
                                        builder: (context) {
                                          return Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height /
                                                2,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10.r),
                                                    topRight:
                                                        Radius.circular(10.r))),
                                            child: Obx(
                                              () => ListView.builder(
                                                  itemCount: controller
                                                      .countryDataList.length,
                                                  physics:
                                                      const BouncingScrollPhysics(),
                                                  shrinkWrap: true,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: GestureDetector(
                                                          onTap: () {
                                                            controller
                                                                .upDateCountry(
                                                                    index);
                                                            controller
                                                                    .countryCode
                                                                    .value =
                                                                controller
                                                                    .countryDataList[
                                                                        index]
                                                                    .phoneCode!;
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(controller
                                                              .countryDataList[
                                                                  index]
                                                              .countryName!)),
                                                    );
                                                  }),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: CustomTextFormField(
                                      enableborderColor: AppColors
                                          .colorPrimaryTestDarkMore
                                          .withOpacity(0.2),
                                      fillColor: controller.editprofile.value
                                          ? AppColors.whiteColor
                                          : AppColors.homeBgColor,
                                      readOnly: true,
                                      label: "Country",
                                      suffixIcon: const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            AppColors.colorPrimaryTestDarkMore,
                                      ),
                                      hintText: controller.nationalityController
                                              .value.text.isEmpty
                                          ? "Please Select your country"
                                          : controller
                                              .nationalityController.value.text,
                                      labelStyle: const TextStyle(
                                          color: AppColors.mainColor),
                                      controller: controller
                                          .nationalityController.value,
                                    ),
                                  ),
                                ),
                              ),
                              //     CustomTextFormField(
                              //   enableborderColor: AppColors
                              //       .colorPrimaryTestDarkMore
                              //       .withOpacity(0.2),
                              //   fillColor: controller.editprofile.value
                              //       ? AppColors.whiteColor
                              //       : AppColors.homeBgColor,
                              //   suffixIcon: GestureDetector(
                              //     child: const Icon(
                              //       Icons.keyboard_arrow_down_rounded,
                              //       color: AppColors.colorPrimaryTestDarkMore,
                              //     ),
                              //   ),
                              //   readOnly: true,
                              //   label: "Country",
                              //   labelStyle: const TextStyle(
                              //       color: AppColors.mainColor),
                              //   hintText:
                              //       controller.countryNameData.value.isEmpty
                              //           ? "Please Select your country"
                              //           : controller.countryNameData.value,
                              //   hintStyle: const TextStyle(
                              //       color:
                              //           AppColors.colorPrimaryTestDarkMore),
                              //   controller:
                              //       controller.nationalityController.value,
                              // ),
                              // ),

                              height10,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.45,
                                      child: CustomTextFormField(
                                        enableborderColor: AppColors
                                            .colorPrimaryTestDarkMore
                                            .withOpacity(0.2),
                                        fillColor: AppColors.homeBgColor,
                                        readOnly: true,
                                        label: "Gender",
                                        hintText: "Female",
                                        labelStyle: const TextStyle(
                                            color: AppColors.mainColor),
                                        controller:
                                            controller.femaleController.value,
                                      )

                                      //  DropdownButtonHideUnderline(
                                      //     child: DropdownButton2<String>(
                                      //       isExpanded: true,
                                      //       items: controller.genderList
                                      //           .map((String item) =>
                                      //               DropdownMenuItem<String>(
                                      //                 value: item,
                                      //                 child: Text(
                                      //                   item,
                                      //                   style: const TextStyle(
                                      //                     fontSize: 14,
                                      //                     fontWeight:
                                      //                         FontWeight.w400,
                                      //                     color: AppColors
                                      //                         .textColorCycleInfo,
                                      //                   ),
                                      //                   overflow:
                                      //                       TextOverflow.ellipsis,
                                      //                 ),
                                      //               ))
                                      //           .toList(),
                                      //       value: controller.selectedGenderList
                                      //           .toString(),
                                      //       onChanged: (String? value) {
                                      //         controller.selectedGenderList
                                      //             .value = value!;
                                      //       },
                                      //       buttonStyleData: ButtonStyleData(
                                      //         height: 50,
                                      //         width: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.45,
                                      //         padding: const EdgeInsets.only(
                                      //             left: 14, right: 14),
                                      //         decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(14),
                                      //           color: Colors.white,
                                      //         ),
                                      //       ),
                                      //       iconStyleData: IconStyleData(
                                      //         icon: SvgPicture.asset(
                                      //             ImagesUrl.downArrow),
                                      //         iconSize: 13,
                                      //       ),
                                      //       dropdownStyleData: DropdownStyleData(
                                      //         maxHeight: 200,
                                      //         width: MediaQuery.of(context)
                                      //                 .size
                                      //                 .width *
                                      //             0.45,
                                      //         decoration: BoxDecoration(
                                      //           borderRadius:
                                      //               BorderRadius.circular(14),
                                      //           color: Colors.white,
                                      //         ),
                                      //         offset: const Offset(0, 10),
                                      //         scrollbarTheme: ScrollbarThemeData(
                                      //           radius: const Radius.circular(40),
                                      //           thickness: MaterialStateProperty
                                      //               .all<double>(3),
                                      //           thumbVisibility:
                                      //               MaterialStateProperty.all<
                                      //                   bool>(true),
                                      //         ),
                                      //       ),
                                      //       menuItemStyleData:
                                      //           const MenuItemStyleData(
                                      //         height: 40,
                                      //         padding: EdgeInsets.only(
                                      //             left: 14, right: 14),
                                      //       ),
                                      //     ),
                                      //   ),

                                      ),
                                  /* Obx(
                                      () => SizedBox(
                                        width: MediaQuery.of(context).size.width * 0.45,
                                        child: CustomTextFormField(
                                          enableborderColor: AppColors
                                              .colorPrimaryTestDarkMore
                                              .withOpacity(0.2),
                                          fillColor:
                                              controller.editprofile.value == false
                                                  ? AppColors.homeBgColor
                                                  : AppColors.whiteColor,
                                          readOnly: controller.editprofile.value == true
                                              ? false
                                              : true,
                                          label: "Gender",
                                          labelStyle: const TextStyle(
                                              color: AppColors.mainColor),
                                          controller: controller.femaleController,
                                        ),
                                      ),
                                    ),*/
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.45,
                                    child: CustomTextFormField(
                                      enableborderColor: AppColors
                                          .colorPrimaryTestDarkMore
                                          .withOpacity(0.2),
                                      fillColor: AppColors.homeBgColor,
                                      readOnly: true,
                                      label: "DOB",
                                      textInputFormatter: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9/]'))
                                      ],
                                      labelStyle: const TextStyle(
                                          color: AppColors.mainColor),
                                      controller:
                                          controller.dobController.value,
                                    ),
                                  ),
                                ],
                              ),
                              height10,
                              CustomTextFormField(
                                enableborderColor: AppColors
                                    .colorPrimaryTestDarkMore
                                    .withOpacity(0.2),
                                fillColor: controller.editprofile.value
                                    ? AppColors.whiteColor
                                    : AppColors.homeBgColor,
                                readOnly: controller.editprofile.value == true
                                    ? false
                                    : true,
                                label: "Phone",
                                keyboardType: TextInputType.phone,
                                maxLength: 15,
                                prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, top: 14, right: 10),
                                    child: controller.countryDataList.isNotEmpty
                                        ? Text(
                                            "+${controller.phoneCode.value}",
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )
                                        : Text(
                                            "+${controller.phoneCode.value}",
                                            style: const TextStyle(
                                                color: Colors.black),
                                          )),
                                labelStyle: const TextStyle(
                                    color: AppColors.mainColor, fontSize: 15),
                                controller: controller.phoneController.value,
                                textInputFormatter: [
                                  LengthLimitingTextInputFormatter(25),
                                  FilteringTextInputFormatter.allow(
                                      RegExp(r'[0-9]')),
                                ],
                              ),
                              //"${"+"}${controller.countryCode.value}",
                              height15,
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Health Data",
                                    style: w500_18Poppins(),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      // Navigator.pushNamed(context, Routes.cycleTrackFastScreen);

                                      //  Navigator.pushNamed(context, Routes.cycleTrackFastScreen);



                                  /*
                                      commonController.retakeValue.value = true;
                                      commonController
                                          .retakeValueProfile.value = true;

                                      Navigator.pushNamed(
                                          context, Routes.menstrualFastScreen);
                                      qaController.currentIndex.value = 0;*/
                                    },
                                    child: const Text("Retake",
                                        style: TextStyle(
                                            color: AppColors.colorPrimary,
                                            fontSize: 16)),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Container(
                                color: Colors.white,
                                height:
                                    MediaQuery.of(context).size.height * 0.08,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0.sp),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            color: AppColors.maroonColor
                                                .withOpacity(0.15),
                                            borderRadius:
                                                BorderRadius.circular(5.r)),
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0.sp),
                                          child: SvgPicture.asset(
                                            ImagesUrl.pdfIcon,
                                            color: AppColors.maroonColor,
                                          ),
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Health data.pdf",
                                              style: w500_14Poppins(
                                                color: AppColors
                                                    .textColorCycleInfo,
                                              )),
                                          Text("12 Mb",
                                              style: w500_14Poppins(
                                                color: AppColors
                                                    .textColorCycleInfo,
                                              ))
                                        ],
                                      ),
                                      Text(
                                        "27 DEC 2023",
                                        style: w500_14Poppins(
                                          color: AppColors.textColorCycleInfo,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
                        : Container(
                            color: Colors.transparent,
                            height: MediaQuery.of(context).size.height - 180,
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  color: Colors.transparent,
                                  height: 50,
                                  width: 50,
                                  child: const CircularProgressIndicator(),
                                ),
                              ],
                            )),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Obx(
            () => controller.editprofile.value
                ? Padding(
                    padding: EdgeInsets.all(12.0.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.editprofile.value = false;
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
                              controller.saveProfileData();
                            },
                            child: CustomButton(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: MediaQuery.of(context).size.height * 0.05,
                              buttonText: "Save",
                            ))
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ),
      ),
    );
  }
}
