import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../utils/helper_widgets/helper_widgets.dart';
import '../../routes/routes.dart';

class CycleTrackController extends GetxController {
  late ItemScrollController cycleTrackScrollController = ItemScrollController();

  var initialIndexCycleTrack = (DateTime.now().year - 2023) * 12 + 12;
  var checkBoxValues = {}.obs; // Maintain separate state for each day
  var dayOfPeriods = "5".obs;
  var periodsCycleLength = "28".obs;

  List<String> periodsCycleLengthA = [
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31",
    "32",
    "33"
  ].obs;
  List<String> dayOfPeriodsA = ["1", "2", "3", "4", "5", "6", "7", "8"].obs;
  var waterContainerVolume = [
    "100 ml",
    "200 ml",
    "300 ml",
    "400 ml",
    "500 ml",
    "600 ml",
    "700 ml"
  ].obs;
  var selectedWaterInTakeVolume = "1 L".obs;
  var selectedIntervalTimeWater = "1 h".obs;
  var selectedWaterContainerVolume = "100 ml".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  DateTime getDateStringCon(String dateString) {
    List<String> parts = dateString.split('-');

    // Add leading zeros to the month and day parts if needed
    String month = parts[1].padLeft(2, '0');
    String day = parts[2].padLeft(2, '0');

    // Create a new date string with leading zeros
    String formattedDateString = '${parts[0]}-$month-$day';

    // Parse the formatted date string into a DateTime object
    DateTime date = DateTime.parse(formattedDateString);
    return date;
  }

  Set<int> checkDateBelongsMonth(String dateString, mapData) {
    // Define the given date
    DateTime givenDate =
        getDateStringCon(dateString); // Example date: January 2, 2024

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Extract the month and year components from the given date
    int givenMonth = givenDate.month;
    int givenYear = givenDate.year;

    // Extract the month and year components from the current date
    int currentMonth = currentDate.month;
    int currentYear = currentDate.year;

    // Calculate the previous month and the month before it
    int previousMonth = currentMonth - 1 <= 0 ? 12 : currentMonth - 1;
    int previousMonthYear =
        currentMonth - 1 <= 0 ? currentYear - 1 : currentYear;

    int twoMonthsAgo = previousMonth - 1 <= 0 ? 12 : previousMonth - 1;
    int twoMonthsAgoYear =
        previousMonth - 1 <= 0 ? previousMonthYear - 1 : previousMonthYear;

    // Compare the month and year components
    if (givenYear == currentYear && givenMonth == currentMonth) {
      mapData.add(1);
      debugPrint('The given date belongs to the current month.');
    } else if ((givenYear == currentYear && givenMonth == previousMonth)) {
      mapData.add(2);
      debugPrint(
          'The given date belongs to the previous month or two months ago.');
    }
    /*else if ((givenYear == previousMonthYear &&
            givenMonth == previousMonth) ) {
      mapData.add(3);
      debugPrint(
          'The given date belongs to the previous month or two months ago.');
    }*/
    else if ((givenYear == twoMonthsAgoYear && givenMonth == twoMonthsAgo)) {
      mapData.add(3);
      debugPrint(
          'The given date belongs to the previous month or two months ago.');
    } else {
      debugPrint(
          'The given date is not in the current, previous, or next month.');
    }

    return mapData;
  }

  isDateBelongsToTwoMonths(BuildContext context) {
    if (checkBoxValues.isNotEmpty) {
      List<DateTime> dates = [];
      checkBoxValues.forEach((dateString, isSelected) {
        if (isSelected) {
          dates.add(getDateStringCon(dateString));
        }
      });

      // Extract the months from the selected dates
      Set<String> months = dates.map((date) => "${date.year}${date.month}").toSet();
      print(months.toString());
      // Check if the selected dates belong to two consecutive months and all values are true
      if (months.length >= 2) {
        Navigator.pushNamed(context, Routes.cycleTrackSecondPage);
        /*    // Check if the months are consecutive (e.g., February 2023 and February 2024)
      int minMonth = months.reduce((value, element) => value < element ? value : element);
      int maxMonth = months.reduce((value, element) => value > element ? value : element);
      return maxMonth - minMonth == 1;*/
      } else {
        HelperWidget().flutterCustomToast("Select 2 Month Date");
      }
    } else {
      HelperWidget().flutterCustomToast("Select 2 Month Date");
    }
    // Extract the selected dates from the map where the values are true
  }


/*  Set<int>  isDateBelongsToTwoMonths(String dateS, int startYear, int startMonth, int endYear, int endMonth,mapData) {
    DateTime date =
    getDateStringCon(dateS);
    DateTime startDate1 = DateTime(startYear, startMonth,0);
    DateTime endDate1 = DateTime(endYear, endMonth + 1, 0); // Last day of the month
    DateTime startDate2 = DateTime(endYear, endMonth, 0);
    DateTime endDate2 = DateTime(startYear, startMonth + 1, 0); // Last day of the month

    if ((date.isAfter(startDate1) || date.isAtSameMomentAs(startDate1)) &&
        (date.isBefore(endDate2) || date.isAtSameMomentAs(endDate2))) {
      mapData.add(1);
      //return true;
    }

    if ((date.isAfter(startDate2) || date.isAtSameMomentAs(startDate2)) &&
        (date.isBefore(endDate1) || date.isAtSameMomentAs(endDate1))) {
      mapData.add(1);
     // return true;
    }

    return mapData;
    //return false;
  }*/
// only two month data validation according to currect

/* Set<int> checkDateBelongsMonth(String dateString, mapData) {
    // Define the given date
    DateTime givenDate =
        getDateStringCon(dateString); // Example date: January 2, 2024

    // Get the current date
    DateTime currentDate = DateTime.now();

    // Extract the month and year components from the given date
    int givenMonth = givenDate.month;
    int givenYear = givenDate.year;

    // Extract the month and year components from the current date
    int currentMonth = currentDate.month;
    int currentYear = currentDate.year;

    // Calculate the previous month and the month before it
    int previousMonth = currentMonth - 1 <= 0 ? 12 : currentMonth - 1;
    int previousMonthYear =
        currentMonth - 1 <= 0 ? currentYear - 1 : currentYear;

    int twoMonthsAgo = previousMonth - 1 <= 0 ? 12 : previousMonth - 1;
    int twoMonthsAgoYear =
        previousMonth - 1 <= 0 ? previousMonthYear - 1 : previousMonthYear;

    // Compare the month and year components
    if (givenYear == currentYear && givenMonth == currentMonth) {
      mapData.add(1);
      debugPrint('The given date belongs to the current month.');
    } else if ((givenYear == currentYear && givenMonth == previousMonth)) {
      mapData.add(2);
      debugPrint(
          'The given date belongs to the previous month or two months ago.');
    }
    */ /*else if ((givenYear == previousMonthYear &&
            givenMonth == previousMonth) ) {
      mapData.add(3);
      debugPrint(
          'The given date belongs to the previous month or two months ago.');
    }*/ /*
    else if ((givenYear == twoMonthsAgoYear && givenMonth == twoMonthsAgo)) {
      mapData.add(3);
      debugPrint(
          'The given date belongs to the previous month or two months ago.');
    } else {
      debugPrint(
          'The given date is not in the current, previous, or next month.');
    }

    return mapData;
  }*/

/*  Set<bool> checkDateBelongsMonth(String dateString, mapData) {

    // Define the given date
    DateTime givenDate =
    getDateStringCon(dateString); // Example date: January 2, 2024
    // Get the current date
    DateTime currentDate = DateTime.now();
    // Extract the month and year components from the given date
    int givenMonth = givenDate.month;
    int givenYear = givenDate.year;
    // Extract the month and year components from the current date
    int currentMonth = currentDate.month;
    int currentYear = currentDate.year;
    // Compare the month and year components
    if (givenYear == currentYear && givenMonth == currentMonth) {
      mapData.add(true);
      debugPrint('The given date belongs to the current month.');
      return mapData;
    } else if (givenYear == currentYear && givenMonth == currentMonth - 1) {
      mapData.add(false);
      debugPrint('The given date belongs to the previous month.');
      return mapData;
    }
    else {
      debugPrint(
          'The given date is not in the current, previous, or next month.');
      return {};
    }
  }*/
}