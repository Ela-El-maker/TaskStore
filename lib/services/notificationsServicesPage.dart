import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:taskstore/models/taskModel.dart';
import 'package:taskstore/ui/notifiedPage.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
    _configureLocalTimezone();
    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
            requestSoundPermission: false,
            requestBadgePermission: false,
            requestAlertPermission: false,
            onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings("icon");

    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );

    // Pass onDidReceiveNotificationResponse function to initialize method
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

//   Future<void> displayNotification(
//   {required String title, required Task task}) async {
//   print("Doing test");
//   var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//     'channel id',
//     'channelName',
//     importance: Importance.max,
//     priority: Priority.high,
//     enableLights: true,
//     color: Colors.red,
//     ledColor: Colors.red,
//     ledOnMs: 1000,
//     ledOffMs: 500,
//   );
//   var iOSPlatformChannelSpecifics = IOSNotificationDetails(); 
//   var platformChannelSpecifics = NotificationDetails(
//     android: androidPlatformChannelSpecifics,
//     iOS: iOSPlatformChannelSpecifics,
//   );

//   await flutterLocalNotificationsPlugin.show(
//     0,
//     title,
//     task.note, // Use task.note instead of body
//     platformChannelSpecifics,
//     payload: title,
//   );
// }


// Define the onDidReceiveNotificationResponse function
  Future<void> onDidReceiveNotificationResponse(
      NotificationResponse response) async {
    // Your implementation here
  }

  scheduledNotification(int hour, int minutes, Task task) async {
    // _configureLocalTimezone();

    await flutterLocalNotificationsPlugin.zonedSchedule(
      task.id!.toInt(),
      task.title,
      task.note,
      _convertTime(hour, minutes),
      //tz.TZDateTime.now(tz.local).add(Duration(seconds: newTime)),
      NotificationDetails(
        android: AndroidNotificationDetails(
          'Scheduled Title',
          'Scheduled Description',
          //'Scheduled Channel',
        ),
        // iOS: IOSNotificationDetails(
        //   presentAlert: true,
        //   presentBadge: true,
        //   presentSound: true,
        // ),
      ),
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
      payload: "${task.title}|" + "${task.note}|",
    );
  }

  Future<void> _configureLocalTimezone() async {
    tz.initializeTimeZones();
    final String timeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(timeZone));
  }

  void requestIOSPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  Future selectNotification(String? payload) async {
    if (payload != null) {
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }

    if (payload == "Theme Changed") {
      //going nowhere
      print("Nothing to navigate here!!!");
    } else {
      Get.to(() => NotifiedPage(label: payload));
    }
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    Get.dialog(Text("welcome to Flutter!!!"));
  }
}

tz.TZDateTime _convertTime(int hour, int minutes) {
  final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
  tz.TZDateTime scheduleDate =
      tz.TZDateTime(tz.local, now.month, now.day, hour, minutes);
  if (scheduleDate.isBefore(now)) {
    scheduleDate = scheduleDate.add(Duration(days: 1));
  }
  return scheduleDate;
}

AndroidNotificationChannel channel_call = const AndroidNotificationChannel(
    'com.dbestech.chatty_chat.call', // id
    'chatty_call', // title
    importance: Importance.max,
    enableLights: true,
    playSound: true,
    sound: RawResourceAndroidNotificationSound('alert'),
    enableVibration: true);
AndroidNotificationChannel channel_message = const AndroidNotificationChannel(
  'com.dbestech.chatty_chat.message', // id
  'chatty_message', // title
  importance: Importance.defaultImportance,
  enableLights: true,
  playSound: true,
  // sound: RawResourceAndroidNotificationSound('alert'),
);
