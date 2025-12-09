
part of 'biometric_cubit.dart';

sealed class BiometricState {}

class BiometricInitial extends BiometricState {}

class BiometricLoading extends BiometricState {}

class BiometricUnsupported extends BiometricState {}

class BiometricSuccess extends BiometricState {
  final List<BiometricType> availableBiometrics;
  final bool isEnabled;
  final bool? authenticated;
  final String? message;

  BiometricSuccess({
    this.availableBiometrics = const [],
    this.isEnabled = false,
    this.authenticated,
    this.message,
  });
}

class BiometricFailure extends BiometricState {
  final String errorMessage;
  BiometricFailure(this.errorMessage);
}