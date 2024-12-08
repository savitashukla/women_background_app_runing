import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/viewmodels/home_controller/pill_corner_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/bottom_sheet_call.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import 'package:o_woman/utils/helper_widgets/switch.dart';

class AddPillScreen extends StatefulWidget {
  const AddPillScreen({super.key});

  @override
  State<AddPillScreen> createState() => _AddPillScreenState();
}

class _AddPillScreenState extends State<AddPillScreen> {
  PillCornerController pillCornerController = Get.put(PillCornerController());

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
            "Pill Corner",
            style: w400_16Poppins(
              color: AppColors.blackColor.withOpacity(0.7),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Obx(
                () => pillCornerController.loggedPills.value
                    ? Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 8.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  height5,
                                  HelperWidget().testMethodStartAlign(
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.blackColor,
                                    "Logged Pills",
                                  ),
                                  height10,
                                  LoggedPillWidget(
                                    context,
                                    "10:00 AM",
                                    "Implant",
                                    AppColors.mainColor.withOpacity(0.05),
                                    true,
                                  ),
                                  height15,
                                  LoggedPillWidget(
                                      context,
                                      "05:00 AM, 07:00 PM",
                                      "Vitamin A",
                                      AppColors.whiteColor,
                                      false),
                                  height15,
                                  LoggedPillWidget(context, "04:00 PM", "PCM",
                                      AppColors.whiteColor, false),
                                ],
                              ),
                            ),
                          ),
                          height20,
                        ],
                      )
                    : const SizedBox(),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: AppColors.whiteColor),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Contraception",
                          style: w400_16Poppins(
                              color: AppColors.blackColor.withOpacity(0.8)),
                        ),
                        height10,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                              () => Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                    pillCornerController
                                        .contraceptiveList.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            for (int i = 0;
                                                i <
                                                    pillCornerController
                                                        .contraceptiveList
                                                        .length;
                                                i++) {
                                              if (i == index) {
                                                pillCornerController
                                                        .selectedContraceptiveItems![
                                                            i]
                                                        .value =
                                                    !pillCornerController
                                                        .selectedContraceptiveItems![
                                                            i]
                                                        .value;
                                              } else {
                                                pillCornerController
                                                    .selectedContraceptiveItems![
                                                        i]
                                                    .value = false;
                                              }
                                            }
                                          },
                                          child: Obx(
                                            () => Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.045,
                                              decoration: BoxDecoration(
                                                  color: pillCornerController
                                                              .selectedContraceptiveItems![
                                                                  index]
                                                              .value ==
                                                          true
                                                      ? AppColors.mainColor
                                                      : AppColors.whiteColor,
                                                  border: Border.all(
                                                    color: pillCornerController
                                                            .selectedContraceptiveItems![
                                                                index]
                                                            .value
                                                        ? Colors.transparent
                                                        : AppColors.colorGray
                                                            .withOpacity(0.5),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0.sp),
                                                child: Text(
                                                    pillCornerController
                                                            .contraceptiveList[
                                                        index],
                                                    style: w400_12Poppins()),
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                            height10,
                            Text(
                              "Supplements",
                              style: w400_16Poppins(
                                  color: AppColors.blackColor.withOpacity(0.8)),
                            ),
                            height10,
                            Obx(
                              () => Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: List.generate(
                                    pillCornerController.supplementsList.length,
                                    (index) => GestureDetector(
                                          onTap: () {
                                            for (int i = 0;
                                                i <
                                                    pillCornerController
                                                        .supplementsList.length;
                                                i++) {
                                              if (i == index) {
                                                pillCornerController
                                                        .selectedsupplementsItems![
                                                            i]
                                                        .value =
                                                    !pillCornerController
                                                        .selectedsupplementsItems![
                                                            i]
                                                        .value;
                                              } else {
                                                pillCornerController
                                                    .selectedsupplementsItems![
                                                        i]
                                                    .value = false;
                                              }
                                            }
                                          },
                                          child: Obx(
                                            () => Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.045,
                                              decoration: BoxDecoration(
                                                  color: pillCornerController
                                                              .selectedsupplementsItems![
                                                                  index]
                                                              .value ==
                                                          true
                                                      ? AppColors.mainColor
                                                      : AppColors.whiteColor,
                                                  border: Border.all(
                                                    color: pillCornerController
                                                            .selectedsupplementsItems![
                                                                index]
                                                            .value
                                                        ? Colors.transparent
                                                        : AppColors.colorGray
                                                            .withOpacity(0.5),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0.sp),
                                                child: Text(
                                                    pillCornerController
                                                        .supplementsList[index],
                                                    style: w400_12Poppins()),
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                            height15,
                            Text(
                              "Other",
                              style: w400_16Poppins(
                                  color: AppColors.blackColor.withOpacity(0.8)),
                            ),
                            height10,
                            Obx(
                              () => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  controller: pillCornerController
                                      .pillNameController.value,
                                  decoration: InputDecoration(
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              vertical: 15.0, horizontal: 15.0),
                                      hintText: "Enter Pill Name Here",
                                      border: InputBorder.none,
                                      hintStyle: w400_12Poppins(
                                          color: AppColors.colorGray
                                              .withOpacity(0.95)),
                                      fillColor: AppColors.whiteColor,
                                      filled: true,
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0.r),
                                        borderSide: const BorderSide(
                                          color: AppColors.colorGray,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.colorGray
                                                  .withOpacity(0.3))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.colorGray
                                                  .withOpacity(0.3)))),
                                ),
                              ),
                            ),
                            height15,
                            Obx(
                              () => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  controller: pillCornerController
                                      .desccriptionController.value,
                                  decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 15.0.h, horizontal: 15.0.w),
                                      hintText: "Enter Description",
                                      border: InputBorder.none,
                                      hintStyle: w400_12Poppins(
                                          color: AppColors.colorGray
                                              .withOpacity(0.95)),
                                      fillColor: AppColors.whiteColor,
                                      filled: true,
                                      disabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0.r),
                                        borderSide: const BorderSide(
                                          color: AppColors.colorGray,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.colorGray
                                                  .withOpacity(0.3))),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: AppColors.colorGray
                                                  .withOpacity(0.3)))),
                                ),
                              ),
                            ),
                            height15,
                            Row(
                              children: [
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      pillCornerController.pillShape1.value =
                                          !pillCornerController
                                              .pillShape1.value;
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.09,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          color: pillCornerController
                                                  .pillShape1.value
                                              ? AppColors.buttonColor
                                                  .withOpacity(0.2)
                                              : AppColors.whiteColor,
                                          border: Border.all(
                                              color: pillCornerController
                                                      .pillShape1.value
                                                  ? Colors.transparent
                                                  : AppColors.buttonColor
                                                      .withOpacity(0.2)),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0.sp),
                                        child: SvgPicture.asset(
                                          ImagesUrl.pillShape1Icon,
                                          color: pillCornerController
                                                  .pillShape1.value
                                              ? AppColors.mainColor
                                              : AppColors.mainColor
                                                  .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                width15,
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      pillCornerController.pillShape2.value =
                                          !pillCornerController
                                              .pillShape2.value;
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.09,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          color: pillCornerController
                                                  .pillShape2.value
                                              ? AppColors.buttonColor
                                                  .withOpacity(0.2)
                                              : AppColors.whiteColor,
                                          border: Border.all(
                                              color: pillCornerController
                                                      .pillShape2.value
                                                  ? Colors.transparent
                                                  : AppColors.buttonColor
                                                      .withOpacity(0.2)),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0.sp),
                                        child: SvgPicture.asset(
                                          ImagesUrl.pillShape2Icon,
                                          color: pillCornerController
                                                  .pillShape2.value
                                              ? AppColors.mainColor
                                              : AppColors.mainColor
                                                  .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                width15,
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      pillCornerController.pillShape3.value =
                                          !pillCornerController
                                              .pillShape3.value;
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.09,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          color: pillCornerController
                                                  .pillShape3.value
                                              ? AppColors.buttonColor
                                                  .withOpacity(0.2)
                                              : AppColors.whiteColor,
                                          border: Border.all(
                                              color: pillCornerController
                                                      .pillShape3.value
                                                  ? Colors.transparent
                                                  : AppColors.buttonColor
                                                      .withOpacity(0.2)),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0.sp),
                                        child: SvgPicture.asset(
                                          ImagesUrl.pillShape3Icon,
                                          color: pillCornerController
                                                  .pillShape3.value
                                              ? AppColors.mainColor
                                              : AppColors.mainColor
                                                  .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                width15,
                                Obx(
                                  () => InkWell(
                                    onTap: () {
                                      pillCornerController.pillShape4.value =
                                          !pillCornerController
                                              .pillShape4.value;
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.09,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      decoration: BoxDecoration(
                                          color: pillCornerController
                                                  .pillShape4.value
                                              ? AppColors.buttonColor
                                                  .withOpacity(0.2)
                                              : AppColors.whiteColor,
                                          border: Border.all(
                                              color: pillCornerController
                                                      .pillShape4.value
                                                  ? Colors.transparent
                                                  : AppColors.buttonColor
                                                      .withOpacity(0.2)),
                                          borderRadius:
                                              BorderRadius.circular(8.r)),
                                      child: Padding(
                                        padding: EdgeInsets.all(5.0.sp),
                                        child: SvgPicture.asset(
                                          ImagesUrl.pillShape4Icon,
                                          color: pillCornerController
                                                  .pillShape4.value
                                              ? AppColors.mainColor
                                              : AppColors.mainColor
                                                  .withOpacity(0.2),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            height10,
                            Align(
                              alignment: Alignment.centerRight,
                              child: Obx(
                                () => Container(
                                  height: MediaQuery.of(context).size.height *
                                      0.045,
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: pillCornerController
                                                  .pillShape1.value ||
                                              pillCornerController
                                                  .pillShape2.value ||
                                              pillCornerController
                                                  .pillShape3.value ||
                                              pillCornerController
                                                  .pillShape4.value
                                          ? AppColors.buttonColor
                                          : AppColors.disableColor),
                                  child: Center(
                                    child: Text(
                                      "Add Pill",
                                      style: w400_14Poppins(
                                          color: AppColors.whiteColor),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            height50,
                            InkWell(
                              onTap: () {
                                BottomSheetCall().setReminderBottomSheet();
                              },
                              child: Obx(
                                () => Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5.r),
                                      color: (pillCornerController
                                                  .selectedContraceptiveItems!
                                                  .any((value) =>
                                                      value == true) &&
                                              pillCornerController
                                                  .selectedsupplementsItems!
                                                  .any(
                                                      (value) => value == true))
                                          ? AppColors.buttonColor
                                          : AppColors.disableColor),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                            ImagesUrl.clockReminderIcon),
                                        width10,
                                        Text(
                                          "Set Reminder",
                                          style: w400_14Poppins(
                                              color: AppColors.whiteColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

Widget LoggedPillWidget(BuildContext context, String time, String pillName,
    Color boxColor, bool toggle,
    {Color? imgColor}) {
  return Container(
    // height: MediaQuery.of(context).size.height * 0.07,
    decoration: BoxDecoration(
        border: Border.all(color: AppColors.colorGray.withOpacity(0.5)),
        borderRadius: BorderRadius.circular(6.r),
        color: boxColor),
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: AppColors.maroonColor.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10.r)),
                    child: Padding(
                      padding: EdgeInsets.all(5.0.sp),
                      child: SvgPicture.asset(
                        ImagesUrl.loggedPillIcon,
                        color: imgColor ?? AppColors.maroonColor,
                      ),
                    )),
                width15,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HelperWidget().testMethodStartAlign(
                      14.0,
                      FontWeight.w400,
                      AppColors.blackColor.withOpacity(0.8),
                      time,
                    ),
                    HelperWidget().testMethodStartAlign(
                      14.0,
                      FontWeight.w400,
                      AppColors.privacyPolicyText,
                      pillName,
                    ),
                  ],
                ),
              ],
            ),
            CustomSwitch(initialValue: toggle, onChanged: (value) {})
          ],
        ),
      ),
    ),
  );
}
