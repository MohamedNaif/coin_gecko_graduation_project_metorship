// ignore_for_file: public_member_api_docs, sort_constructors_first
 
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
      'uesrId': _userId,
      'firstname': _firstName,
      'lastname': _lastName,
      'email': _email,
      'phoneNumber': _phoneNumber,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uesrId: map['uesrId'] != null ? map['uesrId'] as String : null,
      firstName: map['firstName'] != null ? map['firstName'] as String : null,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phoneNumber:
          map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
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
