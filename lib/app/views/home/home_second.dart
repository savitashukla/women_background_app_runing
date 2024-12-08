import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/views/home/home_widget/cycle_summary_info.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/images_url.dart';
import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';
import '../../viewmodels/home_controller/home_page_controller.dart';
import '../progress_bar/simple_circular_progress.dart';
import 'circle_paint/const/size_const.dart';
import 'home_widget/cycle_history_list_widget.dart';
import 'home_widget/cycle_phase_circle.dart';
import 'home_widget/empty_data_ui_home.dart';
import 'home_widget/health_lifestyle_widget.dart';
import 'home_widget/listSymptomsMoodOnly.dart';
import 'home_widget/one_day_daily_trip.dart';
import 'home_widget/one_month_date.dart';
import 'home_widget/pills_checklist_widget.dart';
import 'home_widget/pills_corner_empty.dart';
import 'home_widget/progressbar_three.dart';
import 'home_widget/symptoms_mood_pre_list.dart';
import 'info_about_cycle.dart';

class HomePageSecond extends StatefulWidget {
  const HomePageSecond({super.key});

  @override
  State<HomePageSecond> createState() => _HomePageSecondState();
}

class _HomePageSecondState extends State<HomePageSecond> {
  HomePageController homePageController = Get.put(HomePageController());

  var selectedDate = DateTime.now().subtract(const Duration(days: 0)).obs;
  int countTap = 0;
  var addGest = true.obs;
  var onStripDrag = DragEndDetails().obs;

  ValueNotifier<double> valueNotifier = ValueNotifier(50);

  var count = 1;

  @override
  Widget build(BuildContext context) {
    SizeUtil.getInstance()?.logicSize = MediaQuery.of(context).size;

    SizeUtil.initDesignSize();

    return Scaffold(
      backgroundColor: AppColors.homeBgColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  //  height: getProportionateScreenWidth(0.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r)),
                      gradient: const LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          AppColors.appBarColor1,
                          AppColors.appBarColor2
                        ],
                      )),
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Stack(
                          children: [
                            SvgPicture.asset(
                              ImagesUrl.waveFastHome,
                              width: MediaQuery.of(context).size.width,
                            ),
                            SvgPicture.asset(
                              ImagesUrl.topHomeWaveSecond,
                              width: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 30.h,
                          ),
                          HelperWidget().testMethod(
                              16.0,
                              FontWeight.w500,
                              AppColors.colorPrimaryTestDarkMore,
                              "Pregnancy Tracking!"),
                          Padding(
                            padding: EdgeInsets.only(bottom: 23.h, top: 20.h),
                            child: Center(
                              child: SvgPicture.asset(
                                ImagesUrl.topGirlsWithWave,
                                height: getProportionateScreenHeight(142),
                                fit: BoxFit.fill,
                                width: getProportionateScreenWidth(171),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),

                CyclePhaseCircle()
                    .cyclePhaseCircleMethod(context, homePageController),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      HelperWidget().testMethodStartAlign(
                          16.0,
                          FontWeight.w600,
                          AppColors.textColorQus,
                          DateFormat('MMM').format(DateTime(DateTime.now().year,
                              DateTime.now().month + 1, 0))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child:
                      ListOneMonthDate().oneMonthDateList(homePageController),
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r))),
                  child: Padding(
                    padding: EdgeInsets.only(left: 15.w, right: 15.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        HelperWidget().testMethodStartAlign(
                            16.0,
                            FontWeight.w500,
                            AppColors.textColorQus,
                            "Symptoms & Mood Prediction"),
                        SizedBox(
                          height: 96.h,
                          child: ListView.builder(
                              itemCount: 6,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(0),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return SymptomsMoodPreList()
                                    .listSymptomsMoodPre(context, index);
                              }),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        InkWell(
                          onTap: () {
                            HelperWidget().flutterCustomToast("coming soon");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HelperWidget().testMethodStartAlign(
                                  getFontSize(16),
                                  FontWeight.w500,
                                  AppColors.textColorQus,
                                  "Symptoms & Mood"),
                              /*  HelperWidget().testMethodStartAlign(
                                  getFontSize(12),
                                  FontWeight.w500,
                                  AppColors.colorPrimary,
                                  "View All"),*/
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        homePageController.isEmptySymptomsMoods.value
                            ? EmptyScreenUI(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.symptomsAndMoodScreen);
                                },
                              )
                            : SizedBox(
                                height: 110.h,
                                child: ListView.builder(
                                    itemCount: 6,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return ListSymptomsMoodOnly()
                                          .listSymptomsMoodPreOnly(context,
                                              index, homePageController);
                                    }),
                              ),
                        SizedBox(
                          height: 10.h,
                        ),
                        HelperWidget().testMethodStartAlign(
                            16.0,
                            FontWeight.w500,
                            AppColors.textColorQus,
                            "Daily Reflection"),
                        SizedBox(
                          height: 8.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 115.h,
                                margin: EdgeInsets.only(left: 0, right: 10.w),
                                decoration: BoxDecoration(
                                    color: AppColors.homeMenstrualH,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5),
                                      child: HelperWidget().testMethod(
                                          14.0,
                                          FontWeight.w500,
                                          AppColors.homePageDailyRText,
                                          "Menstrual health"),
                                    ),

                                    Image.asset(
                                      ImagesUrl.dailyRef,
                                      height: 65.h,
                                      width: 100.w,
                                      fit: BoxFit.fill,
                                    ),

                                    // const SizedBox(height: 10,),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 115.h,
                                margin: EdgeInsets.only(left: 0, right: 10.w),
                                decoration: BoxDecoration(
                                    color: AppColors.homeYogaFit,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5.h),
                                      child: HelperWidget().testMethod(
                                          14.0,
                                          FontWeight.w500,
                                          AppColors.textColorCycle,
                                          "Yoga and Fitness"),
                                    ),
                                    Image.asset(
                                      ImagesUrl.dailyRefSec,
                                      height: 70.h,
                                      fit: BoxFit.fill,
                                      width: 100.w,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                height: 115.h,
                                margin: EdgeInsets.only(left: 0, right: 0.w),
                                decoration: BoxDecoration(
                                    color: AppColors.homeEmpoweringGirls,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.r),
                                    )),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: 5.h, left: 5.w, right: 5.h),
                                      child: HelperWidget().testMethod(
                                          14.0,
                                          FontWeight.w500,
                                          AppColors.textColorCycleThi,
                                          "Empowering girls"),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Image.asset(
                                        ImagesUrl.dailyRef,
                                        height: 65.h,
                                        fit: BoxFit.fill,
                                        width: 100.w,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        InkWell(
                          onTap: () {
                            HelperWidget().flutterCustomToast("coming soon");
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HelperWidget().testMethodStartAlign(
                                  16.0,
                                  FontWeight.w500,
                                  AppColors.textColorQus,
                                  "Health & Lifestyle"),
                              /*  HelperWidget().testMethodStartAlign(
                                  12.0,
                                  FontWeight.w500,
                                  AppColors.colorPrimary,
                                  "View All"),*/
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 0.h,
                        ),
                        Obx(
                          () => homePageController.isEmptyHealth.value
                              ? EmptyScreenUI(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        Routes.homeHealthLifestyleScreen);
                                  },
                                )
                              : SizedBox(
                                  height: 101.h,
                                  child: ListView.builder(
                                      itemCount: 6,
                                      shrinkWrap: true,
                                      padding: const EdgeInsets.all(0),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return HealthLifestyle()
                                            .healthLifestyleWidget(
                                                context, index);
                                      }),
                                ),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                ),

                /// health & List Container

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                    color: AppColors.periodsTimeGoing.withOpacity(0.5),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [AppColors.homeBgColor, AppColors.homeBgColor]),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HelperWidget().testMethod(14.0, FontWeight.w500,
                              AppColors.textColorQus, "Pills Checklist"),
                          /*  SizedBox(
                            height: 10.h,
                          ),*/

                          homePageController.isPillsConEmpty.value
                              ? const IgnoreBaseline()
                              : GestureDetector(
                                  onTap: () {
                                 /*   Navigator.pushNamed(
                                        context, Routes.addPillScreen);*/
                                       HelperWidget().flutterCustomToast("coming soon");
                                  },
                                  child: Container(
                                    height: 26.h,
                                    width: 26.w,
                                    margin: EdgeInsets.only(right: 15.w),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.colorPrimaryLight),
                                    child: Icon(
                                      Icons.add,
                                      size: 25.sp,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      homePageController.isPillsConEmpty.value
                          ? const PillCornerEmptyScreen()
                          : SizedBox(
                              height: 100.h,
                              child: ListView.builder(
                                  itemCount: 10,
                                  padding: const EdgeInsets.all(0.0),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) {
                                    return PillsCheckListWidget(
                                        index, homePageController);
                                  })),
                      SizedBox(
                        height: 15.h,
                      ),
                    ],
                  ),
                ),

                Container(
                  color: AppColors.whiteColor,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 12.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          HelperWidget().testMethod(14.0, FontWeight.w500,
                              AppColors.textColorQus, "Water Log"),
                          SizedBox(
                            height: 10.h,
                          ),
                          GestureDetector(
                            onTap: () {
                               HelperWidget().flutterCustomToast("coming soon");
                           /*   Navigator.pushNamed(
                                  context, Routes.waterLogManagement);*/
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 5.0.w),
                              child: SvgPicture.asset(
                                ImagesUrl.rightBack,
                                color: AppColors.colorPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      SizedBox(
                        height: 143.h,
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                     HelperWidget().flutterCustomToast("coming soon");
                                   /* Navigator.pushNamed(
                                        context, Routes.waterLogManagement);*/
                                  },
                                  child: SizedBox(
                                    height: getProportionateScreenHeight(115),
                                    width: getProportionateScreenWidth(77),
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          ImagesUrl.glass,
                                          height:
                                              getProportionateScreenHeight(115),
                                          width:
                                              getProportionateScreenWidth(77),
                                        ),
                                        Center(
                                          child: Container(
                                            height: 30.h,
                                            width: 30.w,
                                            alignment: Alignment.center,
                                            decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: AppColors
                                                    .colorPrimaryLight),
                                            child: const Icon(
                                              Icons.add,
                                              color: AppColors.whiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              height: 50.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.only(
                                                  left: 0, right: 10.w),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 15),
                                              decoration: BoxDecoration(
                                                  color: AppColors.currentV,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.r),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Image.asset(
                                                      ImagesUrl.currentWater,
                                                      height: 20.h,
                                                      width: 20.w,
                                                    ),
                                                  ),
                                                  const SizedBox(
                                                    width: 3,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .homePageDailyRCS,
                                                              "Current"),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              14.0,
                                                              FontWeight.w500,
                                                              AppColors
                                                                  .blackColor,
                                                              "4000 ml"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 50.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              decoration: BoxDecoration(
                                                  color: AppColors.targetV,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.r),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      height: 21.h,
                                                      width: 17.w,
                                                      child: SvgPicture.asset(
                                                        ImagesUrl.currentIcon,
                                                        height: 21.h,
                                                        width: 17.w,
                                                      )),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .homePageDailyRCS,
                                                              "Target"),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              14.0,
                                                              FontWeight.w500,
                                                              AppColors
                                                                  .blackColor,
                                                              "4000 ml"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 50.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              margin: EdgeInsets.only(
                                                  left: 0, right: 10.w),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.w),
                                              decoration: BoxDecoration(
                                                  color: AppColors.nextDrink,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.r),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                      child: SvgPicture.asset(
                                                    ImagesUrl.targetSetTime,
                                                    height: 20.h,
                                                    width: 20.w,
                                                  )),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .homePageDailyRCS,
                                                              "Next Drink"),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              14.0,
                                                              FontWeight.w500,
                                                              AppColors
                                                                  .blackColor,
                                                              "2:00 Pm"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              height: 50.h,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              decoration: BoxDecoration(
                                                  color: AppColors.volumeColor,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(10.r),
                                                  )),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SizedBox(
                                                      height: 21.h,
                                                      width: 17.w,
                                                      child: SvgPicture.asset(
                                                        ImagesUrl.watervalume,
                                                        height: 21.h,
                                                        width: 17.w,
                                                      )),
                                                  SizedBox(
                                                    width: 10.w,
                                                  ),
                                                  Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .homePageDailyRCS,
                                                              "Volume"),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              14.0,
                                                              FontWeight.w500,
                                                              AppColors
                                                                  .blackColor,
                                                              "4000 ml"),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 7.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    /*  SvgPicture.asset(
                                      ImagesUrl.balbaBG,
                                      height: 44.h,
                                      width: 54.w,
                                    ),*/
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.h, left: 5.w),
                                          child: SvgPicture.asset(
                                            ImagesUrl.balbIcon,
                                            height: 23.h,
                                            width: 20.w,
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Expanded(
                                    child: HelperWidget().testMethodStartAlign(
                                        12.0,
                                        FontWeight.w400,
                                        AppColors.dailyTipTextC,
                                        "Don’t drink cold water immediately after hot drinks like tea or coffee."))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 10.h,
                ),

                /// other container

                Container(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r)),
                      color: AppColors.whiteColor),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          HelperWidget().flutterCustomToast("coming soon");
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                16.0,
                                FontWeight.w500,
                                AppColors.textColorQus,
                                "Cycle History"),
                            HelperWidget().testMethodStartAlign(
                                12.0,
                                FontWeight.w500,
                                AppColors.colorPrimary,
                                "Details"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.only(left: 0, right: 0, top: 5.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                12.0,
                                FontWeight.w500,
                                AppColors.homePageDailyRCS,
                                "Most logged Symptoms"),
                            SizedBox(
                              height: 0.h,
                            ),
                            SizedBox(
                              height: 96.h,
                              child: ListView.builder(
                                  itemCount: 6,
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(0),
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return CycleHistory()
                                        .cycleHistoryListWidget(
                                            context, index, homePageController);
                                  }),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 70,
                        margin: const EdgeInsets.only(left: 0, right: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: AppColors.previewCycleLen,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HelperWidget().testMethodStartAlign(
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.homePageDailyRCS,
                                    "Previous Cycle Length"),
                                HelperWidget().testMethodStartAlign(
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.blackColor,
                                    "35 Day"),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: SimpleCircularProgressBar(
                                valueNotifier: valueNotifier,
                                progressColors: const [
                                  AppColors.avgCycleDayProgressBarFull3
                                ],
                                backColor: AppColors.avgCycleDayProgressBarBG,
                                fullProgressColor:
                                    AppColors.avgCycleDayProgressBarFull3,
                                mergeMode: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 0, right: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: AppColors.previousPeriodLength,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HelperWidget().testMethodStartAlign(
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.homePageDailyRCS,
                                    "Previous Period Length"),
                                HelperWidget().testMethodStartAlign(
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.blackColor,
                                    "28 Days"),
                              ],
                            ),
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: SimpleCircularProgressBar(
                                valueNotifier: valueNotifier,
                                progressColors: const [
                                  AppColors.avgCycleDayProgressBarFull
                                ],
                                backColor: AppColors.avgCycleDayProgressBarBG,
                                fullProgressColor:
                                    AppColors.avgCycleDayProgressBarFull,
                                mergeMode: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(left: 0, right: 0),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            color: AppColors.homePageModerateFlow,
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.r),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                HelperWidget().testMethodStartAlign(
                                    12.0,
                                    FontWeight.w400,
                                    AppColors.homePageDailyRCS,
                                    "Previous Flow Intensity"),
                                HelperWidget().testMethodStartAlign(
                                    14.0,
                                    FontWeight.w500,
                                    AppColors.blackColor,
                                    "Moderate Flow"),
                              ],
                            ),
                            SvgPicture.asset(
                              ImagesUrl.moderateFlow,
                              height: 48,
                              width: 48,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                      HelperWidget().flutterCustomToast("coming soon");
                 //   Navigator.pushNamed(context, Routes.cycleSummary);
                  },
                  child: Container(
                    color: AppColors.whiteColor,
                    //  height: 214,

                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HelperWidget().testMethodStartAlign(
                                16.0,
                                FontWeight.w500,
                                AppColors.textColorQus,
                                "Cycle Summary"),
                            GestureDetector(
                              onTap: () {
                                InfoCycleSummary()
                                    .infoCycleSummaryBottomSheet(context);
                                /*   HelperWidget()
                                    .flutterCustomToast("coming soon");
           */
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: SvgPicture.asset(
                                  ImagesUrl.info,
                                  height: 18.h,
                                  width: 18.w,
                                  color: AppColors.textColorPaint,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 25, right: 30),
                              child: SizedBox(
                                height: 110,
                                width: 110,
                                child: ProgressBarThree(),
                              ),
                            ),
                            Expanded(
                                child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      margin: const EdgeInsets.only(
                                          top: 5, right: 3),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors
                                            .avgCycleDayProgressBarFull,
                                      ),
                                    ),
                                    Expanded(
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'Average Cycle length',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              fontFamily: "Poppins",
                                              color:
                                                  AppColors.homePageDailyRCS),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "  39 Days",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  fontFamily: "Poppins",
                                                  color: AppColors
                                                      .textColorCycleInfo),
                                            ),
                                            TextSpan(
                                              text: "  ABNORMAL",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  fontFamily: "Poppins",
                                                  color: AppColors
                                                      .homePageDailyRCST),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 8,
                                      width: 8,
                                      margin: const EdgeInsets.only(
                                          top: 5, right: 3),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors
                                            .avgCycleDayProgressBarFull2,
                                      ),
                                    ),
                                    Expanded(
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'Average Period length',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              fontFamily: "Poppins",
                                              color:
                                                  AppColors.homePageDailyRCS),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "  7 Days",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  fontFamily: "Poppins",
                                                  color: AppColors
                                                      .textColorCycleInfo),
                                            ),
                                            TextSpan(
                                              text: "  NORMAL",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  fontFamily: "Poppins",
                                                  color: AppColors
                                                      .homePageDailyRCSTG),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      height: 8.h,
                                      width: 8.w,
                                      margin:
                                          EdgeInsets.only(top: 5.h, right: 3),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors
                                            .avgCycleDayProgressBarFull3,
                                      ),
                                    ),
                                    Expanded(
                                      child: RichText(
                                        text: const TextSpan(
                                          text: 'Cycle Length Variation',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 12,
                                              fontFamily: "Poppins",
                                              color:
                                                  AppColors.homePageDailyRCS),
                                          children: <TextSpan>[
                                            TextSpan(
                                              text: "  3 Days",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  fontFamily: "Poppins",
                                                  color: AppColors
                                                      .textColorCycleInfo),
                                            ),
                                            TextSpan(
                                              text: "   Regular",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 12,
                                                  fontFamily: "Poppins",
                                                  color: AppColors
                                                      .homePageDailyCSCyLen),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 200.h,
              padding:
                  const EdgeInsets.only(left: 0, top: 0, bottom: 00, right: 0),
              margin:
                  EdgeInsets.only(left: 0, top: 167.1.h, bottom: 0, right: 0),
              child: Stack(
                children: [
                  const OneDayDailyTrip(),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 120.1.h,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        //HelperWidget().flutterCustomToast("coming soon");
                        InfoAboutCycle().infoAboutCycleBottomSheet(
                            context, homePageController);
                      },
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 30.w, top: 0.h, bottom: 10.h),
                        child: Row(children: [
                          SvgPicture.asset(
                            ImagesUrl.info,
                            height: 18.h,
                            width: 18.w,
                            color: AppColors.textColorPaint,
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Info About Cycle Phases',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: getFontSize(12),
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.colorPrimary,
                              fontFamily: "Poppins",
                              color: AppColors.colorPrimary,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
