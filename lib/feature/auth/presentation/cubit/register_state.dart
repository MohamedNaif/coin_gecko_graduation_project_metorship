
import 'package:flutter/material.dart' show immutable;

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}
final class RegisterLoading extends RegisterState {}
final class RegisterSuccess extends RegisterState {}
final class RegisterFailure extends RegisterState {
  final String errorMessage;  
  RegisterFailure({required this.errorMessage});
}
