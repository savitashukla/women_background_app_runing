// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:o_woman/utils/logger_utils.dart';
import 'package:workmanager/workmanager.dart';

import '../../../utils/hive_helper.dart';
import '../../app.dart';
import '../../services/local_notification_service.dart';

class WaterLogManagementController extends GetxController {
  var waterInTakeVolume =
      ["1 L", "1.5 L", "2 L", "2.5 L", "3 L", "3.5 L", "4 L"].obs;
  var intervalTimeWater = ["1 h", "2 h", "3 h", "4 h", "6 h", "7 h", "8 h"].obs;
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
  var selectedIntervalTimeWaterOnly = "1".obs;
  var selectedWaterContainerVolume = "100 ml".obs;
  var autoOnToggleWaterReminder = false.obs;

  RxInt durationStartHours = 7.obs;
  RxInt durationStartMinutes = 30.obs;

  RxInt durationEndHours = 7.obs;
  RxInt durationEndMinutes = 30.obs;
  RxInt durationEndCountH = 7.obs;
  RxInt durationEndCountM = 7.obs;



/*  var durationStart = Duration(hours: 7, minutes: DateTime.now().minute).obs;
  var durationEnd = const Duration(hours: 22, minutes: 00).obs;*/



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getDurationData();
  }

  Future<void> getTimeWorkManagerShowTask(
      int initialDelay, int frequency) async {
    Workmanager().registerPeriodicTask(
      "Water Reminder",
      "Drink your water",
      existingWorkPolicy: ExistingWorkPolicy.replace,
      initialDelay:
          Duration(seconds: initialDelay), // Delay before the first execution
      frequency: Duration(minutes: frequency),
      constraints: Constraints(
        networkType: NetworkType.connected,
      ),
    );
  }

  Future<void> offTimeWorkManagerShowTask() async {

    Workmanager().cancelByUniqueName("Water Reminder");
    autoOnToggleWaterReminder.value = false;
    HiveHelper.insertData(
        "autoOnToggleWaterReminder", "${autoOnToggleWaterReminder.value}");
  }

  callNotificationReminder(int frequency) {

    LocalNotificationService.scheduleReminder(
       durationStartHours.value, durationStartMinutes.value, frequency);
  }

  Future<void> saveOnTapCondition() async {
    if (durationStartHours.value < durationEndHours.value) {
      bool returnV = await LocalNotificationService.requestPermissions();
      if (returnV) {
        String numericPart = selectedIntervalTimeWater.value
            .replaceAll(RegExp(r'[^0-9]'), '')
            .trim();
        autoOnToggleWaterReminder.value = true;
        HiveHelper.insertData("durationStartReminderNotiHours", durationStartHours.value);
        HiveHelper.insertData("durationEndReminderNotiHours", durationEndHours.value);
        HiveHelper.insertData("durationEndReminderNotiMinutes", durationEndMinutes.value);
        HiveHelper.insertData("durationStartReminderNotiMinutes", durationStartMinutes.value);


        HiveHelper.insertData(
            "autoOnToggleWaterReminder", autoOnToggleWaterReminder.value);
        getTimeWorkManagerShowTask(10, int.parse(numericPart));
        callNotificationReminder(int.parse(numericPart));
        Fluttertoast.showToast(
            msg:
                "Reminder Notification Set Successful Interval Time is  $numericPart h");
        Navigator.pop(navigatorKey.currentState!.context);
      } else {
        Fluttertoast.showToast(msg: "Notification Permission Ungranted");
      }
    } else {
      Fluttertoast.showToast(msg: "End Time should be greater than Start Time");
    }
  }

  void getDurationData() {
    if (HiveHelper.getData("durationStartReminderNotiHours") != null) {
      print(
          "check data hear${HiveHelper.getData("autoOnToggleWaterReminder")}");
      durationStartHours.value =HiveHelper.getData("durationStartReminderNotiHours");
      durationEndHours.value =HiveHelper.getData("durationEndReminderNotiHours");
      durationEndMinutes.value = HiveHelper.getData("durationEndReminderNotiMinutes");
      durationStartMinutes.value = HiveHelper.getData("durationStartReminderNotiMinutes");
      autoOnToggleWaterReminder.value =
          HiveHelper.getData("autoOnToggleWaterReminder");

    }
  }
}

Duration parseDuration(String durationString) {
  List<String> components = durationString.split(':');
  int hours = int.parse(components[0]);
  int minutes = int.parse(components[1]);
//  int seconds = int.parse(components[2]);
  return Duration(hours: hours, minutes: minutes, seconds: 00);
}

void callbackDispatcher() {

  Workmanager().executeTask((task, inputData) async {
    WaterLogManagementController waterLogManagement =
        await Get.put(WaterLogManagementController());
    // Check if the current time is between 7 am and 7 pm
    DateTime now = DateTime.now();
    int currentMinutes =
        (now.hour * 60) + now.minute; // Convert current time to minutes
// Convert durationStart and durationEnd to minutes
    int startMinutes = (waterLogManagement.durationStartHours.value * 60) + waterLogManagement.durationStartMinutes.value;
    int endMinutes = (waterLogManagement.durationEndHours.value * 60) +
        waterLogManagement.durationEndMinutes.value;

    print("call all timew $currentMinutes $startMinutes $endMinutes");

    // Adding 12 hours
    if (currentMinutes >= startMinutes && currentMinutes < endMinutes) {
      // Show your notification here
      LocalNotificationService.showNotification();
    }

    return Future.value(true);
  });
}