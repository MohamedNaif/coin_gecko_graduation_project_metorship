import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
    } on FirebaseAuthException catch (e) {
      return FailureResult(
        FirebaseFailure.fromFirebaseException(code: e.code),
      );
    } on ServerFailure catch (e) {
      return FailureResult(e);
    }on Exception catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }

  @override
  Future<Result<String>> signIn(
      {required String email, required String password}) async {
    try {
      final userCredential = await remoteDataSource.signIn(
        email: email,
        password: password,
      );

      return Success<String>(userCredential);
    } on FirebaseAuthException catch (e) {
      return FailureResult(FirebaseFailure.fromFirebaseException(code: e.code));
    } on ServerFailure catch (e) {
      return FailureResult(e);
    } on Exception catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }
}
