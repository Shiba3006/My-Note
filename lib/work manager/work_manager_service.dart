import 'dart:developer';

import 'package:my_note/notification_service/local_notfication_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  Future<void> _registerTask() async {
    await Workmanager().registerPeriodicTask(
      '1',
      'simplePeriodicTask',
      frequency: const Duration(minutes: 15),
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(
        _actionTask, // The top level function, aka callbackDispatcher
        isInDebugMode:
            true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
        );
    await _registerTask();
  }

  Future<void> cancelTask(String uniqueName) async {
    
    await Workmanager().cancelByUniqueName(uniqueName);
  }

  
}

@pragma('vm:entry-point')
void _actionTask() {
  Workmanager().executeTask((taskName, inputData) async {
    log('Task $taskName is running! inputData: $inputData');
    await LocalNotificationService.showDailyNotification(
      'Daily Notification',
      'This is an Daily notification',
    );
    return Future.value(true);
  });
}
