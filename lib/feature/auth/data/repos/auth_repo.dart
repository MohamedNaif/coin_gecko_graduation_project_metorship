import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';
import 'package:local_auth/local_auth.dart';

abstract interface class AuthRepo {
  Future<Result<UserModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  });
Future<Result<String>> signIn({
    required String email,
    required String password,
  });
  //*check if device has biometric support
  Future<Result<bool>> checkBiometricSupport();
  //! check available biometrics
  Future<Result<List<BiometricType>>> getAvailableBiometrics();
  //? authenticate biometric
  Future<Result<bool>> authenticateBiometric(String reason);
}