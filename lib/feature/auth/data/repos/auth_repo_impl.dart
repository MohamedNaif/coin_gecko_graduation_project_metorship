import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  AuthRemoteDataSource remoteDataSource;
  AuthRepoImpl(this.remoteDataSource);
  @override
  Future<Result<UserModel>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      final userId = await remoteDataSource.createUserWithEmailAndPassword(
          email: email, password: password);
      final userModel = UserModel(
          uesrId: userId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber);
      await remoteDataSource.saveUserData(userModel: userModel);
      return Success<UserModel>(userModel);
    } catch (e) {
      return FailureResult(FirebaseFailure(errMessage: e.toString()));
    }
  }
}
