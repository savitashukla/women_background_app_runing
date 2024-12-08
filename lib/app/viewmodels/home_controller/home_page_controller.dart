import 'dart:math' as math;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:o_woman/app/models/profile_view_data.dart';
import 'package:o_woman/app/services/profile_View/profile_request.dart';
import 'package:o_woman/constants/images_url.dart';
import 'package:o_woman/utils/hive_helper.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:workmanager/workmanager.dart';

import '../post_login/cycle_track_controller.dart';

class HomePageController extends GetxController {
  CycleTrackController controller = Get.put(CycleTrackController());
  var testData = "Period In 2 Days".obs;
  var circleCenterTextData = "Edit Period Dates".obs;
  var offset = Offset.zero.obs;
  Rx<UserProfileData> profiledata = UserProfileData().obs;
  RxBool isProfileLoading = false.obs;
  RxBool isEmptySymptomsMoods = false.obs;
  RxBool isEmptyHealth = false.obs;

  RxBool isPillsConEmpty = false.obs;
  var selectedIndexMonth = 10000000.obs;
  var remainingDays = 0.obs;
  var visibleFastIndex = 0.obs;
  var visibleLastIndex = 0.obs;
  var dateClick = "${DateTime.now().day}".obs;
  var oneDayPeriodComing = "5".obs;

  var cyclePeriods = 0.obs;
  var cycleFollicular = 0.obs;
  var cycleOvulation = 0.obs;
  var cycleLuteal = 0.obs;

  var periodTimeGoing = {}.obs;
  RxBool getPregnant = false.obs;

  var syModeImage = [
    ImagesUrl.carromImage,
    ImagesUrl.smpToms,
    ImagesUrl.smpToms,
    ImagesUrl.carromImage,
    ImagesUrl.carromImage,
  ];
  var healthLifeSyA = [
    ImagesUrl.healthLifeSy,
    ImagesUrl.carromImage,
    ImagesUrl.runCycle,
    ImagesUrl.healthLifeSy,
    ImagesUrl.carromImage,
  ];
  var syModeString = ["Calm", "Craving", "Sweaty", "Craving", "Calm"];
  var healthLifeSyS = [
    "Sleep 8 Hours",
    "Weight 60 Kg",
    "Cycling",
    "Sleep 8 Hours",
    "Weight 60 Kg",
  ];

  var oneDayPeriodMore = "22".obs;

  var ovulationTime = {}.obs;
  var ovulationTimeMore = "5".obs;

  var follicular = {}.obs;
  var follicularMore = "29".obs;
  var luteal = {}.obs;
  var lutealMore = "12".obs;
  var pillCheckUnCheck = false.obs;

  final ScrollOffsetController scrollOffsetController =
      ScrollOffsetController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  final ScrollOffsetListener scrollOffsetListener =
      ScrollOffsetListener.create();
  final ItemScrollController itemScrollControllerDate = ItemScrollController();
  var kGradientBoxDecoration = const BoxDecoration(
    shape: BoxShape.circle,
    gradient: LinearGradient(colors: [Color(0xff9DA4FB), Color(0xffF496C4)]),
  ).obs;

  DateTime? periodStartDate;

  DateTime? periodPhaseEnd;

  DateTime? follicularPhaseStart;

  DateTime? follicularPhaseEnd;

  DateTime? ovulationDateStart;

  DateTime? ovulationDateEnd;

  DateTime? lutealPhaseStart;

  DateTime? lutealPhaseEnd;

  DateTime? periodStartDateAgain;

  DateTime? periodStartDateAgainEnd;

  static double onDayDegree() {
    double degree = 2 * pi * (500 / 2.5);
    degree = degree / 31;
    return degree;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
   profileViewData();
    calculateAllCycle();
    calculateAllCycleCorrect();
    scrollOffsetListener.changes.listen((event) {
      // print(event);
    });
    itemPositionsListener.itemPositions.addListener(() {
      print(
          '====current first fast number ${itemPositionsListener.itemPositions.value.first.index}====');
      visibleFastIndex.value =
          itemPositionsListener.itemPositions.value.first.index;
      visibleLastIndex.value =
          itemPositionsListener.itemPositions.value.last.index;
      DateTime currentDate = DateTime(DateTime.now().year, DateTime.now().month,
          itemPositionsListener.itemPositions.value.first.index + 1);


/// move pointer stop

      // dateClick.value = DateFormat('d').format(currentDate);

     // testData.value = "pickupDate ${dateClick.value}";
     // getOffsetAccording(dateClick.value);

      print(
          '====current last ${itemPositionsListener.itemPositions.value.last.index}====');

      // this is call as like current date fast

      /*    methodRemainingDate();
      DateTime currentDate = DateTime.now().add(Duration(
          days: itemPositionsListener.itemPositions.value.first.index));

      if (currentDate.month == DateTime.now().month) {
        currentDate = DateTime.now().add(Duration(
            days: itemPositionsListener.itemPositions.value.first.index));

        dateClick.value = DateFormat('d').format(currentDate);
      } else {
        var currentDate = DateTime.now().subtract(Duration(
            days: itemPositionsListener.itemPositions.value.first.index -
                remainingDays.value));
        dateClick.value =
            DateFormat('d').format(currentDate); // Day of the month as a number
      }*/
    });

    // calculateAllCycle();
  }



 String  getDateValues(int index)
  {
  return  DateFormat('d')
        .format(DateTime(DateTime.now().year, DateTime.now().month, index + 1));
  }
  String  getDayNameValues(int index)
  {
   return DateFormat('E')
       .format(DateTime(DateTime.now().year, DateTime.now().month, index + 1));

  }
  void methodRemainingDate() {
    int totalDaysInMonth = DateTime(
      DateTime.now().year,
      DateTime.now().month + 1,
      0,
    ).day;
    int currentDay = DateTime.now().day;
    remainingDays.value = totalDaysInMonth - currentDay;
  }

  void getOffsetAccording(date) {
    // Assuming centerX and centerY are the center coordinates of your container
    double centerX = 125;
    double centerY = 125;

    // Radius of the container
    double radius = 250 / 2.5;

    // Get the number of days in the current month
    int daysInMonth = DateTime.now().month == 2
        ? (DateTime.now().year % 4 == 0 ? 29 : 28)
        : [0, 2, 4, 6, 7, 9, 11].contains(DateTime.now().month)
            ? 31
            : 30;

    // Calculate the angle for one day
    //  double angleForOneDay = 2 * math.pi / daysInMonth;

    // Calculate the current angle based on the date
    // double currentAngle = int.parse(date) * angleForOneDay;

    double angleForOneDay =
        2 * math.pi / int.parse(controller.periodsCycleLength.value);

    // Calculate the current angle based on the date
    double currentAngle = (-math.pi / 2) +
        (int.parse(date) - 3) * angleForOneDay; // Start from the top

    // Calculate the point coordinates
    double pointX = centerX + radius * math.cos(currentAngle);
    double pointY = centerY + radius * math.sin(currentAngle);

    // Assign the calculated offset
    offset.value = Offset(pointX, pointY);
  }

  void getTimeWorkManagerShowTask(int initialDelay, int frequency) {
    Workmanager().registerPeriodicTask(
      "simplePeriodic1HourTask",
      "simplePeriodic1HourTaskOnly",
      existingWorkPolicy: ExistingWorkPolicy.replace,
      initialDelay: Duration(seconds: initialDelay),
      // Delay before the first execution

      // frequency:  Duration(minutes: frequency*10),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  void calculateAllCycle() {
    print("checkBoxValues${controller.checkBoxValues.toString()}");
    periodStartDate = DateTime(2024, 1, 1);

    periodTimeGoing["${periodStartDate!.day}"] = "${periodStartDate!.day}";
    periodPhaseEnd = periodStartDate!.add(const Duration(days: 4));

    for (int a = 1; a < 5; a++) {
      periodTimeGoing["${periodStartDate!.add(Duration(days: a)).day}"] =
          "${periodStartDate!.add(Duration(days: a)).day}";
    }

    // Follicular Phase
    follicularPhaseStart = periodPhaseEnd!.add(const Duration(days: 1));

    follicular["${follicularPhaseStart!.day}"] = "${follicularPhaseStart!.day}";

    follicularPhaseEnd = follicularPhaseStart!.add(const Duration(days: 5));

    for (int a = 1; a < 6; a++) {
      follicular["${follicularPhaseStart!.add(Duration(days: a)).day}"] =
          "${follicularPhaseStart!.add(Duration(days: a)).day}";
    }

    // Ovulation
    ovulationDateStart = follicularPhaseEnd!.add(const Duration(days: 1));

    ovulationTime["${ovulationDateStart!.day}"] = "${ovulationDateStart!.day}";

    ovulationDateEnd = ovulationDateStart!.add(const Duration(days: 6));

    for (int a = 1; a < 7; a++) {
      ovulationTime["${ovulationDateStart!.add(Duration(days: a)).day}"] =
          "${ovulationDateStart!.add(Duration(days: a)).day}";
    }

    // Luteal Phase
    lutealPhaseStart = ovulationDateEnd!.add(const Duration(days: 1));
    luteal["${lutealPhaseStart!.day}"] = "${lutealPhaseStart!.day}";

    for (int a = 1;
        a <
            int.parse(controller.periodsCycleLength.value) -
                lutealPhaseStart!.day;
        a++) {
      luteal["${lutealPhaseStart!.add(Duration(days: a)).day}"] =
          "${lutealPhaseStart!.add(Duration(days: a)).day}";
    }
    lutealPhaseEnd = lutealPhaseStart!.add(Duration(
        days: int.parse(controller.periodsCycleLength.value) -
            lutealPhaseStart!.day));

    periodStartDateAgain = lutealPhaseEnd!.add(const Duration(days: 1));
    periodTimeGoing["${periodStartDateAgain!.day}"] =
        "${periodStartDateAgain!.day}";

    periodStartDateAgainEnd =
        periodStartDateAgain!.add(const Duration(days: 4));
    for (int a = 1; a < 5; a++) {
      periodTimeGoing["${periodStartDateAgain!.add(Duration(days: a)).day}"] =
          "${periodStartDateAgain!.add(Duration(days: a)).day}";
    }

    print("print call hear${periodTimeGoing.toString()}");
    print("print call hear${follicular.toString()}");
    print("print call hear${luteal.toString()}");
    print("print call hear${ovulationTime.toString()}");
  }



  void calculateAllCycleCorrect() {
    cyclePeriods.value = int.parse(controller.dayOfPeriods.value);

    cycleFollicular.value = 6;
    // Ovulation

    cycleOvulation.value = 7;
    // Luteal Phase
    cycleLuteal.value = (int.parse(controller.periodsCycleLength.value) -
        (cycleOvulation.value + cyclePeriods.value + cycleFollicular.value));

    print("cyclePeriods.value ${cyclePeriods.value}");
    print("cycleFollicular.value ${cycleFollicular.value}");
    print("cycleOvulation.value ${cycleOvulation.value}");
    print("cycleLuteal.value ${cycleLuteal.value}");
  }

  String formatDate(DateTime date) {
    return DateFormat('MMMM dd, yyyy').format(date);
  }

  void alwaysFalse() {
    getPregnant.value = false;
  }

  Future profileViewData() async {
    isProfileLoading.value = true;
    var response = await ProfileService().getprofileData(HiveHelper.getData("customer_id"));
    isProfileLoading.value = false;
    response.fold((l) {
    }, (r) {
      isProfileLoading.value = false;
      profiledata.value = r;

    });
  }
}
