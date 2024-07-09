import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static final AndroidNotificationSound _sound =
      RawResourceAndroidNotificationSound('sound.wav'.split('.').first);

  static StreamController<NotificationResponse>
      notificationResponseStreamController = StreamController();

  static Future<void> onDidReceiveNotification(
      NotificationResponse notificationResponse) async {
    notificationResponseStreamController.add(notificationResponse);
  }

  static Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const DarwinInitializationSettings iOSInitializationSettings =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitializationSettings,
      iOS: iOSInitializationSettings,
    );
    await _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotification,
      onDidReceiveBackgroundNotificationResponse: onDidReceiveNotification,
    );

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
    // _initTimeZone();
  }

  static void _initTimeZone() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation('Africa/Cairo'));
  }

  static NotificationDetails _setNotificationDetails(
    String channelId,
    String channelName,
  ) {
    return NotificationDetails(
        android: AndroidNotificationDetails(
          channelId,
          channelName,
          importance: Importance.max,
          priority: Priority.high,
          sound: _sound,
        ),
        iOS: const DarwinNotificationDetails());
  }

  static Future<void> showInstantNotification(
    String title,
    String body,
  ) async {
    NotificationDetails instantNotificationDetails = _setNotificationDetails(
      'instant_notification_channel_id',
      'Instant Notification',
    );

    await _flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      instantNotificationDetails,
      payload: 'instant_notification',
    );
  }

  static Future<void> showScheduleNotification({
    required String title,
    required String body,
    required DateTime dateTime,
    required TimeOfDay timeOfDay,
  }) async {
    NotificationDetails scheduleNotificationDetails = _setNotificationDetails(
      'schedule_notification_channel_id',
      'Schedule Notification',
    );
    _initTimeZone();
    // var currentTime = tz.TZDateTime.now(tz.local);
    var scheduleTime = tz.TZDateTime(
      tz.local,
      dateTime.year,
      dateTime.month,
      dateTime.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );

    await _flutterLocalNotificationsPlugin.zonedSchedule(
      1,
      title,
      body,
      // tz.TZDateTime.from(scheduledTime, tz.local),
      scheduleTime,
      scheduleNotificationDetails,
      payload: 'schedule_notification',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  static Future<void> showRepeatNotification(
    String title,
    String body,
  ) async {
    NotificationDetails repeatNotificationDetails = _setNotificationDetails(
      'repeating_notification_channel_id',
      'Repeating Notification',
    );

    await _flutterLocalNotificationsPlugin.periodicallyShow(
      2,
      title,
      body,
      RepeatInterval.everyMinute,
      repeatNotificationDetails,
      payload: 'repeating_notification',
    );
  }

  static Future<void> showDailyNotification(
    String title,
    String body,
  ) async {
    NotificationDetails scheduleNotificationDetails = _setNotificationDetails(
      'daily_notification_channel_id',
      'Daily Notification',
    );
    _initTimeZone();
    var currentTime = tz.TZDateTime.now(tz.local);
    var scheduleTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      currentTime.hour,
      40,
    );

    log('currentTime: $currentTime');
    log('scheduleTime: $scheduleTime');
    if (scheduleTime.isBefore(currentTime)) {
      scheduleTime = scheduleTime.add(const Duration(minutes: 20));
    }
    await _flutterLocalNotificationsPlugin.zonedSchedule(
      3,
      title,
      body,
      scheduleTime,
      scheduleNotificationDetails,
      payload: 'daily_notification',
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      matchDateTimeComponents: DateTimeComponents.dateAndTime,
    );
  }

  static Future<void> cancelNotification(int id) async {
    await _flutterLocalNotificationsPlugin.cancel(id);
  }

  static Future<void> cancelAllNotifications() async {
    await _flutterLocalNotificationsPlugin.cancelAll();
  }

  static int createUniqueId() {
    // for Notification UniqueId
    log('UniqueId: ${DateTime.now().millisecondsSinceEpoch.remainder(10000)}');
    return DateTime.now().millisecondsSinceEpoch.remainder(10000);
  }
}
