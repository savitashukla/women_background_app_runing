import 'package:alarm/alarm.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:o_woman/constants/app_colors.dart';
import 'package:o_woman/utils/hive_helper.dart';
import 'package:workmanager/workmanager.dart';

import 'app/app.dart';
import 'app/services/local_notification_service.dart';
import 'app/services/request.dart';
import 'app/viewmodels/home_controller/water_log_management.dart';
import 'app/views/home/circle_paint/const/size_const.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveHelper.initializeHiveAndRegisterAdapters();
  await LocalNotificationService().initialize();
 // secureScreen();
  await Alarm.init();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);


  // LocalNotificationService.scheduleReminder();
  runApp(
    DevicePreview(
      enabled: false,
      tools: const [
        ...DevicePreview.defaultTools,
      ],
      builder: (context) => const AppWidget(),
    ),
  );
}

