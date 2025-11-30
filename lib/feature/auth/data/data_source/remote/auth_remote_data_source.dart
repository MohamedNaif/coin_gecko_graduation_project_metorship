import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';

abstract interface class AuthRemoteDataSource {
Future<String>  createUserWithEmailAndPassword(
      {required String email, required String password});
    Future<void>  saveUserData({required UserModel userModel});
}