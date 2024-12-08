import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/routes/routes.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/helper_widgets/helper_widgets.dart';
import '../../viewmodels/home_controller/home_page_controller.dart';
import '../progress_bar/simple_circular_progress.dart';
import 'circle_paint/CirclePaint.dart';
import 'circle_paint/const/size_const.dart';
import 'home_widget/one_month_date.dart';
import 'move_button_custom_paint.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = Get.put(HomePageController());
  var selectedDate = DateTime.now().subtract(const Duration(days: 0)).obs;
  final _len = 10.0;
  int countTap = 0;
  var addGest = true.obs;
  var onStripDrag = DragEndDetails().obs;

  ValueNotifier<double> valueNotifier = ValueNotifier(50);

  var count = 1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homePageController.getOffsetAccording("${DateTime.now().day}");
  }

  @override
  Widget build(BuildContext context) {
    SizeUtil.getInstance()?.logicSize = MediaQuery.of(context).size;

    SizeUtil.initDesignSize();

    return Scaffold(
      backgroundColor: AppColors.colorSecondary,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 270,
              width: MediaQuery.of(context).size.width,
              child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20),

                  ),
                  Column(
                    children: [
                      HelperWidget().testMethod(
                          20.0,
                          FontWeight.w600,
                          AppColors.colorPrimaryTestDarkMore,
                          "Lorem ipsum dolor sitamet"),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 60),
                            child: Center(
                              child: Image.asset(
                                ImagesUrl.homeCurve,
                                height: 154,
                                width: 154,
                              ),
                            ),
                          ),

                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
                minChildSize: 0.7,
                initialChildSize: 0.7,
                builder: (context, scrollController) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(top: 20),
                    decoration: const BoxDecoration(
                        color: AppColors.homePageBottomColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 6,
                                  width: 46,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(9),
                                          topRight: Radius.circular(9)),
                                      color:
                                          AppColors.homePageBottomColorLine1),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(top: 4),
                                  height: 5,
                                  width: 46,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(9),
                                          bottomRight: Radius.circular(9)),
                                      color: AppColors.homePageBottomColorLine),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: CustomScrollView(
                            controller: scrollController,
                            slivers: [
                              SliverList(
                                delegate: SliverChildListDelegate(
                                  [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 108,
                                            margin: const EdgeInsets.only(
                                                left: 0, top: 10, bottom: 10),
                                            child: ListView.builder(
                                                itemCount: 10,
                                                shrinkWrap: true,
                                                padding:
                                                    const EdgeInsets.all(0),
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemBuilder: (context, index) {
                                                  return Container(
                                                    height: 108,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 15),
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(20.r),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 10,
                                                                    bottom: 0,
                                                                    top: 0),
                                                            child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                HelperWidget().testMethodStartAlign(
                                                                    14.0,
                                                                    FontWeight
                                                                        .w500,
                                                                    AppColors
                                                                        .colorPrimaryTest,
                                                                    "Live the actual AMOMENT"),
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                HelperWidget().testMethodStartAlign(
                                                                    12.0,
                                                                    FontWeight
                                                                        .w400,
                                                                    AppColors
                                                                        .colorPrimaryTestDark,
                                                                    "Only This Actual Moment Is LIFE")
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                            child: Stack(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 7.0),
                                                              child:
                                                                  Image.asset(
                                                                ImagesUrl
                                                                    .homeActualMomentPng,
                                                                height: 91,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                            SvgPicture.asset(
                                                                ImagesUrl
                                                                    .homeActualMomentGirls)
                                                          ],
                                                        ))
                                                      ],
                                                    ),
                                                  );
                                                }),
                                          ),
                                          Center(
                                            child: SizedBox(
                                              height: 300,
                                              width: 300,
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    height: 300,
                                                    width: 300,
                                                    margin:
                                                        const EdgeInsets.all(3),
                                                /*    child: Obx(
                                                        ()=> CustomPaint(
                                                        painter: CirclePainter(
                                                            startAngle: _len,homePageController.cyclePeriods.value,homePageController.cycleFollicular,homePageController.cycleOvulation,homePageController.cycleLuteal),
                                                      ),
                                                    ),*/
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 0.0),
                                                    child: Center(
                                                      child: GestureDetector(
                                                          /* onTapDown: (details) {
                                                        homePageController
                                                                .offset.value =
                                                            (details
                                                                .localPosition);
                                                        homePageController
                                                                .testData
                                                                .value =
                                                            "Angle Ro...2";
                                                      },*/ /*onPanUpdate: (details) {
                                                            homePageController
                                                                    .testData.value =
                                                                "Angle Ro...";

                                                            homePageController
                                                                    .offset.value =
                                                                (details
                                                                    .localPosition);
                                                          },*/
                                                          child: Obx(() {
                                                        return CustomPaint(
                                                              painter: MoveButtonCustomPaint(
                                                                pointerOffset: homePageController.offset.value,
                                                               /*   pointerOffset: Offset.zero,*/
                                                                  dateText:
                                                                  homePageController
                                                                      .dateClick
                                                                      .value),
                                                              child: Center(
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                    crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                    children: [
                                                                      Obx(
                                                                            () =>
                                                                            Text(
                                                                              homePageController
                                                                                  .testData
                                                                                  .value,
                                                                              style: const TextStyle(
                                                                                  color: AppColors
                                                                                      .textColorQus),
                                                                            ),
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                        10,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          if (homePageController
                                                                              .circleCenterTextData
                                                                              .value
                                                                              .compareTo(
                                                                              "Edit Period Dates") ==
                                                                              0) {
                                                                            Navigator
                                                                                .pushNamed(
                                                                                context,
                                                                                Routes
                                                                                    .calenderMain);
                                                                          }
                                                                          Fluttertoast
                                                                              .showToast(
                                                                              msg:
                                                                              "msg do there");
                                                                        },
                                                                        child:
                                                                        Container(
                                                                          height:
                                                                          24,
                                                                          padding: const EdgeInsets
                                                                              .symmetric(
                                                                              horizontal:
                                                                              5,
                                                                              vertical:
                                                                              5),
                                                                          decoration: const BoxDecoration(
                                                                              borderRadius:
                                                                              BorderRadius
                                                                                  .all(
                                                                                  Radius
                                                                                      .circular(
                                                                                      15.0)),
                                                                              color: Colors
                                                                                  .deepOrangeAccent),
                                                                          child:
                                                                          Column(
                                                                            mainAxisAlignment:
                                                                            MainAxisAlignment
                                                                                .center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets
                                                                                    .symmetric(
                                                                                    horizontal: 3),
                                                                                child: Obx(
                                                                                      () =>
                                                                                      Text(
                                                                                          homePageController
                                                                                              .circleCenterTextData
                                                                                              .value,
                                                                                          textAlign: TextAlign
                                                                                              .center,
                                                                                          style: const TextStyle(
                                                                                            fontSize: 10.0,
                                                                                            color: AppColors
                                                                                                .whiteColor,
                                                                                            fontWeight: FontWeight
                                                                                                .w400,
                                                                                            fontFamily: 'Poppins',
                                                                                          )),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  )),
                                                            );
                                                          })),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 25,
                                          ),
                                          HelperWidget().testMethodStartAlign(
                                              16.0,
                                              FontWeight.w600,
                                              AppColors.textColorQus,
                                              "${DateFormat('MMM').format(DateTime(DateTime.now().year, DateTime.now().month + 1, 0))} ${DateTime.now().day} - ${DateTime.now().add(const Duration(days: 6)).day}"),
                                          const SizedBox(
                                            height: 10,
                                          ),

                                          ListOneMonthDate().oneMonthDateList(
                                              homePageController)
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: const BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            HelperWidget().testMethodStartAlign(
                                                16.0,
                                                FontWeight.w500,
                                                AppColors.textColorQus,
                                                "Symptoms & Mood Prediction"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            SizedBox(
                                              height: 64,
                                              child: ListView.builder(
                                                  itemCount: 4,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      height: 70,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              left: 0,
                                                              right: 10),
                                                      width: (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width -
                                                              5) /
                                                          4.7,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .homePageSym,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(
                                                                10.r),
                                                          )),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .homePageBottomColorLine1),
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  index == 0
                                                                      ? Image
                                                                          .asset(
                                                                          ImagesUrl
                                                                              .sadEmoji,
                                                                          height:
                                                                              18,
                                                                          width:
                                                                              18,
                                                                        )
                                                                      : index ==
                                                                              1
                                                                          ? SvgPicture
                                                                              .asset(
                                                                              ImagesUrl.syMoodPre,
                                                                              height: 18,
                                                                              width: 18,
                                                                            )
                                                                          : index == 2
                                                                              ? SvgPicture.asset(
                                                                                  ImagesUrl.nounStomachBloating,
                                                                                  height: 18,
                                                                                  width: 18,
                                                                                )
                                                                              : SvgPicture.asset(
                                                                                  ImagesUrl.sweaty,
                                                                                  height: 18,
                                                                                  width: 18,
                                                                                )
                                                                ]),
                                                          ),
                                                          index == 0
                                                              ? HelperWidget()
                                                                  .testMethod(
                                                                      12.0,
                                                                      FontWeight
                                                                          .w400,
                                                                      AppColors
                                                                          .blackColor,
                                                                      "Sad")
                                                              : index == 1
                                                                  ? HelperWidget().testMethod(
                                                                      12.0,
                                                                      FontWeight
                                                                          .w400,
                                                                      AppColors
                                                                          .blackColor,
                                                                      "Cramps")
                                                                  : index == 2
                                                                      ? HelperWidget().testMethod(
                                                                          12.0,
                                                                          FontWeight
                                                                              .w400,
                                                                          AppColors
                                                                              .blackColor,
                                                                          "Bloating")
                                                                      : HelperWidget().testMethod(
                                                                          12.0,
                                                                          FontWeight
                                                                              .w400,
                                                                          AppColors
                                                                              .blackColor,
                                                                          "Sweaty")
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                HelperWidget()
                                                    .testMethodStartAlign(
                                                        16.0,
                                                        FontWeight.w500,
                                                        AppColors.textColorQus,
                                                        "Symptoms & Mood"),
                                                HelperWidget()
                                                    .testMethodStartAlign(
                                                        12.0,
                                                        FontWeight.w500,
                                                        AppColors.colorPrimary,
                                                        "See All"),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 87,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 10),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .colorPrimary,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.r),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        HelperWidget().testMethod(
                                                            12.0,
                                                            FontWeight.w400,
                                                            AppColors
                                                                .whiteColor,
                                                            "Log Your Symptoms"),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          height: 30,
                                                          width: 30,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          child: const Icon(
                                                            Icons.add,
                                                            color: AppColors
                                                                .colorPrimary,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 87,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 10),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .homePageModerateFlow,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.r),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget()
                                                            .testMethodStartAlign(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .colorPrimary,
                                                                "Mood"),
                                                        SvgPicture.asset(
                                                            ImagesUrl.smpToms),
                                                        HelperWidget()
                                                            .testMethodStartAlign(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .textColorQus,
                                                                "Happy"),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 87,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 10),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .homePageModerateFlow,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.r),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget()
                                                            .testMethodStartAlign(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .colorPrimary,
                                                                "Mood"),
                                                        SvgPicture.asset(
                                                            ImagesUrl.smpToms),
                                                        HelperWidget()
                                                            .testMethodStartAlign(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .textColorQus,
                                                                "Happy"),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                            HelperWidget().testMethodStartAlign(
                                                16.0,
                                                FontWeight.w500,
                                                AppColors.textColorQus,
                                                "Daily Reflection"),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    height: 135,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 10),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .homeMenstrualH,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.r),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Center(
                                                          child: HelperWidget()
                                                              .testMethod(
                                                                  14.0,
                                                                  FontWeight
                                                                      .w500,
                                                                  AppColors
                                                                      .homePageDailyRText,
                                                                  "Menstrual health"),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Image.asset(
                                                          ImagesUrl.dailyRef,
                                                          height: 80,
                                                          width: 100,
                                                        ),

                                                        // const SizedBox(height: 10,),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 135,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 10),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .homeYogaFit,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.r),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget().testMethod(
                                                            14.0,
                                                            FontWeight.w500,
                                                            AppColors
                                                                .homePageDailyRText,
                                                            "Yoga and Fitness"),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Image.asset(
                                                          ImagesUrl.dailyRef,
                                                          height: 80,
                                                          width: 100,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    height: 135,
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 0, right: 10),
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .homeEmpoweringGirls,
                                                        borderRadius:
                                                            BorderRadius.all(
                                                          Radius.circular(10.r),
                                                        )),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget().testMethod(
                                                            14.0,
                                                            FontWeight.w500,
                                                            AppColors
                                                                .homePageDailyRText,
                                                            "Empowering girls"),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Image.asset(
                                                          ImagesUrl.dailyRef,
                                                          height: 80,
                                                          width: 100,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),

                                    /// health & List Container

                                    Container(
                                      //   color: AppColors.whiteColor,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppColors.homePageBGColorsSyMode2,
                                              AppColors.homePageBGColorsSyMode3
                                            ]),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              HelperWidget()
                                                  .testMethodStartAlign(
                                                      16.0,
                                                      FontWeight.w500,
                                                      AppColors.textColorQus,
                                                      "Health & Lifestyle"),
                                              HelperWidget()
                                                  .testMethodStartAlign(
                                                      12.0,
                                                      FontWeight.w500,
                                                      AppColors.colorPrimary,
                                                      "See All"),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 87,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .colorPrimary,
                                                      borderRadius:
                                                      BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors.whiteColor,
                                                          "Log Your Symptoms"),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .whiteColor),
                                                        child: const Icon(
                                                          Icons.add,
                                                          color: AppColors
                                                              .colorSecondary,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 87,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .colorPrimary,
                                                              "Mood"),
                                                      SvgPicture.asset(
                                                          ImagesUrl.smpToms),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .textColorQus,
                                                              "Happy"),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 87,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .colorPrimary,
                                                              "Mood"),
                                                      SvgPicture.asset(
                                                          ImagesUrl.smpToms),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              12.0,
                                                              FontWeight.w400,
                                                              AppColors
                                                                  .textColorQus,
                                                              "Happy"),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              HelperWidget().testMethod(
                                                  14.0,
                                                  FontWeight.w500,
                                                  AppColors.textColorQus,
                                                  "Pills Checklist"),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              const Icon(
                                                Icons.add,
                                                color: AppColors.colorPrimary,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                              height: 53,
                                              child: ListView.builder(
                                                  itemCount: 10,
                                                  padding:
                                                      const EdgeInsets.all(0.0),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 15),
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width -
                                                              200,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 5),
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .homePageGynovedaCo,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Container(
                                                            height: 41,
                                                            width: 41,
                                                            margin:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 10),
                                                            decoration:
                                                                const BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: AppColors
                                                                  .whiteColor,
                                                            ),
                                                            child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SvgPicture
                                                                      .asset(
                                                                    ImagesUrl
                                                                        .pills_gynoveda,
                                                                    height: 21,
                                                                    width: 12,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  )
                                                                ]),
                                                          ),
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              HelperWidget()
                                                                  .testMethod(
                                                                      14.0,
                                                                      FontWeight
                                                                          .w500,
                                                                      AppColors
                                                                          .textColorQus,
                                                                      "Gynoveda"),
                                                              HelperWidget().testMethod(
                                                                  12.0,
                                                                  FontWeight
                                                                      .w400,
                                                                  AppColors
                                                                      .textColorQus,
                                                                  "Today, 8:00 am"),
                                                            ],
                                                          ),
                                                          Container(
                                                              height: 18,
                                                              width: 18,
                                                              margin:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      right:
                                                                          10),
                                                              decoration: const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .homePageDailyRCSTG),
                                                              child: SvgPicture
                                                                  .asset(
                                                                ImagesUrl
                                                                    .mdiTick,
                                                              ))
                                                        ],
                                                      ),
                                                    );
                                                  })),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              HelperWidget().testMethod(
                                                  14.0,
                                                  FontWeight.w500,
                                                  AppColors.textColorQus,
                                                  "Water Log"),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 5.0),
                                                child: SvgPicture.asset(
                                                    ImagesUrl.rightBack),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          SizedBox(
                                            height: 190,
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Image.asset(
                                                      ImagesUrl.glass,
                                                      height: 115,
                                                      width: 77,
                                                    ),
                                                    const SizedBox(
                                                      width: 15,
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                Container(
                                                                  height: 61,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              0,
                                                                          right:
                                                                              10),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: AppColors
                                                                              .homePageSym,
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(10.r),
                                                                          )),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          HelperWidget().testMethodStartAlign(
                                                                              12.0,
                                                                              FontWeight.w400,
                                                                              AppColors.homePageDailyRCS,
                                                                              "Target"),
                                                                          Container(
                                                                            height:
                                                                                30,
                                                                            width:
                                                                                30,
                                                                            decoration:
                                                                                const BoxDecoration(shape: BoxShape.circle, color: AppColors.homePageBottomColorLine1),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      HelperWidget().testMethodStartAlign(
                                                                          14.0,
                                                                          FontWeight
                                                                              .w500,
                                                                          AppColors
                                                                              .blackColor,
                                                                          "4000 ml"),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 1,
                                                                child:
                                                                Container(
                                                                  height: 61,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              0,
                                                                          right:
                                                                              0),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: AppColors
                                                                              .homePageSym,
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(10.r),
                                                                          )),
                                                                  child: Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          HelperWidget().testMethodStartAlign(
                                                                              12.0,
                                                                              FontWeight.w400,
                                                                              AppColors.homePageDailyRCS,
                                                                              "Current"),
                                                                          Container(
                                                                            height:
                                                                                30,
                                                                            width:
                                                                                30,
                                                                            child:
                                                                                SvgPicture.asset(
                                                                              ImagesUrl.targetSetTime,
                                                                              height: 20,
                                                                              width: 20,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      HelperWidget().testMethodStartAlign(
                                                                          14.0,
                                                                          FontWeight
                                                                              .w500,
                                                                          AppColors
                                                                              .blackColor,
                                                                          "4000 ml"),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                Container(
                                                                  height: 61,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  margin:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              0,
                                                                          right:
                                                                              10),
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: AppColors
                                                                              .homePageSym,
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(10.r),
                                                                          )),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          HelperWidget().testMethodStartAlign(
                                                                              12.0,
                                                                              FontWeight.w400,
                                                                              AppColors.homePageDailyRCS,
                                                                              "Next Drink"),
                                                                          Container(
                                                                              height: 30,
                                                                              width: 30,
                                                                              child: SvgPicture.asset(
                                                                                ImagesUrl.targetSetTime,
                                                                                height: 20,
                                                                                width: 20,
                                                                              )),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      HelperWidget().testMethodStartAlign(
                                                                          14.0,
                                                                          FontWeight
                                                                              .w500,
                                                                          AppColors
                                                                              .blackColor,
                                                                          "4000 ml"),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child:
                                                                Container(
                                                                  height: 61,
                                                                  width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                                  padding: const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          15),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          color: AppColors
                                                                              .homePageSym,
                                                                          borderRadius:
                                                                              BorderRadius.all(
                                                                            Radius.circular(10.r),
                                                                          )),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          HelperWidget().testMethodStartAlign(
                                                                              12.0,
                                                                              FontWeight.w400,
                                                                              AppColors.homePageDailyRCS,
                                                                              "Volume"),
                                                                          Container(
                                                                              height: 21,
                                                                              width: 17,
                                                                              child: SvgPicture.asset(
                                                                                ImagesUrl.watervalume,
                                                                                height: 21,
                                                                                width: 17,
                                                                              )),
                                                                        ],
                                                                      ),
                                                                      const SizedBox(
                                                                        height:
                                                                            5,
                                                                      ),
                                                                      HelperWidget().testMethodStartAlign(
                                                                          14.0,
                                                                          FontWeight
                                                                              .w500,
                                                                          AppColors
                                                                              .blackColor,
                                                                          "4000 ml"),
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
                                                const SizedBox(
                                                  height: 9,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Stack(
                                                      children: [
                                                        SvgPicture.asset(
                                                          ImagesUrl.balbaBG,
                                                          height: 44,
                                                          width: 54,
                                                        ),
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 5,
                                                                      left: 5),
                                                              child: SvgPicture
                                                                  .asset(
                                                                ImagesUrl
                                                                    .balbIcon,
                                                                height: 23,
                                                                width: 20,
                                                              ),
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Expanded(
                                                        child: HelperWidget()
                                                            .testMethodStartAlign(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .textColorQus,
                                                                "Don’t drink cold water immediately after hot drinks like tea or coffee."))
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),

                                    /// other container

                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16)),
                                        gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              AppColors.whiteColor,
                                              AppColors.whiteColor40
                                            ]),
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              HelperWidget()
                                                  .testMethodStartAlign(
                                                      16.0,
                                                      FontWeight.w500,
                                                      AppColors.textColorQus,
                                                      "Cycle History"),
                                              HelperWidget()
                                                  .testMethodStartAlign(
                                                      12.0,
                                                      FontWeight.w500,
                                                      AppColors.colorPrimary,
                                                      "See All"),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const EdgeInsets.only(
                                                left: 15, right: 15, top: 15),
                                            height: 139,
                                            decoration: BoxDecoration(
                                              color: AppColors.homePageSym,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                HelperWidget().testMethodStartAlign(
                                                    12.0,
                                                    FontWeight.w500,
                                                    AppColors.homePageDailyRCS,
                                                    "Previous Menstrual Symptoms"),
                                                const SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 44,
                                                          width: 44,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Image.asset(
                                                                  ImagesUrl
                                                                      .smilingFaceWithTear,
                                                                  height: 24,
                                                                  width: 24,
                                                                  fit: BoxFit
                                                                      .contain,
                                                                )
                                                              ]),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget()
                                                            .testMethod(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .blackColor,
                                                                "Mood \n Swings")
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 44,
                                                          width: 44,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          child: Column(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                SvgPicture
                                                                    .asset(
                                                                  ImagesUrl
                                                                      .syMoodPre,
                                                                  color: AppColors
                                                                      .homeCramps,
                                                                  height: 24,
                                                                  width: 24,
                                                                  fit: BoxFit
                                                                      .fill,
                                                                )
                                                              ]),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget()
                                                            .testMethod(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .blackColor,
                                                                "Cramps \n ")
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 44,
                                                          width: 44,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                ImagesUrl
                                                                    .smpToms,
                                                                height: 20,
                                                                width: 20,
                                                                fit:
                                                                    BoxFit.fill,
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget()
                                                            .testMethod(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .blackColor,
                                                                "Cravings \n ")
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Container(
                                                          height: 44,
                                                          width: 44,
                                                          decoration:
                                                              const BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: AppColors
                                                                      .whiteColor),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SvgPicture.asset(
                                                                ImagesUrl
                                                                    .nounHeadache,
                                                                height: 24,
                                                                width: 24,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        HelperWidget()
                                                            .testMethod(
                                                                12.0,
                                                                FontWeight.w400,
                                                                AppColors
                                                                    .blackColor,
                                                                "Headache \n ")
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 79,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          HelperWidget()
                                                              .testMethodStartAlign(
                                                                  12.0,
                                                                  FontWeight
                                                                      .w400,
                                                                  AppColors
                                                                      .homePageDailyRCS,
                                                                  "Average Cycle \n length"),
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .homePageBottomColorLine1),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      HelperWidget()
                                                          .testMethodStartAlign(
                                                              14.0,
                                                              FontWeight.w500,
                                                              AppColors
                                                                  .blackColor,
                                                              "39 Days"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 79,
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 15),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          HelperWidget()
                                                              .testMethodStartAlign(
                                                                  12.0,
                                                                  FontWeight
                                                                      .w400,
                                                                  AppColors
                                                                      .homePageDailyRCS,
                                                                  "Average Cycle \n length"),
                                                          Container(
                                                            height: 30,
                                                            width: 30,
                                                            decoration: const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: AppColors
                                                                    .homePageBottomColorLine1),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      HelperWidget().testMethod(
                                                          14.0,
                                                          FontWeight.w500,
                                                          AppColors.blackColor,
                                                          "39 Days"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Container(
                                            height: 61,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            margin: const EdgeInsets.only(
                                                left: 0, right: 10),
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15),
                                            decoration: BoxDecoration(
                                                color: AppColors
                                                    .homePageDailyCyHis,
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(10.r),
                                                )),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    HelperWidget()
                                                        .testMethodStartAlign(
                                                            12.0,
                                                            FontWeight.w400,
                                                            AppColors
                                                                .homePageDailyRCS,
                                                            "Previous Flow Intensity"),
                                                    SvgPicture.asset(
                                                      ImagesUrl.moderateFlow,
                                                      height: 23,
                                                      width: 24,
                                                    )
                                                    /*  Container(
                                                        height: 30,
                                                        width: 30,
                                                        decoration: const BoxDecoration(
                                                            shape: BoxShape.circle,
                                                            color: AppColors
                                                                .homePageBottomColorLine1),
                                                      ),*/
                                                  ],
                                                ),
                                                HelperWidget()
                                                    .testMethodStartAlign(
                                                        14.0,
                                                        FontWeight.w500,
                                                        AppColors.blackColor,
                                                        "Moderate Flow"),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              HelperWidget()
                                                  .testMethodStartAlign(
                                                      16.0,
                                                      FontWeight.w500,
                                                      AppColors.textColorQus,
                                                      "Cycle Summary"),
                                            ],
                                          ),



                                          ///
                                          ///
                                          ///
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  height: 152,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors
                                                              .homePageDailyRCS,
                                                          "Average Cycle length"),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      SizedBox(
                                                        height: 30,
                                                        width: 30,
                                                        child:
                                                        SimpleCircularProgressBar(
                                                          valueNotifier:
                                                              valueNotifier,
                                                          progressColors: const [
                                                            AppColors
                                                                .avgCycleDayProgressBarFull
                                                          ],
                                                          backColor: AppColors
                                                              .avgCycleDayProgressBarBG,
                                                          fullProgressColor:
                                                              AppColors
                                                                  .avgCycleDayProgressBarFull,
                                                          mergeMode: true,
                                                        ),
                                                      ),
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors.blackColor,
                                                          "39 Days"),
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors
                                                              .homePageDailyRCST,
                                                          "ABNORMAL"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 152,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors
                                                              .homePageDailyRCS,
                                                          "Average Cycle length"),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                          height: 30,
                                                          width: 30,
                                                          child:
                                                          SimpleCircularProgressBar(
                                                            valueNotifier:
                                                                valueNotifier,
                                                            progressColors: const [
                                                              AppColors
                                                                  .colorPrimary
                                                            ],
                                                            backColor: AppColors
                                                                .nrmCycleDayProgressBarBG,
                                                            fullProgressColor:
                                                                AppColors
                                                                    .colorPrimary,
                                                            mergeMode: true,
                                                          )),
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors.blackColor,
                                                          "7 Days"),
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors
                                                              .homePageDailyRCSTG,
                                                          "NORMAL"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  height: 152,
                                                  margin: const EdgeInsets.only(
                                                      left: 0, right: 10),
                                                  decoration: BoxDecoration(
                                                      color:
                                                          AppColors.whiteColor,
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.r),
                                                      )),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors
                                                              .homePageDailyRCS,
                                                          "Average Cycle length"),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                          height: 30,
                                                          width: 30,
                                                          child:
                                                          SimpleCircularProgressBar(
                                                            valueNotifier:
                                                                valueNotifier,
                                                            backColor: AppColors
                                                                .nrmCycleDayProgressBarBG,
                                                            progressColors: const [
                                                              AppColors
                                                                  .cycleLengthDayProgressFull
                                                            ],
                                                            fullProgressColor:
                                                                AppColors
                                                                    .cycleLengthDayProgressFull,
                                                            mergeMode: true,
                                                          )),
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors.blackColor,
                                                          "3 Days"),
                                                      HelperWidget().testMethod(
                                                          12.0,
                                                          FontWeight.w400,
                                                          AppColors
                                                              .homePageDailyRCSTG,
                                                          "Regular"),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 15,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );}),
          )
        ],
      ),
    );
  }
}
