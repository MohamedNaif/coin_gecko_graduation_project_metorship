import 'package:dio/dio.dart';

abstract class Failures {
  final String errMessage;

  Failures({required this.errMessage});
}
class FirebaseFailure extends Failures {
  FirebaseFailure({required super.errMessage});
factory FirebaseFailure.fromFirebaseException({required String code}) {
  switch (code) {
    // Firebase Auth errors
    case 'weak-password':
      return FirebaseFailure(
        errMessage: 'The password provided is too weak.',
      );
    case 'email-already-in-use':
      return FirebaseFailure(
        errMessage: 'The account already exists for that email.',
      );
    case 'user-not-found':
      return FirebaseFailure(
        errMessage: 'No user found for that email.',
      );
    case 'wrong-password':
      return FirebaseFailure(
        errMessage: 'Wrong password provided for that user.',
      );
    case 'invalid-email':
      return FirebaseFailure(
        errMessage: 'The email address is not valid.',
      );
    case 'user-disabled':
      return FirebaseFailure(
        errMessage: 'This user account has been disabled.',
      );
    case 'too-many-requests':
      return FirebaseFailure(
        errMessage: 'Too many requests. Please try again later.',
      );
    case 'operation-not-allowed':
      return FirebaseFailure(
        errMessage: 'This operation is not allowed.',
      );
      
    case 'permission-denied':
      return FirebaseFailure(
        errMessage: 'You do not have permission to perform this action.',
      );
    case 'unavailable':
      return FirebaseFailure(
        errMessage: 'Service is currently unavailable. Please try again.',
      );
    case 'cancelled':
      return FirebaseFailure(
        errMessage: 'Operation was cancelled.',
      );
      
    case 'network-request-failed':
      return FirebaseFailure(
        errMessage: 'Network error. Please check your connection.',
      );
      case 'invalid-credential':
      return FirebaseFailure(
        errMessage: 'Incorrect email or password.',
      );
      
    default:
      return FirebaseFailure(
        errMessage: 'An error occurred. Please try again.',
      );
  }
}}
class ServerFailure extends Failures {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException({required DioException dioException}) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'Connection timeout with ApiServer');
      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'badCertificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: dioException.response!.statusCode,
          response: dioException.response!.data,
        );

      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'Request to ApiServer was canceled');
      case DioExceptionType.connectionError:
        return ServerFailure(
          errMessage: 'No internet connection, please try again!',
        );
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Unexpected error, please try later!');
    }
  }

  factory ServerFailure.fromResponse({int? statusCode, dynamic response}) {
    if (statusCode == 400 ||
        statusCode == 401 ||
        statusCode == 422 ||
        statusCode == 409 ||
        statusCode == 424 ||
        statusCode == 404) {
      return ServerFailure(
        errMessage:
            response['message'] ?? 'Unexpected error, please try later!',
      );
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Server error, please try later!');
    } else if (statusCode == 403) {
      //    Helper.expiredToken();
      throw ServerFailure(
        errMessage: 'Your session has expired, please login again!',
      );
    } else {
      return ServerFailure(
        errMessage: 'Oops there was an error, please try later!',
      );
    }
  }
}
