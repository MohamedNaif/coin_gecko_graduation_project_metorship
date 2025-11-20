// import 'package:flutter_webrtc/flutter_webrtc.dart';
//
// import 'socket_service.dart';
//
// class WebRTCService {
//   final SocketService socketService;
//   RTCPeerConnection? peerConnection;
//   RTCVideoRenderer localRenderer;
//   RTCVideoRenderer remoteRenderer;
//
//   WebRTCService(this.socketService, this.localRenderer, this.remoteRenderer);
//
//   // Initialize WebRTC peer connection and add event handlers
//   Future<void> initializePeerConnection() async {
//     // ICE server configuration
//     final configuration = {
//       'iceServers': [
//         {
//           'urls': [
//             'stun:stun1.l.google.com:19302',
//             'stun:stun2.l.google.com:19302'
//           ]
//         }
//       ]
//     };
//
//     // Create a peer connection
//     peerConnection = await createPeerConnection(configuration);
//
//     // Handle local ICE candidates
//     peerConnection?.onIceCandidate = (candidate) {
//       socketService.socket.emit("ice-candidate", {
//         "candidate": candidate.toMap(),
//       });
//     };
//
//     // Handle remote track (video/audio stream from the other user)
//     peerConnection?.onTrack = (RTCTrackEvent event) {
//       if (event.track.kind == 'video') {
//         remoteRenderer.srcObject = event.streams[0];
//       }
//     };
//
//     // Get the local media stream (audio and video)
//     MediaStream localStream = await _getUserMedia();
//     localStream.getTracks().forEach((track) {
//       peerConnection?.addTrack(track, localStream);
//     });
//
//     // Set the local renderer to display the local stream
//     localRenderer.srcObject = localStream;
//   }
//
//   // Method to get user media (local audio/video stream)
//   Future<MediaStream> _getUserMedia() async {
//     final mediaConstraints = {
//       'audio': true,
//       'video': {
//         'facingMode': 'user',
//       },
//     };
//
//     return await navigator.mediaDevices.getUserMedia(mediaConstraints);
//   }
//
//   // Start a call by creating an offer and sending it to the receiver
//   Future<void> startCall(
//       String callerId, String receiverId, String callType) async {
//     await initializePeerConnection();
//
//     // Create an offer
//     RTCSessionDescription offer = await peerConnection!.createOffer();
//     await peerConnection!.setLocalDescription(offer);
//
//     // Emit the offer to the server
//     socketService.socket.emit("start-call", {
//       "callerId": callerId,
//       "receiverId": receiverId,
//       "callType": callType,
//     });
//
//     // Send the offer to the receiver
//     socketService.socket.emit("make-offer", {
//       "callId": "$callerId-$receiverId",
//       "offer": offer.toMap(),
//     });
//
//     // Handle incoming answer from the server
//     socketService.socket.on("answer", (data) async {
//       await _handleAnswer(data["answer"]);
//     });
//
//     // Handle ICE candidate from the server
//     socketService.socket.on("iceCandidate", (data) {
//       peerConnection?.addCandidate(
//         RTCIceCandidate(
//             data["candidate"], data["sdpMid"], data["sdpMLineIndex"]),
//       );
//     });
//   }
//
//   // Create an answer to an incoming offer
//   Future<void> createAnswer(String remoteOffer) async {
//     await initializePeerConnection();
//
//     // Set the remote offer description
//     await peerConnection!
//         .setRemoteDescription(RTCSessionDescription(remoteOffer, "offer"));
//
//     // Create an answer and set the local description
//     RTCSessionDescription answer = await peerConnection!.createAnswer();
//     await peerConnection!.setLocalDescription(answer);
//
//     // Emit the answer to the server
//     socketService.socket.emit("make-answer", {
//       "callId": socketService.socket.id, // unique ID for the call
//       "answer": answer.toMap(),
//     });
//   }
//
//   // Handle the answer received from the remote peer
//   Future<void> _handleAnswer(String remoteAnswer) async {
//     await peerConnection!
//         .setRemoteDescription(RTCSessionDescription(remoteAnswer, "answer"));
//   }
//
//   // End the call and close the peer connection
//   Future<void> endCall(String callerId, String receiverId) async {
//     // Emit end call event to the server
//     socketService.socket
//         .emit("end-call", {"callerId": callerId, "receiverId": receiverId});
//
//     // Close the peer connection and clean up
//     await peerConnection?.close();
//     peerConnection = null;
//
//     // Clear the renderers
//     localRenderer.srcObject = null;
//     remoteRenderer.srcObject = null;
//   }
// }
