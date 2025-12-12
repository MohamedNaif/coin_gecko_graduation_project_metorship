import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

@Injectable(as: AuthLocalDataSource)
class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  final LocalAuthentication auth;

  AuthLocalDataSourceImpl(this.auth);

  @override
  Future<Result<bool>> authenticateBiometric(String reason) async {
    try {
      final bool didAuthenticate = await auth.authenticate(
        localizedReason: reason,
        biometricOnly: true,
      );
      return Success<bool>(didAuthenticate);
    } on LocalAuthException catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }

  @override
  Future<Result<bool>> checkBiometricSupport() async {
    try {
      final bool canCheckBiometrics = await auth.canCheckBiometrics;
      final bool isDeviceSupported = await auth.isDeviceSupported();
      return Success<bool>(canCheckBiometrics && isDeviceSupported);
    } on LocalAuthException catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }

  @override
  Future<Result<List<BiometricType>>> getAvailableBiometrics() async {
    try {
      final List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      return Success<List<BiometricType>>(availableBiometrics);
    } on LocalAuthException catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }
}
