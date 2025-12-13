// ignore: depend_on_referenced_packages
import 'package:equatable/equatable.dart';

// class NoParams extends Equatable {
//   @override
//   List<Object?> get props => [];
// }

class Params extends Equatable {
  @override
  List<Object?> get props => [];
}

//! Start Auth Params
class CheckOtpParam {
  final String phone;
  final String code;
  const CheckOtpParam({required this.phone, required this.code});
}

class SignUpParams {
  final String? phone;
  final String? password;
  final String? fullName;
  final String? otp;

  const SignUpParams({
    required this.phone,
    required this.password,
    this.fullName,
    required this.otp,
  });
}

class SendVerificationOtpPhoneParam {
  final String phone;

  const SendVerificationOtpPhoneParam({required this.phone});
}
//! End Auth Params

class LoginParams {
  final String phone;
  final String password;

  const LoginParams({required this.phone, required this.password});
}

class RegisterParams extends Equatable {
  final String phone;

  const RegisterParams({required this.phone});

  @override
  List<Object?> get props => [phone];
}

class VerifyParams extends Equatable {
  final String phone;
  final String code;

  const VerifyParams({required this.phone, required this.code});

  @override
  List<Object?> get props => [phone, code];
}

class NewAccountParams extends Equatable {
  final String phone;
  final String code;
  final String name;
  final String password;

  const NewAccountParams({
    required this.phone,
    required this.code,
    required this.name,
    required this.password,
  });

  @override
  List<Object?> get props => [phone, code, name, password];
}

class PaginationParms {
  final int? limit;
  final int? page;

  const PaginationParms({this.limit, this.page});
}
