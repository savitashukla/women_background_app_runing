import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/post_login/health_query_controller.dart';
import 'package:o_woman/app/views/health_query/help_weight_health_query/help_weight_health_query.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/custom_toast.dart';
import 'package:o_woman/utils/helper_widgets/custome_button.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class DOBScreen extends StatelessWidget {
  DOBScreen({super.key});
  HealthQueryController introScreenController =
      Get.put(HealthQueryController());
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: SafeArea(
          top: false,
          left: true,
          right: true,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.homeBgColor,
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
              child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.h,
                    ),
                    Center(child: Image.asset(ImagesUrl.dobImage)),
                    HelperWidget().testMethod(18.0, FontWeight.w500,
                        Colors.black, "Enter your date of birth"),
                    height10,
                    Obx(
                      () => Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 00.w,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _selectDate(context);
                            },
                            child: Container(
                                height: 38.h,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 5),
                                width: MediaQuery.of(context).size.width,
                                padding: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(10.0.r),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HelperWidget().testMethod(
                                        16.0,
                                        FontWeight.w400,
                                        Colors.black,
                                        introScreenController
                                            .dateOfBirthText.value),
                                    GestureDetector(
                                      onTap: () {
                                        _selectDate(context);
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: SvgPicture.asset(
                                          ImagesUrl.calendarIcon,
                                        ),
                                      ),
                                    )
                                  ],
                                )),
                          ) /*CustomTextFormField(
                          onTap: () {
                            _selectDate(context);
                            FocusScope.of(context).unfocus();

                          },
                          onChanged:(value)
                          {
                            FocusScope.of(context).unfocus();
                          },
                          enableborderColor: Colors.transparent,
                          controller:
                              introScreenController.dateOfBirthController.value,
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset(
                              ImagesUrl.calendarIcon,
                            ),
                          ),
                        ),*/
                          ),
                    ),
                    height20,
                    HelperWidget().testMethod(18.0, FontWeight.w500,
                        Colors.black, "Select your gender"),
                    height10,
                    Obx(
                      () => introScreenController.male.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.male.value = false;
                                introScreenController.female.value = false;
                              },
                              child: Container(
                                  height: 38.h,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.colorPrimary,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      HelperWidget().testMethod(
                                          16.0,
                                          FontWeight.w500,
                                          Colors.white,
                                          "Female"),
                                    ],
                                  )),
                            )
                          : GestureDetector(
                              onTap: () {
                                introScreenController.male.value = true;
                                introScreenController.female.value = false;
                              },
                              child: Container(
                                  height: 38.h,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 5),
                                  width: MediaQuery.of(context).size.width,
                                  padding: const EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6),
                                    color: AppColors.whiteColor,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      HelperWidget().testMethod(
                                          16.0,
                                          FontWeight.w400,
                                          Colors.black,
                                          "Female"),
                                    ],
                                  )),
                            ),
                    ),
                    Obx(
                      () => introScreenController.female.value
                          ? GestureDetector(
                              onTap: () {
                                introScreenController.male.value = false;
                                introScreenController.female.value = false;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 5.w),
                                height: 38.h,
                                padding: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.colorPrimary,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HelperWidget().testMethod(16.0,
                                        FontWeight.w400, Colors.white, "Male"),
                                  ],
                                ),
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                introScreenController.male.value = false;
                                introScreenController.female.value = true;
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 5),
                                height: 38.h,
                                padding: const EdgeInsets.only(left: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: AppColors.whiteColor,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    HelperWidget().testMethod(16.0,
                                        FontWeight.w400, Colors.black, "Male"),
                                  ],
                                ),
                              ),
                            ),
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        width30,
                        GestureDetector(
                          onTap: () {
                            if (!introScreenController.changeDOB.value) {
                              CustomToast.showErrorToast(
                                  msg: "Select your date of birth");
                            } else if (introScreenController.male.value ||
                                introScreenController.female.value) {
                              Navigator.pushNamed(
                                  context, Routes.applicationScreen);
                            } else {
                              CustomToast.showErrorToast(
                                  msg: "Select your Gender");
                            }
                          },
                          child: Obx(
                            () => HelpWeightHealthQuery().nextContainer(
                                buttonColor: introScreenController
                                                .changeDOB.value &&
                                            introScreenController.male.value ||
                                        introScreenController.female.value
                                    ? true
                                    : false),
                          ),
                        ),
                      ],
                    )
                  ]),
            ),
          )),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? picked;

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              height10,
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 6.h,
                  width: 46.w,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 0.h),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      color: AppColors.mainColor.withOpacity(0.3)),
                ),
              ),
              height10,

              Text(
                "Select date",
                style: w600_16Poppins(color: AppColors.blackColor),
              ),
              height15,

              // 10.h.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // width10,
                  Text(
                    "Date",
                    style: w600_16Poppins(
                        color: AppColors.blackColor.withOpacity(0.6)),
                  ),
                  width30,
                  Text(
                    "Month",
                    style: w600_16Poppins(
                        color: AppColors.blackColor.withOpacity(0.6)),
                  ),
                  width30,
                  Text(
                    "Year",
                    style: w600_16Poppins(
                        color: AppColors.blackColor.withOpacity(0.6)),
                  ),
                ],
              ),
              height20,

              SizedBox(
                height: MediaQuery.of(context).copyWith().size.height / 8,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                      textTheme: CupertinoTextThemeData(
                          dateTimePickerTextStyle: w400_17Poppins())),
                  child: CupertinoDatePicker(
                    dateOrder: DatePickerDateOrder.dmy,
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: introScreenController.initialDate.value,
                    onDateTimeChanged: (v) {
                      picked = v;
                      introScreenController.changeDOB.value = true;
                    },
                    minimumDate: DateTime(1924),
                    maximumDate: DateTime.now(),
                  ),
                ),
              ),
              height20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    width: 150,
                    height: 40,
                    buttonText: "Cancel",
                    onTap: () {
                      Navigator.pop(context);
                    },
                    buttonTextStyle: w500_15Poppins(color: AppColors.mainColor),
                    buttonColor: Colors.white,
                    borderColor: AppColors.mainColor,
                  ),
                  width10,
                  CustomButton(
                    buttonText: "Save",
                    onTap: () {
                      if (picked != null) {
                        introScreenController.setDate(picked!);
                        introScreenController.dateOfBirthText.value =
                            DateFormat('dd-MM-yyyy')
                                .format(DateTime.parse(picked.toString()));
                        introScreenController.initialDate.value =
                            picked ?? DateTime.now();
                      }
                      Navigator.pop(context);
                    },
                    width: 150,
                    height: 40,
                  )
                ],
              )
            ],
          ),
        );
        //  Column(
        //   mainAxisSize: MainAxisSize.min,
        //   children: [
        //     SizedBox(
        //       height: MediaQuery.of(context).copyWith().size.height / 1,
        //       child: CupertinoTheme(
        //         data: CupertinoThemeData(
        //           textTheme: CupertinoTextThemeData(
        //             dateTimePickerTextStyle: w400_17Poppins(),
        //           ),
        //         ),
        //         child: CupertinoDatePicker(
        //           dateOrder: DatePickerDateOrder.dmy,
        //           mode: CupertinoDatePickerMode.date,
        //           initialDateTime: DateTime.now(),
        //           onDateTimeChanged: (v) {
        //             // Handle the selected date in real-time if needed
        //           },
        //           minimumDate: DateTime(1924),
        //           maximumDate: DateTime(3024),
        //         ),
        //       ),
        //     ),
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         CupertinoButton(
        //           onPressed: () {
        //             Navigator.of(context).pop(); // Close the bottom sheet
        //           },
        //           child: const Text('Cancel'),
        //         ),
        //         CupertinoButton(
        //           onPressed: () {
        //             // Save the picked date and update the state using GetX
        //             Navigator.of(context).pop();
        //           },
        //           child: const Text('Save'),
        //         ),
        //       ],
        //     ),
        //   ],
        // );
      },
    );
  }

  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime? picked = await showModalBottomSheet(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return SizedBox(
  //         height: MediaQuery.of(context).copyWith().size.height / 1,
  //         child: CupertinoTheme(
  //           data: CupertinoThemeData(
  //               textTheme: CupertinoTextThemeData(
  //                   dateTimePickerTextStyle: w400_17Poppins())),
  //           child: CupertinoDatePicker(
  //             dateOrder: DatePickerDateOrder.dmy,
  //             mode: CupertinoDatePickerMode.date,
  //             initialDateTime: DateTime.now(),
  //             onDateTimeChanged: (v) {
  //               // setState(() {
  //               //   selectedToDate = v;
  //               //   endDate = selectedToDate.toString().substring(0, 11);
  //               //   // toController.text = selectedToDate.toString().substring(0, 11);
  //               // });
  //             },
  //             minimumDate: DateTime(1924),
  //             maximumDate: DateTime(3024),
  //           ),
  //         ),
  //       );
  //     },
  //   );

  //   if (picked != null && picked != introScreenController.selectedDate.value) {
  //     introScreenController.setDate(picked);
  //     introScreenController.dateOfBirthText.value =
  //         DateFormat('dd-MM-yyyy').format(DateTime.parse(picked.toString()));
  //   }
  // }

  // Future<void> _selectDate(BuildContext context) async {
  //   DateTime? picked = await
  //   showDatePicker(
  //     context: context,
  //     initialDate: DateTime(2004),
  //     firstDate: DateTime(1940),
  //     lastDate: DateTime(2006),
  //   );

  //   if (picked != null && picked != introScreenController.selectedDate.value) {
  //     introScreenController.setDate(picked);
  //     //  introScreenController.dateOfBirthController.value.text = DateFormat('dd-MM-yyyy').format(DateTime.parse(picked.toString()));
  //     introScreenController.dateOfBirthText.value =
  //         DateFormat('dd-MM-yyyy').format(DateTime.parse(picked.toString()));
  //   }
  // }
}
