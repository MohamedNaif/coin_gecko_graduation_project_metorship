import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';

part 'biometric_state.freezed.dart';

@freezed
class BiometricState with _$BiometricState {
  const factory BiometricState.initial() = _BiometricInitial;
  const factory BiometricState.loading() = _BiometricLoading;
  const factory BiometricState.unsupported() = _BiometricUnsupported;
  const factory BiometricState.success({
    @Default([]) List<BiometricType> availableBiometrics,
    @Default(false) bool isEnabled,
    bool? authenticated,
    String? message,
  }) = _BiometricSuccess;
  const factory BiometricState.cancelled() = _BiometricCancelled;
  const factory BiometricState.failure(
    String errorMessage, {
    @Default(false) bool isCancellation,
  }) = _BiometricFailure;
}