import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@singleton
class BiometricCubit extends Cubit<BiometricState> {
  final AuthRepo _authRepo;
  BiometricCubit(
    this._authRepo,
  ) : super(const BiometricState.initial());

  bool biometricEnabled = false;
  List<BiometricType> availableBiometrics = [];

  Future<void> checkSupport() async {
    emit(const BiometricState.loading());

    final supportResult = await _authRepo.checkBiometricSupport();
    await supportResult.fold(
      (failure) async {
        emit(BiometricState.failure(failure.errMessage));
      },
      (isSupported) async {
        if (!isSupported) {
          emit(const BiometricState.unsupported());
          return;
        }

        final biometricsResult = await _authRepo.getAvailableBiometrics();
        biometricsResult.fold(
          (failure) {
            emit(BiometricState.failure(failure.errMessage));
            log('Failed to get available biometrics: ${failure.errMessage}');
          },
          (biometrics) {
            availableBiometrics = biometrics;
            emit(
              BiometricState.success(
                availableBiometrics: biometrics,
                isEnabled: biometricEnabled,
              ),
            );
          },
        );
      },
    );
  }

  Future<void> authenticate({
    required BiometricType type,
    String reason = 'Authenticate to continue',
  }) async {
    emit(const BiometricState.loading());

    final authResult = await _authRepo.authenticateBiometric(reason);
    authResult.fold(
      (failure) {
        final isCancellation =
            failure.errMessage.toLowerCase().contains('cancel');

        if (isCancellation) {
          emit(const BiometricState.cancelled());

          emit(BiometricState.success(
            availableBiometrics: availableBiometrics,
            isEnabled: biometricEnabled,
            authenticated: false,
          ));
        } else {
          emit(BiometricState.failure(
            failure.errMessage,
            isCancellation: false,
          ));
          log('Authentication failed: ${failure.errMessage}');
        }
      },
      (authenticated) {
        emit(BiometricState.success(
          availableBiometrics: availableBiometrics,
          isEnabled: biometricEnabled,
          authenticated: authenticated,
        ));
      },
    );
  }

  Future<void> enableBiometric() async {
    emit(const BiometricState.loading());
    biometricEnabled = true;
    emit(
      BiometricState.success(
        availableBiometrics: availableBiometrics,
        isEnabled: true,
        message: 'Biometric enabled',
      ),
    );
  }

  Future<void> disableBiometric() async {
    emit(const BiometricState.loading());
    biometricEnabled = false;
    emit(
      BiometricState.success(
        availableBiometrics: availableBiometrics,
        isEnabled: false,
        message: 'Biometric disabled',
      ),
    );
  }
}
