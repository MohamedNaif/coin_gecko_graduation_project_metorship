// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import 'package:coin_gecko_graduation_project_metorship/core/storage/secure_storage_services.dart';

part 'biometric_state.dart';
@singleton
class BiometricCubit extends Cubit<BiometricState> {
  final AuthRepo _authRepo;
  final SecureStorageServices _secureStorageServices;

  BiometricCubit(
    this._authRepo,
    this._secureStorageServices,
  ) : super(BiometricInitial());

  bool biometricEnabled = false;
  List<BiometricType> availableBiometrics = [];

  Future<void> checkSupport() async {
    emit(BiometricLoading());
    biometricEnabled = await _secureStorageServices.isBiometricEnabled();

    final supportResult = await _authRepo.checkBiometricSupport();
    await supportResult.fold(
      (failure) async {
        emit(BiometricFailure(failure.errMessage));
      },
      (isSupported) async {
        if (!isSupported) {
          emit(BiometricUnsupported());
          return;
        }

        final biometricsResult = await _authRepo.getAvailableBiometrics();
        biometricsResult.fold(
          (failure) => emit(BiometricFailure(failure.errMessage)),
          (biometrics) {
            availableBiometrics = biometrics;
            emit(
              BiometricSuccess(
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
    emit(BiometricLoading());

    final authResult = await _authRepo.authenticateBiometric(reason);
    authResult.fold(
      (failure) { emit(BiometricFailure(failure.errMessage));
      log('Authentication failed: ${failure.errMessage}');
      },
      (authenticated) {
        if (authenticated) {
          emit(
            BiometricSuccess(
              availableBiometrics: availableBiometrics,
              isEnabled: biometricEnabled,
              authenticated: true,
            ),
          );
        } else {
          emit(
            BiometricFailure(
              'Authentication was cancelled or failed',
            ),
          );
        }
      },
    );
  }

  Future<void> enableBiometric() async {
    emit(BiometricLoading());
    await _secureStorageServices.saveBiometricEnabled(true);
    biometricEnabled = true;
    emit(
      BiometricSuccess(
        availableBiometrics: availableBiometrics,
        isEnabled: true,
        message: 'Biometric enabled',
      ),
    );
  }

  Future<void> disableBiometric() async {
    emit(BiometricLoading());
    await _secureStorageServices.saveBiometricEnabled(false);
    biometricEnabled = false;
    emit(
      BiometricSuccess(
        availableBiometrics: availableBiometrics,
        isEnabled: false,
        message: 'Biometric disabled',
      ),
    );
  }
}
