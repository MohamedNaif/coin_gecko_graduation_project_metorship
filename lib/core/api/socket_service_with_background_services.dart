// import 'package:socket_io_client/socket_io_client.dart' as IO;
//
// import '../constants/app_strings.dart';
// import '../storage/cache_helper.dart';
// import 'end_points.dart';
//
// class SocketService {
//   static final SocketService _instance = SocketService._internal();
//   late IO.Socket socket;
//
//   factory SocketService() {
//     return _instance;
//   }
//
//   SocketService._internal() {
//     initializeSocket();
//   }
//
//   void initializeSocket() {
//     // Configure the socket with the server URL
//     socket = IO.io(EndPoints.baseUrl, <String, dynamic>{
//       'transports': ['websocket'],
//       'autoConnect': true,
//     });
//
//     // Connect to the server
//     socket.connect();
//
//     // Handle connection events
//     socket.on('connect', (_) {
//       print('Connected to the server');
//       socket.emit('join', {
//         'userId':
//             AppSharedPreferences.sharedPreferences.getString(AppStrings.userId)
//       });
//     });
//
//     socket.on('disconnect', (_) {
//       print('Disconnected from the server');
//     });
//
//     socket.on('error', (data) {
//       print('Socket error: $data');
//     });
//   }
//
//   // Function to send data
//   void emitMessage(String event, dynamic data) {
//     socket.emit(event, data);
//   }
//
//   // Function to listen for events
//   void onMessage(String event, Function(dynamic) callback) {
//     socket.on(event, callback);
//   }
// }
