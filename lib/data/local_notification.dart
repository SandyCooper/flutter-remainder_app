import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_remainder_app/data/functions.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotification {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  static Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) => null,
    );
    final LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open notification');
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsDarwin,
            macOS: initializationSettingsDarwin,
            linux: initializationSettingsLinux);
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) => null,
    );
  }

  static Future<void> simpleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('your channel id', 'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin
        .show(0, title, body, notificationDetails, payload: payload);
  }

  static Future<void> scheduleNotification({
    required String title,
    required String body,
    required String payload,
  }) async {
    // calculating current time in seconds

    var currentTime = DateTime.now().hour == 0
        ? ((DateTime.now().minute * 60) + DateTime.now().second)
        : ((DateTime.now().hour * 3600) +
            (DateTime.now().minute * 60) +
            DateTime.now().second);

    // calculating manual schedule time in seconds

    var scheduledTime = isSwitched == false && int.parse(hours) == 12
        ? (int.parse(minute) * 60)
        : (((isSwitched ? int.parse(hours) + 12 : int.parse(hours)) * 3600) +
            (int.parse(minute) * 60));

    // initializing timezone

    tz.initializeTimeZones();

    await flutterLocalNotificationsPlugin.zonedSchedule(
        counti,
        title,
        body,
        tz.TZDateTime.now(tz.local)
            .add(Duration(seconds: scheduledTime - currentTime)),
        const NotificationDetails(
          android: AndroidNotificationDetails(
            'channel 2',
            'your channel name',
            channelDescription: 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker',
            // fullScreenIntent: true,
          ),
        ),
        androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload);

    
  }
  static Future<void> deleteAllNotification()  async {
      await flutterLocalNotificationsPlugin.cancelAll();
    }
}
