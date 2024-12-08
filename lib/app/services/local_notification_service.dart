import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tzdata;
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {


  static var onSelectNotification = false;
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidInitializationSettings initializationSettingsAndroid =
  const AndroidInitializationSettings("@mipmap/ic_launcher");

  final DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
    onDidReceiveLocalNotification: (int id, String? title, String? body, String? payload) async {

    },

  );



   Future<void> initialize() async {
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );
    _notificationsPlugin.initialize(
      initializationSettings,
    );
  }

 static Future<bool> requestPermissions() async {
    bool returnB = false;
    if (Platform.isIOS || Platform.isMacOS) {
      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      await _notificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
      returnB = true;
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          _notificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? grantedNotificationPermission =
          await androidImplementation?.requestNotificationsPermission();
      if (grantedNotificationPermission!) {
        returnB = true;
      } else {
        returnB = false;
      }
    }
    return returnB;
  }
  static Future<void> scheduleReminder(int indexVStartTime,int indexVEndTime,int frec) async {

    DateTime now = DateTime.now();
    int currentHour = now.hour;

    if (currentHour >= indexVStartTime &&
        currentHour < indexVEndTime + 12) {
      tzdata.initializeTimeZones();
      const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'your_channel_id', // Change this to your channel ID
        'owomen',// Replace with your channel name

        importance: Importance.max,
        priority: Priority.high,
      );

      const NotificationDetails platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);
      final notificationTime = tz.TZDateTime.now(tz.local).add( Duration(minutes: frec));

      await _notificationsPlugin.zonedSchedule(
        0, // Notification ID
        'Reminder Title',
        'Reminder Body',
        notificationTime, // 1 minute from now
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
      );
    }


  }



  static Future<void> showNotification() async {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        'your_channel_id', // Change this to your channel ID
        'owomen', // Change this to your channel name
        channelDescription: 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        icon: "@mipmap/ic_launcher"
    );
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification Title',
      'Notification Body',
      platformChannelSpecifics,
      payload: 'Notification Payload',

    );
  }
}

