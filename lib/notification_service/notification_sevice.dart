import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import '../views/notes_view.dart';

class NotificationServices {
  static Future<void> initializeNotification() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Colors.blue,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
        ),
        NotificationChannel(
          channelKey: 'schedule_channel',
          channelName: 'Schedule notifications',
          channelDescription: 'Notification channel for schedule notifications',
          defaultColor: Colors.red,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
          locked: true,
        ),
        NotificationChannel(
          channelKey: 'repeating_channel',
          channelName: 'Repeating notifications',
          channelDescription:
              'Notification channel for Repeating notifications',
          defaultColor: Colors.amber,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          onlyAlertOnce: true,
          playSound: true,
          criticalAlerts: true,
          locked: true,
        ),
      ],
      debug: true,
    );

    await AwesomeNotifications()
        .isNotificationAllowed()
        .then((isAllowed) async {
      if (!isAllowed) {
        await AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: onActionReceivedMethod,
      onNotificationCreatedMethod: onNotificationCreatedMethod,
      onNotificationDisplayedMethod: onNotificationDisplayedMethod,
      onDismissActionReceivedMethod: onDismissActionReceivedMethod,
    );
  }

  // this method to detect when a new notification is created
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationCreatedMethod');
  }

  // this method to detect every time that a new notification is displayed
  static Future<void> onNotificationDisplayedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onNotificationDisplayedMethod');
  }

  // this method to detect if the user dismissed a notification
  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint('onDismissActionReceivedMethod');
  }

  // this method to detect when the user taps on a notification or action
  static Future<void> onActionReceivedMethod(
      ReceivedNotification receivedNotification) async {
    debugPrint('onActionReceivedMethod');
    final payload = receivedNotification.payload ?? {};
    if (payload['navigate'] == 'true') {
      NotesView.navigatorKey.currentState?.push(
        MaterialPageRoute(builder: (_) => const NotesView()),
      );
    }
  }

  static Future<void> createScheduleNotification(
    // for schedule reminder
    DateTime dateTime,
    TimeOfDay timeOfDay,
    String title,
    String body,
  ) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'schedule_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationCalendar(
        year: dateTime.year,
        month: dateTime.month,
        day: dateTime.day,
        hour: timeOfDay.hour,
        minute: timeOfDay.minute,
        second: 0,
        millisecond: 0,
        repeats: true,
        allowWhileIdle: true,
        preciseAlarm: true,
        timeZone: AwesomeNotifications.localTimeZoneIdentifier,
      ),
    );
  }

  static Future<void> createRepeatingNotification(
    // for repeating reminder
    String title,
    String body,
    int interval,
  ) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: createUniqueId(),
        channelKey: 'repeating_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'MARK_DONE',
          label: 'Mark Done',
        ),
      ],
      schedule: NotificationInterval(
        interval: interval,
        repeats: true,
        allowWhileIdle: true,
        preciseAlarm: true,
        timeZone: AwesomeNotifications.localTimeZoneIdentifier,
      ),
    );
  }
}

int createUniqueId() {
  // for Notification UniqueId
  return DateTime.now().millisecondsSinceEpoch.remainder(10000);
}
