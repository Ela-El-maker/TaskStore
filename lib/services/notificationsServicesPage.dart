import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotifyHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin(); //

  initializeNotification() async {
// //     tz.initializeTimeZones();
// tz.setLocalLocation(tz.getLocation(timeZoneName));
    //tz.initializeTimeZones();
    // this is for latest iOS settings
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

    // Initialize the plugin
    // await flutterLocalNotificationsPlugin.initialize(
    //   initializationSettings,
    //   onSelectNotification: (String? payload) async {
    //     await selectNotification(payload);
    //   },
    // );
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
  // scheduledNotification() async {
  //    await flutterLocalNotificationsPlugin.zonedSchedule(
  //        0,
  //        'scheduled title',
  //        'theme changes 5 seconds ago',
  //        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
  //        const NotificationDetails(
  //            android: AndroidNotificationDetails('your channel id',
  //                'your channel name', '')),
  //        androidAllowWhileIdle: true,
  //        uiLocalNotificationDateInterpretation:
  //            UILocalNotificationDateInterpretation.absoluteTime);

  //  }
   
  Future selectNotification(String? payload) async {
    if (payload != null) {
      //selectedNotificationPayload = "The best";
      //selectNotificationSubject.add(payload);
      print('notification payload: $payload');
    } else {
      print("Notification Done");
    }

    if (payload == "Theme Changed") {
      //going nowhere
    } else {
      Get.to(() => Container(color: Colors.white,));
    }
  }

  // displayNotification({required String title, required String body}) async {
  //   print("doing test");
  //   var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
  //       'your channel id', 'your channel name', 'your channel description',
  //       importance: Importance.max, priority: Priority.high);
  //   var iOSPlatformChannelSpecifics =  IOSNotificationDetails();
  //   var platformChannelSpecifics = NotificationDetails(
  //       android: androidPlatformChannelSpecifics, iOS: iOSPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     'You change your theme',
  //     'You changed your theme back !',
  //     platformChannelSpecifics,
  //     payload: 'It could be anything you pass',
  //   );
  // }
//   initializeNotification() async {
//  final IOSInitializationSettings initializationSettingsIOS =
//      IOSInitializationSettings(
//          requestSoundPermission: false,
//          requestBadgePermission: false,
//          requestAlertPermission: false,
//          onDidReceiveLocalNotification: onDidReceiveLocalNotification
//      );

//     final InitializationSettings initializationSettings =
//         InitializationSettings(
//        iOS: initializationSettingsIOS,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//         initializationSettings,
//         onSelectNotification: selectNotification
//     );
//   }


// final BehaviorSubject<String> selectNotificationSubject =
//   BehaviorSubject<String>();

// selectNotificationSubject.add(payload);
// selectNotificationSubject.stream.listen(()=>);

// onSelectNotification: (String payload) async {
//           if (payload != null) {
//             debugPrint('notification payload: ' + payload);
//           }
//           selectNotificationSubject.add(payload);
// }


  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    //display a dialog with the notification details
    // display a dialog with the notification details, tap ok to go to another page
    // showDialog(
    //   //context: context,
    //   builder: (BuildContext context) => CupertinoAlertDialog(
    //     title: Text(title),
    //     content: Text(body),
    //     actions: [
    //       CupertinoDialogAction(
    //         isDefaultAction: true,
    //         child: Text('Ok'),
    //         onPressed: () async {
    //           Navigator.of(context, rootNavigator: true).pop();
    //           await Navigator.push(
    //             context,
    //             MaterialPageRoute(
    //               builder: (context) => SecondScreen(payload),
    //             ),
    //           );
    //         },
    //       )
    //     ],
    //   ),
    // );
    Get.dialog(Text("welcome to Flutter!!!"));
  }
}

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotifyHelper {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   initializeNotification() async {
//     var initializationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');

//     var initializationSettingsIOS = IOSInitializationSettings();
    
//     var initializationSettings = InitializationSettings(
//         initializationSettingsAndroid, initializationSettingsIOS);
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//   }
//   final IOSInitializationSettings initializationSettingsIOS = IOSInitializationSettings(
//     requestSoundPermissions: false,
//     requestBadgePermissions: false,
//     requestAlertPermissions: false,
//     onDidReceiveLocalNotification: onDidReceiveLocalNotification
//   );
//   IOSInitializationSettings(
      
//     );
//     final AndroidInitializationSettings initializationSettingsAndroid =  AndroidInitializationSettings("app_icon");
//     final InitializationSettings initializationSettings =InitializationSettings(
//       iOS: initializationSettingsIOS,
//       android: initializationSettingsAndroid,
    
//     );
    
// }

// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotifyHelper {
//   final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   Future<void> initializeNotification() async {
//     // Initialize settings for Android
//     var initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/ic_launcher');

//     // Initialize settings for iOS
//     var initializationSettingsIOS = IOSInitializationSettings();

//     // Create combined initialization settings
//     var initializationSettings = InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsIOS,
//     );

//     // Initialize the plugin
//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onSelectNotification: onSelectNotification,
//     );
//   }

//   Future<void> onSelectNotification(String? payload) async {
//     // Handle notification tap
//     print('Notification selected with payload: $payload');
//   }
// }
