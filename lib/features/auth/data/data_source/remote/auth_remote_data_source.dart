import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<String> createUserWithEmailAndPassword(
      {required String email, required String password});
  Future<void> saveUserData({required UserModel userModel});
  Future<String> signIn(
      {required String email, required String password});
}
