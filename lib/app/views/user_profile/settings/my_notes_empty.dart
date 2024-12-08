import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/calendar/new_calander_controller.dart';
import 'package:o_woman/app/viewmodels/hum_profile/be_safe_controller.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/app/views/user_profile/settings/settings_widget/note_filter_date_bottom.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';

import '../../../viewmodels/notes/notes_controller.dart';

class MyNotesScreen extends StatefulWidget {
  const MyNotesScreen({super.key});

  @override
  State<MyNotesScreen> createState() => _MyNotesScreenState();
}

class _MyNotesScreenState extends State<MyNotesScreen> {
  NewCalendarController controller = Get.put(NewCalendarController());
  BeSafeController beSafeController = Get.put(BeSafeController());
  NotesControllers notesControllers = Get.put(NotesControllers());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffoldBackgroundColor,
        body: Padding(
          padding: EdgeInsets.all(12.0.sp),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
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
                      Text(
                        "My Notes",
                        style: w500_18Poppins(
                          color: AppColors.colorPrimaryTestDarkMore,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          NoteFilterDateBottom()
                              .noteFilterDateBottomBottomSheet(context);
                        },
                        child: SvgPicture.asset(
                          ImagesUrl.iconCalendarAll,
                        ),
                      ),
                      PopupMenuButton(onSelected: (value) {
                        Navigator.pushNamed(context, Routes.recycleBin);

                        controller.selectedItem.value = value;
                        print(value);
                      }, itemBuilder: (BuildContext bc) {
                        return [
                          PopupMenuItem(
                            value: '/Recycle Bin',
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.recycleBin);
                              },
                              child: const Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                  ),
                                  Text("  Recycle Bin ")
                                ],
                              ),
                            ),
                          )
                        ];
                      })
                    ],
                  )
                ],
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (BuildContext context, int index) {
                      return notesListWidget(context);
                    }),
              ),
            ],
          ),
        ),
        floatingActionButton: SizedBox(
          height: 80.h,
          width: 110.w,
          child: FittedBox(
            child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.pushNamed(context, Routes.addNewNotesScreen);
                beSafeController.editNotes.value = false;
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r)),
              icon: Container(
                  height: 30.h,
                  decoration: const BoxDecoration(
                      color: AppColors.whiteColor, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.add,
                    color: AppColors.mainColor,
                  )),
              label: Text('Add notes',
                  style: w500_18Poppins(
                    color: AppColors.whiteColor,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}

Widget notesListWidget(BuildContext context) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.calanderViewNote);
          },
          child: Container(
            height: 80.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      //Image
                      Container(
                        height: 57.h,
                        width: 60.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: const DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  'https://www.shutterstock.com/image-photo/portrait-happy-indian-asian-young-260nw-1833243328.jpg'),
                            )),
                      ),
                      //Title/subtitile
                      Padding(
                        padding: EdgeInsets.only(top: 15.h, left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Menstruation',
                              style: TextStyle(
                                  fontSize: getFontSize(16),
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.colorPrimaryTestDarkMore),
                            ),
                            Text(
                              'It is time to take care of out self',
                              style: TextStyle(
                                  fontSize: getFontSize(12),
                                  color: AppColors.colorPrimaryTestDarkMore),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Text('12 Dec 2023',
                                style: TextStyle(
                                    fontSize: getFontSize(12),
                                    color: AppColors.colorPrimaryTestDarkMore)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      height10,
    ],
  );
}

Widget emptyNotesWidget(BuildContext context) {
  BeSafeController beSafeController = Get.put(BeSafeController());
  return Container(
    // height: ScreenConfig.height * 0.8,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.r)),
        color: AppColors.scaffoldBackgroundColor),
    child: Padding(
      padding: EdgeInsets.all(8.0.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(ImagesUrl.noNotes),
          Text(
            "Having no journal in the list",
            style: w500_16Poppins(),
          ),
          height10,
          Text(
            "Lorum ipsum is simply dummy text of the "
            "printing and typesetting industry.",
            textAlign: TextAlign.center,
            style: w400_14Poppins(color: AppColors.blackColor),
          ),
          height15,
          InkWell(
            onTap: () {
              beSafeController.editNotes.value = false;
              Navigator.pushNamed(context, Routes.addNewNotesScreen);
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.r)),
                  color: AppColors.mainColor),
              child: Padding(
                padding: EdgeInsets.all(10.0.sp),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.add,
                          size: 20.sp,
                          color: AppColors.mainColor,
                        ),
                      ),
                      width10,
                      Text(
                        "Add Notes",
                        style: w500_14Poppins(color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
