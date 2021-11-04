import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

import '../../main.dart';
import '../screens/model/number_task_model.dart';

class NotificationTimer {
  Future<void> initNotification() async {
    const initializationSettingsAndroid =
        AndroidInitializationSettings('assets/images/bell.png');
    const initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);
    const initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
    });
  }
}

Future<void> scheduleAlarm(NumberTask item) async {
  await flutterLocalNotificationsPlugin.zonedSchedule(
      0,
      item.title,
      DateFormat('hh:mm a').format(item.time!),
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 2)),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'your channel id', 'your channel name',
              channelDescription: 'your channel description')),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime);
}

void onDidReceiveLocalNotification(
    int id, String? title, String? body, String? payload) {}
