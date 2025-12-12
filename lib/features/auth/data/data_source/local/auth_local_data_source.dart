import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:local_auth/local_auth.dart';

abstract interface class AuthLocalDataSource {
    Future<Result<bool>> checkBiometricSupport();
  //! check available biometrics
  Future<Result<List<BiometricType>>> getAvailableBiometrics();
  //? authenticate biometric
  Future<Result<bool>> authenticateBiometric(String reason);
}