import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NewCalendarController extends GetxController{

 var selectedMonth = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;

  var editCalendarClick = false.obs;
  var isYearView = false.obs;
  var checkBoxValues = {}.obs; // Maintain separate state for each day

//
  var pregnancyTimeGood = {};
  var periodsTimeGoing = {};
  var pregnancyTimeGoing = {};

  var selectedItem = ''.obs;

  void changeMonth(int offset) {
    selectedMonth.value = DateTime(
      selectedMonth.value.year,
      selectedMonth.value.month + offset,
      selectedMonth.value.day,
    );
  }

  String formatMonthYear(DateTime dateTime) {
    return DateFormat('MMMM yyyy').format(dateTime);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fillAllDataStatic();
  }

// jan month view
  void fillAllDataStatic() {
    //jan
    pregnancyTimeGoing["202413"] = 3;
    pregnancyTimeGoing["202414"] = 4;
    pregnancyTimeGoing["202416"] = 6;
    pregnancyTimeGoing["202417"] = 7;
    pregnancyTimeGood["202415"] = 5;
    periodsTimeGoing["2024121"] = 21;
    periodsTimeGoing["2024122"] = 22;
    periodsTimeGoing["2024123"] = 23;
    periodsTimeGoing["2024124"] = 24;
    periodsTimeGoing["2024125"] = 25;

// fev
    pregnancyTimeGoing["202426"] = 6;
    pregnancyTimeGoing["202427"] = 7;
    pregnancyTimeGoing["202429"] = 9;
    pregnancyTimeGoing["2024210"] = 10;
    pregnancyTimeGood["202428"] = 8;
    periodsTimeGoing["2024223"] = 23;
    periodsTimeGoing["2024224"] = 24;
    periodsTimeGoing["2024225"] = 25;
    periodsTimeGoing["2024226"] = 26;
    periodsTimeGoing["2024227"] = 27;

  }
}
