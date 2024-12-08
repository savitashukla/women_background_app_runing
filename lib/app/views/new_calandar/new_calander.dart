import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/models/calander_config.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/app/viewmodels/calendar/new_calander_controller.dart';
import 'package:o_woman/app/viewmodels/hum_profile/be_safe_controller.dart';
import 'package:o_woman/app/views/calander_date_info.dart';
import 'package:o_woman/app/views/home/circle_paint/const/size_const.dart';
import 'package:o_woman/app/views/home/home_widget/symptoms_mood_pre_list.dart';
import 'package:o_woman/app/views/new_calandar/calander_day_widget.dart';
import 'package:o_woman/app/views/new_calandar/calander_view_component.dart';
import 'package:o_woman/app/views/new_calandar/calander_view_component_edit.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/font_size.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';

import '../calendar/all_year_show.dart';
import 'calander_day_widget_edit.dart';

class NewCalander extends StatelessWidget {
  NewCalander({super.key});

  NewCalendarController controller = Get.put(NewCalendarController());

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    DateTime minDate = DateTime(now.year - 5, 1, 1);
    DateTime maxDate = DateTime(now.year + 5, 1, 1);
    return Scaffold(
      backgroundColor: AppColors.homeBgOnly,
      body: Obx(
        () => controller.isYearView.value
            ? AllYearCalendar()
            : Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 15.0.w,
                      right: 15.0.w,
                      top: 15.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      //,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Obx(
                      () => controller.editCalendarClick.value
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.changeMonth(-1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 5.w),
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.r),
                                        color: AppColors.appBarColor1,
                                      ),
                                      child:  Icon(
                                        Icons.arrow_back_ios_rounded,
                                        color: AppColors.colorPrimaryIcon,
                                        size: 16.r,
                                      ),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Text(
                                    controller.formatMonthYear(
                                        controller.selectedMonth.value),
                                    style: TextStyle(
                                        color: Theme.of(context).hintColor),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.changeMonth(1);
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.r),
                                        color: AppColors.appBarColor1,
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColors.colorPrimaryIcon,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    controller.changeMonth(-1);
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 15.w),
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.r),
                                        color: AppColors.appBarColor1,
                                      ),
                                      child: const Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        color: AppColors.colorPrimaryIcon,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    controller.isYearView.value = true;
                                  },
                                  child: Obx(
                                    () => Text(
                                      controller.formatMonthYear(
                                          controller.selectedMonth.value),
                                      style: TextStyle(
                                          color: Theme.of(context).hintColor),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 15.w),
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.changeMonth(1);
                                    },
                                    child: Container(
                                      height: 30.h,
                                      width: 30.w,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(6.r),
                                        color: AppColors.appBarColor1,
                                      ),
                                      child: const Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: AppColors.colorPrimaryIcon,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () => {
                                    controller.editCalendarClick.value = true,
                                  },
                                  child: Container(
                                    height: 32.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.r),
                                      color: AppColors.colorPrimaryIcon,
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        SvgPicture.asset(
                                          ImagesUrl.editIcon,
                                          height: 16.h,
                                          width: 16.w,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          'Edit period',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w400,
                                              fontSize: getFontSize(14)),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        right: 8.0.w, left: 8.0.w, bottom: 0.0.h, top: 10.0.h),
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      //,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Obx(
                      () => controller.editCalendarClick.value
                          ? Column(
                              children: [
                                CalendarViewEdit(
                                    month: controller.selectedMonth.value,
                                    config: CalendarConfig(
                                        maxDate: maxDate, minDate: minDate),
                                    builder: (CalendarDateInfo e) {
                                      return CalendarDayWidgetEdit(
                                        date: e.date,
                                        enabled: e.enabled &&
                                            e.date.month ==
                                                controller.selectedMonth.value
                                                    .month &&
                                            e.date.year ==
                                                controller
                                                    .selectedMonth.value.year,
                                        selected: e.enabled &&
                                            controller.selectedDay.value.day ==
                                                e.date.day &&
                                            e.enabled &&
                                            controller
                                                    .selectedDay.value.month ==
                                                e.date.month,
                                        onTap: () {
                                          controller.selectedDay.value = e.date;
                                        },
                                        applyBorder: e.applyBorder,
                                      );
                                    }),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        controller.editCalendarClick.value =
                                            false;
                                      },
                                      child: HelperWidget()
                                          .buttonCreateOnlyBorder(
                                              "Cancel",
                                              AppColors
                                                  .buttonColorTextWithBorder,
                                              FontWeight.w500,
                                              14.0,
                                              getProportionateScreenHeight(37),
                                              getProportionateScreenWidth(115)),
                                    ),
                                    SizedBox(
                                      width: 20.w,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        controller.editCalendarClick.value =
                                            false;
                                      },
                                      child: HelperWidget()
                                          .buttonCreateWithoutBorder(
                                              "Save",
                                              AppColors.whiteColor,
                                              FontWeight.w500,
                                              14.0,
                                              getProportionateScreenHeight(37),
                                              getProportionateScreenWidth(115)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                              ],
                            )
                          : CalanderView(
                              month: controller.selectedMonth.value,
                              config: CalendarConfig(
                                  maxDate: maxDate, minDate: minDate),
                              builder: (CalendarDateInfo e) {
                                return CalanderDayWidget(
                                  date: e.date,
                                  enabled: e.enabled &&
                                      e.date.month ==
                                          controller
                                              .selectedMonth.value.month &&
                                      e.date.year ==
                                          controller.selectedMonth.value.year,
                                  selected: e.enabled &&
                                      controller.selectedDay.value.day ==
                                          e.date.day &&
                                      e.enabled &&
                                      controller.selectedDay.value.month ==
                                          e.date.month,
                                  onTap: () {
                                    controller.selectedDay.value = e.date;
                                  },
                                  applyBorder: e.applyBorder,
                                );
                              }),
                    ),
                  ),

                  ///////////////////////////////////////////

                  //Symptoms and mood
                  Obx(
                    () => controller.editCalendarClick.value
                        ? SizedBox(
                            height: 0.h,
                          )
                        : SizedBox(
                            height: 10.h,
                          ),
                  ),
                  Obx(
                    () => controller.editCalendarClick.value
                        ? Expanded(
                            child: Stack(
                              children: [
                                SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Container(
                                          height: 150.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.w, top: 10.w),
                                                child: Text(
                                                  'Symptoms & Mood',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .colorPrimaryTestDarkMore,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(16)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 116.h,
                                                child: ListView.builder(
                                                    itemCount: 5,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return index == 0
                                                          ? Container(
                                                              height: 70.h,
                                                              width: 70.w,
                                                              decoration: const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .bottomButtonColor),
                                                              child: const Icon(
                                                                Icons.add,
                                                                color: AppColors
                                                                    .addIconColor,
                                                              ),
                                                            )
                                                          : SymptomsMoodPreList()
                                                              .listSymptomsMoodPre(
                                                                  context,
                                                                  index);
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Container(
                                          height: 150.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5.r)),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 10.w, top: 10.h),
                                                child: Text(
                                                  'Health & Lifestyle',
                                                  style: TextStyle(
                                                      color: AppColors
                                                          .colorPrimaryTestDarkMore,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize:
                                                          getFontSize(16)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 116.h,
                                                child: ListView.builder(
                                                    itemCount: 5,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return index == 0
                                                          ? Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  height: 55.h,
                                                                  width: 55.w,
                                                                  decoration: const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: AppColors
                                                                          .bottomButtonColor),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    color: AppColors
                                                                        .addIconColor,
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : SymptomsMoodPreList()
                                                              .listSymptomsMoodPre(
                                                                  context,
                                                                  index);
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Container(
                                          height: 100.h,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10.r)),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(left: 10.w),
                                            child: Row(
                                              children: [
                                                //Image
                                                Expanded(
                                                  flex: 2,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.r),
                                                    child: Container(
                                                      height: 60.h,
                                                      width: 60.w,
                                                      decoration:
                                                          const BoxDecoration(
                                                              image:
                                                                  DecorationImage(
                                                        image: NetworkImage(
                                                            'https://www.shutterstock.com/image-photo/portrait-happy-indian-asian-young-260nw-1833243328.jpg'),
                                                      )),
                                                    ),
                                                  ),
                                                ),
                                                //Title/subtitile
                                                Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 15.h),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Menstruation',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getFontSize(
                                                                      16),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              color: AppColors
                                                                  .colorPrimaryTestDarkMore),
                                                        ),
                                                        Text(
                                                          'It is time to take care of out self',
                                                          style: TextStyle(
                                                              fontSize:
                                                                  getFontSize(
                                                                      12),
                                                              color: AppColors
                                                                  .colorPrimaryTestDarkMore),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 1,
                                                        ),
                                                        Text('12 Dec 2023',
                                                            style: TextStyle(
                                                                fontSize:
                                                                    getFontSize(
                                                                        12),
                                                                color: AppColors
                                                                    .colorPrimaryTestDarkMore)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: PopupMenuButton(
                                                      onSelected: (value) {
                                                    controller.selectedItem
                                                        .value = value;

                                                    // Navigator.pushNamed(context, value.toString());
                                                  }, itemBuilder:
                                                          (BuildContext bc) {
                                                    return [
                                                      PopupMenuItem(
                                                        value: '/view',
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                                context,
                                                                Routes
                                                                    .calanderViewNote);
                                                          },
                                                          child: const Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .remove_red_eye,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              Text(" View")
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      PopupMenuItem(
                                                        value: '/edit',
                                                        child: GestureDetector(
                                                          onTap: () {},
                                                          child: const Row(
                                                            children: [
                                                              Icon(
                                                                Icons.edit,
                                                                color:
                                                                    Colors.grey,
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
                                                                Icons.edit,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                              Text(" Delete")
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    ];
                                                  }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 20.h),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: AppColors.greyBgColor.withOpacity(0.6),
                                )
                              ],
                            ),
                          )
                        : Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      height: 150.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, top: 10.h),
                                            child: Text(
                                              'Symptoms & Mood',
                                              style: TextStyle(
                                                  color: AppColors
                                                      .colorPrimaryTestDarkMore,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(16)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 116.h,
                                            child: ListView.builder(
                                                itemCount: 5,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return index == 0
                                                      ? InkWell(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                                context,
                                                                Routes
                                                                    .homeHealthLifestyleScreen);
                                                          },
                                                          child: Container(
                                                            height: 55.h,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0,
                                                                    right: 0),
                                                            width: 55.w,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .bottomButtonColor,
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  height: 28.h,
                                                                  width: 28.w,
                                                                  decoration: const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: AppColors
                                                                          .colorPrimaryLight),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    size: 20,
                                                                    color: AppColors
                                                                        .whiteColor,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15,
                                                                  left: 10),
                                                          child: SymptomsMoodPreList()
                                                              .listSymptomsMoodPre(
                                                                  context,
                                                                  index),
                                                        );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Container(
                                      height: 150.h,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(5.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                                left: 10.w, top: 10.h),
                                            child: Text(
                                              'Health & Lifestyle',
                                              style: TextStyle(
                                                  color: AppColors
                                                      .colorPrimaryTestDarkMore,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: getFontSize(16)),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 116.h,
                                            child: ListView.builder(
                                                itemCount: 5,
                                                shrinkWrap: true,
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return index == 0
                                                      ? InkWell(
                                                          onTap: () {
                                                            Navigator.pushNamed(
                                                                context,
                                                                Routes
                                                                    .homeHealthLifestyleScreen);
                                                          },
                                                          child: Container(
                                                            height: 55.h,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0,
                                                                    right: 0),
                                                            width: 55.w,
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .bottomButtonColor,
                                                            ),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Container(
                                                                  height: 28.h,
                                                                  width: 28.w,
                                                                  decoration: const BoxDecoration(
                                                                      shape: BoxShape
                                                                          .circle,
                                                                      color: AppColors
                                                                          .colorPrimaryLight),
                                                                  child:
                                                                      const Icon(
                                                                    Icons.add,
                                                                    size: 20,
                                                                    color: AppColors
                                                                        .whiteColor,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                      : Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  top: 15,
                                                                  left: 10),
                                                          child: SymptomsMoodPreList()
                                                              .listSymptomsMoodPre(
                                                                  context,
                                                                  index),
                                                        );
                                                }),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10.h),
                                  SizedBox(
                                    height: 100.h,
                                    child: ListView.builder(
                                        itemCount: 5,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return notesListWidget(context);
                                        }),
                                  ),
                                  SizedBox(height: 20.h),
                                ],
                              ),
                            ),
                          ),
                  ),
                ],
              ),
      ),
    );
  }
}

Widget notesListWidget(BuildContext context) {
  NewCalendarController controller = Get.put(NewCalendarController());
  BeSafeController beSafeController = Get.put(BeSafeController());
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                PopupMenuButton(onSelected: (value) {
                  controller.selectedItem.value = value;
                  print(value);
                }, itemBuilder: (BuildContext bc) {
                  return [
                    PopupMenuItem(
                      value: '/view',
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.calanderViewNote);
                        },
                        child: const Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              color: Colors.grey,
                            ),
                            Text(" View")
                          ],
                        ),
                      ),
                    ),
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
              ],
            ),
          ),
        ),
      ),
      height10,
    ],
  );
}
