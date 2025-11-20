// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class NotificationService {
//   static final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();

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
//   }

//   static void _onNotificationTap(NotificationResponse response) {
//     if (response.payload == 'accept_call') {
//     } else if (response.payload == 'reject_call') {}
//   }

//   static Future<void> showIncomingCallNotification(
//       {String? notificationBody}) async {
//     const AndroidNotificationDetails androidPlatformChannelSpecifics =
//         AndroidNotificationDetails(
//       'channel_id',
//       'Incoming Call',
//       channelDescription: 'Channel for incoming call notifications',
//       importance: Importance.max,
//       priority: Priority.high,
//       playSound: true,
//       fullScreenIntent: true,
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

//     const NotificationDetails platformChannelSpecifics = NotificationDetails(
//         android: androidPlatformChannelSpecifics,
//         iOS: DarwinNotificationDetails());
//     await flutterLocalNotificationsPlugin.show(
//       0,
//       'Incoming Call',
//       notificationBody ?? 'Incoming Call Body',
//       platformChannelSpecifics,
//       payload: 'incoming_call',
//     );
//   }
// }
