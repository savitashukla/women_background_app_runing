import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/utils/helper_widgets/monthview_widget.dart';

import '../../../../../constants/app_colors.dart';
import '../../../../../constants/font_size.dart ';
import '../../../../models/calander_config.dart';
import '../../../../viewmodels/calendar/new_calander_controller.dart';
import '../../../../viewmodels/notes/notes_controller.dart';
import '../../../calander_date_info.dart';
import '../../../new_calandar/calander_day_widget_edit.dart';
import '../../../new_calandar/calander_view_component_edit.dart';

class NoteFilterDateBottom {
  NotesControllers controllers = Get.find();
  NewCalendarController controller = Get.find();

  void noteFilterDateBottomBottomSheet(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime minDate = DateTime(now.year - 5, 1, 1);
    DateTime maxDate = DateTime(now.year + 5, 1, 1);

    showModalBottomSheet(
        backgroundColor: AppColors.colorGrayDarkBg,
        context: context,
        isScrollControlled: true,
        transitionAnimationController: AnimationController(
          vsync: Navigator.of(context),
          duration: const Duration(seconds: 2), // Adjust duration as needed
        ),
        builder: (context) {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.only(
                bottom: 20.h, left: 10.w, top: 20.h, right: 10.w),
            decoration: BoxDecoration(
                color: AppColors.whiteColor,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(
                      0.0,
                      5.0,
                    ),
                    blurRadius: 1.0,
                    spreadRadius: .3.r,
                    color: AppColors.colorPrimary,
                    //   inset: true,
                  ),
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.r),
                    topRight: Radius.circular(20.r))),
            child: Wrap(
              children: [
                Text("Select a date range", style: w400_16Poppins()),
                Container(
                  height: 15.h,
                ),
                Wrap(
                  spacing: 10.w,
                  runSpacing: 10.h,
                  children: List.generate(controllers.notesFilterName.length,
                      (index) => listOfString(index, context)),
                ),
                Container(
                  height: 20.h,
                ),
                Obx(
                  () => controllers.selectedDateRange.isNotEmpty &&
                          controllers.selectedDateRange["8"] != null &&
                          controllers.selectedDateRange["8"]
                      ? const MonthViewWidget()
                      : const IgnorePointer(),
                ),
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
        });
  }

  Widget listOfString(index, context) {
    return GestureDetector(
      onTap: () {
        if (controllers.selectedDateRange.isNotEmpty) {
          controllers.selectedDateRange.forEach((key, _) {
            controllers.selectedDateRange[key] = false;
          });
        }
        controllers.selectedDateRange["$index"] = true;

        print(" cechk ${controllers.selectedDateRange["$index"]}");
      },
      child: Obx(
        () => Container(
          height: 30.h,
          decoration: controllers.selectedDateRange.isNotEmpty &&
                  controllers.selectedDateRange["$index"] != null &&
                  controllers.selectedDateRange["$index"]
              ? BoxDecoration(
                  color: AppColors.colorPrimary,
                  /* border: Border.all(
                color: AppColors.bottomSheetBorder,
              ),*/
                  borderRadius: BorderRadius.circular(6))
              : BoxDecoration(
                  color: AppColors.whiteColor,
                  border: Border.all(
                    color: AppColors.bottomSheetBorder,
                  ),
                  borderRadius: BorderRadius.circular(6)),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
            child: Wrap(
              alignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                width5,
                Text(controllers.notesFilterName[index],
                    style: w400_14Poppins()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
