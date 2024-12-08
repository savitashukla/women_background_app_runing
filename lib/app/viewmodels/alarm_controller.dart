
import 'package:alarm/alarm.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:o_woman/app/app.dart';

import '../views/home/your_onring_callback.dart';

class YourAlarmController extends GetxController
{

  final alarmSettings = AlarmSettings(
    id: 42,
    dateTime: DateTime.now(),
    loopAudio: true,
    vibrate: true,
    volume: 0.8,
    fadeDuration: 3.0,
    notificationTitle: 'This is the title',
    notificationBody: 'This is the body',
    enableNotificationOnKill: true, assetAudioPath: "assets/music/long_blank.mp3",
  );

  @override
  void onInit() {
    // TODO: implement o
    Alarm.ringStream.stream.listen((_) {
      // This function is called whenever an event occurs on the ringStream stream
      // In this case, when the alarm rings.

      Navigator.push(
          navigatorKey.currentState!.context,
        MaterialPageRoute(builder: (context) => const YourOnRingCallBack()),
      );
    });

  }

 Future<void> setAlarmHere()
  async {
    await Alarm.set(alarmSettings: alarmSettings);


  }


}
