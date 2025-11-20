// import 'dart:convert';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/foundation.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// import '../constants/app_strings.dart';
// import '../storage/cache_helper.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   debugPrint("firebaseMessagingBackgroundHandler Function");
//   NotificationService.showCustomLocalNotification(
//       notificationBody: message.data['body'],
//       payloadData: jsonEncode(message.data));
// }

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

//   // تهيئة الإعدادات
//   static Future<void> initialize() async {
//     const AndroidInitializationSettings initializationSettingsAndroid =
//         AndroidInitializationSettings('app_icon');

//     const DarwinInitializationSettings initializationSettingsDarwin =
//         DarwinInitializationSettings(
//       requestAlertPermission: false,
//       requestBadgePermission: false,
//       requestSoundPermission: false,
//     );

//     const InitializationSettings initializationSettings =
//         InitializationSettings(
//       android: initializationSettingsAndroid,
//       iOS: initializationSettingsDarwin,
//       macOS: initializationSettingsDarwin,
//     );

//     await flutterLocalNotificationsPlugin.initialize(
//       initializationSettings,
//       onDidReceiveNotificationResponse: _onNotificationTap,
//       onDidReceiveBackgroundNotificationResponse: _onNotificationTap,
//     );

//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<
//             AndroidFlutterLocalNotificationsPlugin>()
//         ?.requestNotificationsPermission();

//     await initializeFirebaseNotifications();
//   }

//   // معالجة النقر على الإشعار
//   static void _onNotificationTap(NotificationResponse response) {
//     if (response.actionId == 'accept_call') {
//       debugPrint("iam in accept_call");
//     } else if (response.payload == 'reject_call') {
//       debugPrint("iam in reject_call");
//     } else {
//       debugPrint("iam in else");
//     }
//   }

//   // عرض إشعار المكالمة الواردة
//   static Future<void> showCustomLocalNotification(
//       {String? notificationBody, String? payloadData}) async {
//     AndroidNotificationDetails androidPlatformChannelSpecifics =
//         const AndroidNotificationDetails(
//       'channel_id',
//       'Incoming Call',
//       channelDescription: 'Channel for incoming call notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       fullScreenIntent: true,
//       enableVibration: true,
//       sound: RawResourceAndroidNotificationSound('incoming_call'),
//       actions: <AndroidNotificationAction>[
//         AndroidNotificationAction(
//           'accept_call',
//           'Accept',
//           showsUserInterface: true,
//           contextual: true,
//           icon: DrawableResourceAndroidBitmap('accept_call'),
//         ),
//         AndroidNotificationAction(
//           'reject_call',
//           'Decline',
//           showsUserInterface: true,
//           contextual: true,
//           icon: DrawableResourceAndroidBitmap('reject_call'),
//         ),
//       ],
//     );

//     NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: const DarwinNotificationDetails());
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Incoming Call',
//       notificationBody ?? 'Incoming Call Body',
//       platformChannelSpecifics,
//       payload: payloadData,
//     );
//   }

//   static Future<void> initializeFirebaseNotifications() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;

//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     if (settings.authorizationStatus == AuthorizationStatus.authorized) {
//       if (kDebugMode) {
//         debugPrint('user granted permission');
//       }
//     } else if (settings.authorizationStatus ==
//         AuthorizationStatus.provisional) {
//       if (kDebugMode) {
//         debugPrint('user granted provisional permission');
//       }
//     } else {
//       if (kDebugMode) {
//         debugPrint('user denied permission');
//       }
//     }

//     // Listen for foreground messages
//     FirebaseMessaging.onMessage.listen((RemoteMessage event) {
//       debugPrint("onMessage Function");
//       if (kDebugMode) {
//         debugPrint("onMessage : ${event.data}");
//       }

//       showCustomLocalNotification(
//           notificationBody: event.data['body'],
//           payloadData: jsonEncode(event.data));
//     });

//     // Handle background and terminated state
//     FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

//     FirebaseMessaging.onMessageOpenedApp.listen((event) {
//       debugPrint("onMessageOpenedApp event : $event");
//     });
//     // Check if the app was opened by tapping on a notification
//     FirebaseMessaging.instance
//         .getInitialMessage()
//         .then((RemoteMessage? message) {
//       debugPrint("getInitialMessage message : ${message?.data}");

//       if (message != null) {}
//     });
//   }
// }

// class FirebaseUnsubscribeTopic {
//   static Future unsubscribeFromTopics() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     debugPrint("Firebase unsubscribe Topic");
//     String? userId =
//         AppSharedPreferences.sharedPreferences.getString(AppStrings.userId);

//     await messaging.unsubscribeFromTopic('$userId');
//   }
// }

// class FirebaseSubscribeTopic {
//   static Future subscribeToTopics() async {
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     debugPrint("Firebase subscribe Topic");
//     String? userId =
//         AppSharedPreferences.sharedPreferences.getString(AppStrings.userId);

//     await messaging.subscribeToTopic('$userId');
//   }
// }
