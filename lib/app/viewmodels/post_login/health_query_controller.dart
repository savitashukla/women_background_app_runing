import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HealthQueryController extends GetxController {
  RxBool selectIntentCycleTrackClick = false.obs;
  RxBool selectIntentGetPregnantClick = false.obs;
  RxString selectedDOB = "".obs;
  Rx<DateTime> initialDate = DateTime.now().obs;

  // fast Screen menstrual
  RxBool selectYesMenstrual = false.obs;
  RxBool selectNoMenstrual = false.obs;

  // secondScreen
  RxBool selectMenstrualSecondLight = false.obs;
  RxBool selectMenstrualSecondModerate = false.obs;
  RxBool selectMenstrualSecondHeavy = false.obs;

  // third screen
  RxBool selectMenstrualThirdYes = false.obs;
  RxBool selectMenstrualThirdNo = false.obs;

  RxBool selectHealthConditionYes = false.obs; //A
  RxBool selectHealthConditionNo = false.obs; //A

  RxBool selectMethodDaily = false.obs; //A
  RxBool selectMethodWeekly = false.obs; //A
  RxBool selectMethodMonthly = false.obs; //A
  RxBool selectMethodRarely = false.obs; //A
  RxBool selectMethodNever = false.obs; //A

  RxBool selectFertDaily = false.obs; //A
  RxBool selectFertWeekly = false.obs; //A
  RxBool selectFertMonthly = false.obs; //A
  RxBool selectFertRarely = false.obs; //A
  RxBool selectFertNever = false.obs; //A

  RxBool selectVerysatisfied = false.obs; //A
  RxBool selectSatisfied = false.obs; //A
  RxBool selectNeutral = false.obs; //A
  RxBool selectDissatisfied = false.obs; //A
  RxBool selectVerydissatisfied = false.obs; //A

  RxBool selectPoor = false.obs; //A
  RxBool selectFair = false.obs; //A
  RxBool selectGood = false.obs; //A
  RxBool selectExcellent = false.obs; //A

  RxBool selectYes = false.obs; //A
  RxBool selectNo = false.obs; //A

  RxBool selectWater1 = false.obs; //A
  RxBool selectWater2 = false.obs; //A
  RxBool selectWater3 = false.obs; //A

  RxBool regularly = false.obs; //A
  RxBool occassionally = false.obs; //A
  RxBool rarely = false.obs; //A

  RxBool selectRegularly = false.obs; //A
  RxBool selectOccassionally = false.obs; //A
  RxBool selectRarely = false.obs; //A
  RxBool selectNever = false.obs; //A
  RxBool skipTrue = false.obs; //A

  RxBool selectReg = false.obs; //A
  RxBool selectOcca = false.obs; //A
  RxBool selectRar = false.obs; //A
  RxBool selectNev = false.obs; //A

  RxBool selectW1 = false.obs; //A
  RxBool selectW2 = false.obs; //A
  RxBool selectW3 = false.obs; //A

  RxBool selectRegu = false.obs; //A
  RxBool selectOccas = false.obs; //A
  RxBool selectRare = false.obs; //A
  RxBool selectNeve = false.obs; //A

  RxBool selectFP1 = false.obs; //A
  RxBool selectUPC2 = false.obs; //A
  RxBool selectRR = false.obs; //A
  RxBool selectHM3 = false.obs; //A
  RxBool selectOther = false.obs; //A

  RxBool selectRegu1 = false.obs; //A
  RxBool selectOccas1 = false.obs; //A
  RxBool selectRare1 = false.obs; //A
  RxBool selectNeve1 = false.obs; //A

  RxBool selectFP11 = false.obs; //A
  RxBool selectUPC22 = false.obs; //A
  RxBool selectRR33 = false.obs; //A
  RxBool selectH44 = false.obs; //A
  RxBool selectOther55 = false.obs; //A
  RxBool male = false.obs; //A
  RxBool female = false.obs; //A

  RxBool changeDOB = false.obs;

  RxBool myselfSelected = true.obs;
  RxString nameInput = "".obs;
  var relationEditingController = TextEditingController().obs;
  RxList<String> relationsList = [
    "Daughter",
    "Sister",
    "Wife",
    "Friend",
    "Relative",
  ].obs;

  RxList<RxBool>? selectedRelation;
  // var dateOfBirthController = TextEditingController().obs;//A
  RxString dateOfBirthText = "".obs; //A
  Rx<DateTime> selectedDate = DateTime(2004).obs;

  setDate(DateTime date) {
    selectedDate.value = date;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    selectedRelation =
        RxList.generate(relationsList.length, (index) => false.obs);
    dateOfBirthText.value = "Select date of birth";
    // DateFormat('dd-MM-yyyy').format(DateTime(2004));
  }
}
