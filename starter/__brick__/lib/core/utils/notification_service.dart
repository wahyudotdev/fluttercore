import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:{{package_name}}/core/config/config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:{{package_name}}/core/data/model/notification/notification_data.dart';

class NotificationService {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        Config.notificationChannelId,
        Config.notificationChannelName,
        importance: Importance.max,
        enableLights: true,
      ),
      iOS: IOSNotificationDetails(),
    );
  }

  static Future<void> showNotification({
    int id = 100,
    String? title,
    String? body,
    String? payload,
  }) async =>
      await _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
        payload: payload,
      );

  static Future<NotificationData?> setup() async {
    const androidInitializationSettings =
        AndroidInitializationSettings('ic_notification');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
      onDidReceiveLocalNotification: (p0, p1, p2, p3) async {
        debugPrint('$p0 $p1 $p2 $p3');
      },
    );
    final initializationSettings = InitializationSettings(
        android: androidInitializationSettings, iOS: initializationSettingsIOS);
    _notifications.initialize(initializationSettings);
    await _notifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(const AndroidNotificationChannel(
            Config.notificationChannelId, Config.notificationChannelName));

    final notificationData =
        await _notifications.getNotificationAppLaunchDetails();
    if (notificationData?.payload != null) {
      final data =
          NotificationData.fromJson(jsonDecode(notificationData!.payload!));
      return data;
    }

    return null;
  }
}
