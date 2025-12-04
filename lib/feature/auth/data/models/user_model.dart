// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:coin_gecko_graduation_project_metorship/core/constants/firebase_constant.dart';

class UserModel {
  final String? _userId;
  final String? _firstName;
  final String? _lastName;
  final String? _email;
  final String? _phoneNumber;

  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get uesrId => _userId;
  String? get name => _firstName;
  String? get email => _email;
  String? get phoneNumber => _phoneNumber;

  UserModel(
      {required String? uesrId,
      required String? firstName,
      required String? lastName,
      required String? email,
      required String? phoneNumber})
      : _userId = uesrId,
        _firstName = firstName,
        _lastName = lastName,
        _email = email,
        _phoneNumber = phoneNumber;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      FirebaseConstants.uesrId: _userId,
      FirebaseConstants.firstName: _firstName,
      FirebaseConstants.lastName: _lastName,
      FirebaseConstants.email: _email,
      FirebaseConstants.phoneNumber: _phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uesrId: map[FirebaseConstants.uesrId] != null
          ? map[FirebaseConstants.uesrId] as String
          : null,
      firstName: map[FirebaseConstants.firstName] != null
          ? map[FirebaseConstants.firstName] as String
          : null,
      lastName: map[FirebaseConstants.lastName] != null
          ? map[FirebaseConstants.lastName] as String
          : null,
      email: map[FirebaseConstants.email] != null
          ? map[FirebaseConstants.email] as String
          : null,
      phoneNumber: map[FirebaseConstants.phoneNumber] != null
          ? map[FirebaseConstants.phoneNumber] as String
          : null,
    );
  }

  UserModel copyWith({
    String? userId,
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
  }) {
    return UserModel(
      uesrId: userId ?? _userId,
      firstName: firstName ?? _firstName,
      lastName: lastName ?? _lastName,
      email: email ?? _email,
      phoneNumber: phoneNumber ?? _phoneNumber,
    );
  }
}
