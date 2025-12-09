import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
<<<<<<< HEAD:lib/feature/auth/data/repos/auth_repo.dart
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';
import 'package:local_auth/local_auth.dart';
=======
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';
>>>>>>> origin/main:lib/features/auth/data/repos/auth_repo.dart

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
<<<<<<< HEAD:lib/feature/auth/data/repos/auth_repo.dart
  //*check if device has biometric support
  Future<Result<bool>> checkBiometricSupport();
  //! check available biometrics
  Future<Result<List<BiometricType>>> getAvailableBiometrics();
  //? authenticate biometric
  Future<Result<bool>> authenticateBiometric(String reason);
}
=======
}
>>>>>>> origin/main:lib/features/auth/data/repos/auth_repo.dart
