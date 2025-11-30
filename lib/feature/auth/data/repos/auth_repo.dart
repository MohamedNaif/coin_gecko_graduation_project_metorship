import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';

abstract interface class AuthRepo {
  Future<Result<UserModel>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String phoneNumber,
  });
}