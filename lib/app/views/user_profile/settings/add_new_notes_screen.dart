import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/viewmodels/hum_profile/be_safe_controller.dart';
import 'package:o_woman/app/views/cycle_track/calendar/cycle_calendar.dart';
import 'package:o_woman/app/views/cycle_track/calendar/cycler_calendar_day_show.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/bottom_sheet_call.dart';
import 'package:o_woman/utils/helper_widgets/customTextformfield.dart';
import 'package:o_woman/utils/helper_widgets/custome_button.dart';
import 'package:o_woman/utils/helper_widgets/monthview_widget.dart';
import 'package:o_woman/utils/helper_widgets/notes_widget.dart';

class AddNewNotesScreen extends StatefulWidget {
  const AddNewNotesScreen({super.key});

  @override
  State<AddNewNotesScreen> createState() => _AddNewNotesScreenState();
}

class _AddNewNotesScreenState extends State<AddNewNotesScreen> {
  BeSafeController beSafeController = Get.put(BeSafeController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
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
            ),
          ),
          title: Text(
            beSafeController.editNotes.value ? "Edit" : "Add Note",
            style: w500_18Poppins(
              color: AppColors.colorPrimaryTestDarkMore,
            ),
          ),
          actions: [
            Text(
              DateFormat('dd-MM-y').format(DateTime.now()),
              style: w400_14Poppins(
                color: AppColors.colorPrimaryTestDarkMore,
              ),
            ),
            width10,
            GestureDetector(
              onTap: () {
                _selectMonth(context, 5);
              },
              child: SvgPicture.asset(
                ImagesUrl.iconCalendarAll,
              ),
            ),
            width10,
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.85,
            child: Obx(
              () => Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CommonTextFormField(
                    //   label: "Title",
                    //   hintText: "Menustruation",
                    // )
                    Text(
                      "Title",
                      style: w400_14Poppins(
                          color: AppColors.blackColor.withOpacity(0.5)),
                    ),
                    height5,
                    CustomTextFormField(
                      // borderColor: AppColors.colorGray,
                      enableborderColor: AppColors.colorGray.withOpacity(0.3),

                      hintText: "Menustruation",
                      hintStyle: w400_14Poppins(
                          color: AppColors.blackColor.withOpacity(0.7)),
                    ),
                    height10,
                    Text(
                      "Description",
                      style: w400_14Poppins(
                          color: AppColors.blackColor.withOpacity(0.5)),
                    ),
                    height5,
                    CustomTextFormField(
                      // borderColor: AppColors.colorGray,
                      enableborderColor: AppColors.colorGray.withOpacity(0.3),

                      hintText:
                          "It is time to understand a menustruating girl is as beautiful"
                          "as a pregnant lady. It is time to embrace and adore the beginning of life, which"
                          "begins with this proces of menustruation.",
                      hintStyle: w400_14Poppins(
                          color: AppColors.blackColor.withOpacity(0.7)),
                      maxlines: 6,
                    ),
                    height10,
                    Text("Tags Suggestion",
                        style: w400_14Poppins(
                          color: AppColors.blackColor.withOpacity(0.5),
                        )),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        decoration:
                            const BoxDecoration(color: AppColors.whiteColor),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 12.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NotesTagSuggestionContainer(
                                    onTap: () {
                                      beSafeController.notesTravel.value =
                                          !beSafeController.notesTravel.value;
                                    },
                                    boolValue:
                                        beSafeController.notesTravel.value,
                                    title: 'Travel',
                                    bgColor:
                                        AppColors.mainColor.withOpacity(0.15),
                                  ),
                                  width10,
                                  NotesTagSuggestionContainer(
                                    onTap: () {
                                      beSafeController.loveTravel.value =
                                          !beSafeController.loveTravel.value;
                                    },
                                    boolValue:
                                        beSafeController.loveTravel.value,
                                    title: 'Love',
                                    bgColor:
                                        AppColors.mainColor.withOpacity(0.15),
                                  ),
                                  width10,
                                  NotesTagSuggestionContainer(
                                    onTap: () {
                                      beSafeController.natureTravel.value =
                                          !beSafeController.natureTravel.value;
                                    },
                                    boolValue:
                                        beSafeController.natureTravel.value,
                                    title: 'Nature',
                                    bgColor:
                                        AppColors.mainColor.withOpacity(0.15),
                                  ),
                                  width10,
                                  NotesTagSuggestionContainer(
                                    onTap: () {
                                      beSafeController.photographTravel.value =
                                          !beSafeController
                                              .photographTravel.value;
                                    },
                                    boolValue:
                                        beSafeController.photographTravel.value,
                                    title: 'Photography',
                                    bgColor:
                                        AppColors.mainColor.withOpacity(0.15),
                                  ),
                                ],
                              ),
                              height10,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  NotesTagSuggestionContainer(
                                    onTap: () {
                                      beSafeController.friendsTravel.value =
                                          !beSafeController.friendsTravel.value;
                                    },
                                    boolValue:
                                        beSafeController.friendsTravel.value,
                                    title: 'Friends',
                                    bgColor:
                                        AppColors.mainColor.withOpacity(0.15),
                                  ),
                                  width10,
                                  NotesTagSuggestionContainer(
                                    onTap: () {
                                      beSafeController.empowermentTravel.value =
                                          !beSafeController
                                              .empowermentTravel.value;
                                    },
                                    boolValue: beSafeController
                                        .empowermentTravel.value,
                                    title: 'Empowerment',
                                    bgColor:
                                        AppColors.mainColor.withOpacity(0.15),
                                  ),
                                  width10,
                                  NotesTagSuggestionContainer(
                                    onTap: () {
                                      beSafeController.foodTravel.value =
                                          !beSafeController.foodTravel.value;
                                    },
                                    boolValue:
                                        beSafeController.foodTravel.value,
                                    title: 'Food',
                                    bgColor:
                                        AppColors.mainColor.withOpacity(0.15),
                                  ),
                                ],
                              ),
                              height10,
                              Text(
                                "Description",
                                style: w400_14Poppins(
                                    color:
                                        AppColors.blackColor.withOpacity(0.5)),
                              ),
                              height5,
                              CustomTextFormField(
                                hintText: "Enter tag name",
                                enableborderColor:
                                    AppColors.colorGray.withOpacity(0.3),
                                hintStyle: w400_14Poppins(
                                    color:
                                        AppColors.blackColor.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        )),
                    height10,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Attachments",
                            style: w400_14Poppins(
                              color: AppColors.blackColor.withOpacity(0.5),
                            )),
                        GestureDetector(
                            onTap: () {
                              BottomSheetCall()
                                  .addAttachmentsBottomSheet(beSafeController);
                            },
                            child: SvgPicture.asset(ImagesUrl.attachmentsIcon)),
                      ],
                    ),

                    Obx(() => beSafeController.imagePicker.value.isNotEmpty
                        ? Container(
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height * 0.05,
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.all(8.0.sp),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.05,
                                            child: Image.file(
                                              File(beSafeController
                                                  .imagePicker.value),
                                            )),
                                        width15,
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: Text(beSafeController
                                              .imagePicker.value
                                              .toString()
                                              .split('/')
                                              .last),
                                        )
                                      ]),
                                  InkWell(
                                      onTap: () {
                                        beSafeController.imagePicker.value = "";
                                      },
                                      child: SvgPicture.asset(
                                          ImagesUrl.removeIcon))
                                ],
                              ),
                            ),
                          )
                        : height10),

                    Row(
                      children: [
                        Text(
                          "Hyderabad - ",
                          style: w400_14Poppins(),
                        ),
                        Text(
                          "26° C",
                          style: w400_14Poppins(
                              color: AppColors.blackColor.withOpacity(0.5)),
                        ),
                      ],
                    ),
                    height30,
                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: CustomButton(
                                  buttonText: "Cancel",
                                  buttonColor: AppColors.whiteColor,
                                  borderColor: AppColors.mainColor,
                                  textColor: AppColors.mainColor,
                                )),
                          ),
                          width15,
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: CustomButton(
                                  buttonText: "Save",
                                  textColor: AppColors.whiteColor,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _selectMonth(BuildContext context, int yearIndex) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(top: 3.sp,left: 10.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Select Days",
                style: w400_16Poppins(),
              ),
              const Divider(
                thickness: 0.5,
              ),
              const MonthViewWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel",
                          style:
                              w500_14Poppins(color: AppColors.colorPrimary))),
                  Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Text("Save",
                        style: w500_14Poppins(color: AppColors.colorPrimary)),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
