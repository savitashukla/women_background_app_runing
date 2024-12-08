import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/calendar/new_calander_controller.dart';
import 'package:o_woman/app/viewmodels/hum_profile/be_safe_controller.dart';
import 'package:o_woman/app/viewmodels/view_note_controller.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

class CalanderViewNote extends StatelessWidget {
  CalanderViewNote({super.key});

  ViewNoteController controller = Get.put(ViewNoteController());
  BeSafeController beSafeController = Get.put(BeSafeController());
  NewCalendarController calendarController = Get.put(NewCalendarController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.homeBgColor,
        body: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: AppColors.colorPrimaryTestDarkMore,
                    )),
                Text(
                  "View Note",
                  style: w500_18Poppins(
                    color: AppColors.colorPrimaryTestDarkMore,
                  ),
                ),
                const Spacer(),
                PopupMenuButton(onSelected: (value) {
                  calendarController.selectedItem.value = value;
                  print(value);
                }, itemBuilder: (BuildContext bc) {
                  return [
                    // PopupMenuItem(
                    //   value: '/view',
                    //   child: GestureDetector(
                    //     onTap: () {
                    //       Navigator.pushNamed(context, Routes.calanderViewNote);
                    //     },
                    //     child: const Row(
                    //       children: [
                    //         Icon(
                    //           Icons.remove_red_eye,
                    //           color: Colors.grey,
                    //         ),
                    //         Text(" View")
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    PopupMenuItem(
                      value: '/edit',
                      child: GestureDetector(
                        onTap: () {
                          beSafeController.editNotes.value = true;
                          Navigator.pushNamed(
                              context, Routes.addNewNotesScreen);
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.edit,
                              color: Colors.grey,
                            ),
                            Text(" Edit")
                          ],
                        ),
                      ),
                    ),
                    PopupMenuItem(
                      value: '/delete',
                      child: GestureDetector(
                        onTap: () {},
                        child: const Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.grey,
                            ),
                            Text(" Delete")
                          ],
                        ),
                      ),
                    )
                  ];
                })

                // InkWell(
                //   onTap: () {
                //     beSafeController.editNotes.value = true;
                //     Navigator.pushNamed(context, Routes.addNewNotesScreen);
                //   },
                //   child: const Row(
                //     children: [
                //       Icon(
                //         Icons.edit,
                //         color: AppColors.mainColor,
                //       ),
                //       Text(
                //         ' Edit',
                //         style: TextStyle(
                //             color: AppColors.mainColor,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w400),
                //       )
                //     ],
                //   ),
                // ),
                // const Padding(
                //   padding: EdgeInsets.only(right: 10, left: 10),
                //   child: Row(
                //     children: [
                //       Icon(
                //         Icons.delete_outlined,
                //         color: AppColors.mainColor,
                //       ),
                //       Text(
                //         ' Delete',
                //         style: TextStyle(
                //             color: AppColors.mainColor,
                //             fontSize: 14,
                //             fontWeight: FontWeight.w400),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
            height10,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Menstruation',
                    style: w500_16Poppins(
                      color: AppColors.colorPrimaryTestDarkMore,
                    ),
                  ),
                  height15,
                  const Text(
                    'It is time to understand a menstruating girl is as beautiful as a pregnant lady. It is time to embrace and adore the beginning of life, which begins with this process of menstruation.',
                    style: TextStyle(
                        color: AppColors.colorPrimaryTestDarkMore,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 5,
                  ),
                  height15,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.sell_outlined,
                        color: AppColors.colorGray,
                      ),
                      Text(
                        '  Family, Food',
                        style: TextStyle(
                            color: AppColors.colorPrimaryTestDarkMore,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                  height5,
                  //Image..
                  Obx(
                    () => Container(
                      height: 145.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                NetworkImage(controller.imageValue.value), //c
                          )),
                    ),
                  ),
                  height15,
                  Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      children: List.generate(
                          controller.images.length,
                          (index) => GestureDetector(
                                onTap: () {
                                  String selectedImages =
                                      controller.imageValue.value;
                                  controller.imageValue.value =
                                      controller.images[index];
                                  controller.images.removeAt(index);
                                  controller.images.insert(0, selectedImages);
                                },
                                child: Obx(
                                  () => Container(
                                    height: 57.h,
                                    width: 60.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              controller.images[index])),
                                    ),
                                  ),
                                ),
                              ))),

                  Row(
                    children: [
                      Text('Hyderabad - ',
                          style: w500_16Poppins(
                            color: AppColors.colorPrimaryTestDarkMore,
                          )),
                      Text('27° C',
                          style: w500_16Poppins(
                            color: AppColors.degreeColor,
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
