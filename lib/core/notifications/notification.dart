// import 'dart:developer';
// import 'dart:math' as math;

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// // import 'package:rxdart/subjects.dart';

// @pragma('vm:entry-point')
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();

//   if (kDebugMode) {
//     log('title Background => ${message.notification!.title}');
//     log('body Background => ${message.notification!.body}');
//   }
// }

// class NotificationHandler {
//   NotificationHandler._();

//   static final _notification = FlutterLocalNotificationsPlugin();
//   static FirebaseMessaging messaging = FirebaseMessaging.instance;

//   // static final BehaviorSubject<String?> onNotificationClick = BehaviorSubject();

//   static Future<void> notificationPermission() async {
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );
//     log('User granted permission: ${settings.authorizationStatus}');
//   }

//   static void init() async {
//     final NotificationAppLaunchDetails? notificationAppLaunchDetails = await _notification.getNotificationAppLaunchDetails();

//     final didNotificationLaunchApp = notificationAppLaunchDetails?.didNotificationLaunchApp ?? false;

//     if (didNotificationLaunchApp) {
//       var payload = notificationAppLaunchDetails!.notificationResponse!;
//       onSelectedBack(payload);
//     } else {
//       await _notification.initialize(
//         const InitializationSettings(
//           android: AndroidInitializationSettings('@mipmap/ic_launcher'),
//           iOS: DarwinInitializationSettings(),
//         ),
//         onDidReceiveNotificationResponse: onDidReceive,
//         onDidReceiveBackgroundNotificationResponse: onSelectedBack,
//       );
//     }

//     await notificationPermission();

//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//   }

//   @pragma('vm:entry-point')
//   static void onSelectedBack(NotificationResponse details) {
//     if (details.payload != null && details.payload!.isNotEmpty) {
//     //  onNotificationClick.add(details.payload);
//     }
//   }

//   @pragma('vm:entry-point')
//   static void onDidReceive(NotificationResponse details) {
//     if (details.payload != null && details.payload!.isNotEmpty) {
//      // onNotificationClick.add(details.payload);
//     }
//   }

//   static void onMessageOpenAppListener() {
//     FirebaseMessaging.onMessageOpenedApp.listen(
//       (RemoteMessage message) {
//         /* AppRouter.router.pushNamed(
//           Routes.notificationScreen,
//         );*/
//       },
//     );
//   }

//   static void getInitialMessage() {
//     messaging.getInitialMessage().then(
//       (RemoteMessage? message) {
//         if (message != null) {
//           /*AppRouter.router.pushNamed(
//             Routes.notificationScreen,
//           );*/
//         }
//       },
//     );
//   }

//   static pushNotification(
//     RemoteMessage message,
//   ) async {
//     AndroidNotificationChannel channel = AndroidNotificationChannel(
//       math.Random.secure().nextInt(10000).toString(),
//       'High Importance Channel',
//       importance: Importance.max,
//     );

//     var androidPlatformChannelSpecifics = AndroidNotificationDetails(
//       channel.id.toString(),
//       channel.name.toString(),
//       channelDescription: 'channel description',
//       importance: Importance.high,
//       priority: Priority.high,
//       ticker: 'ticker',
//     );
//     DarwinNotificationDetails iOSPlatformChannelSpecifics = const DarwinNotificationDetails();
//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//     );
//     await _notification.show(
//       11,
//       message.notification!.title,
//       message.notification!.body,
//       platformChannelSpecifics,
//     );
//   }

//   static void listenNotification() {
//     FirebaseMessaging.onMessage.listen(
//       (RemoteMessage message) async {
//         await pushNotification(message);
//         log('Got a message whilst in the foreground!');
//         log('Message data: ${message.data}');

//         if (message.notification != null) {
//           log('Message also contained a notification: ${message.notification}');
//         }

//       },
//     );
//   }
// }
