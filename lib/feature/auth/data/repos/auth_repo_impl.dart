// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:injectable/injectable.dart';
import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/repos/auth_repo.dart';
import 'package:local_auth/local_auth.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  AuthRepoImpl(
    this._remoteDataSource,
    this._localDataSource,
  );
  @override
  Future<Result<UserModel>> register(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String phoneNumber}) async {
    try {
      final userId = await _remoteDataSource.createUserWithEmailAndPassword(
          email: email, password: password);
      final userModel = UserModel(
          uesrId: userId,
          firstName: firstName,
          lastName: lastName,
          email: email,
          phoneNumber: phoneNumber);
      await _remoteDataSource.saveUserData(userModel: userModel);
      return Success<UserModel>(userModel);
    } on FirebaseFailure catch (e) {
      return FailureResult(e);
    } on ServerFailure catch (e) {
      return FailureResult(e);
    } on Exception catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }

  @override
  Future<Result<String>> signIn(
      {required String email, required String password}) async {
    try {
      final userCredential = await _remoteDataSource.signIn(
        email: email,
        password: password,
      );

      return Success<String>(userCredential);
    } on FirebaseFailure catch (e) {
      return FailureResult(e);
    } on ServerFailure catch (e) {
      return FailureResult(e);
    } on Exception catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }

  @override
  Future<Result<bool>> authenticateBiometric(String reason) async {
    return await _localDataSource.authenticateBiometric(reason);
  }

  @override
  Future<Result<bool>> checkBiometricSupport() async {
    return await _localDataSource.checkBiometricSupport();
  }

  @override
  Future<Result<List<BiometricType>>> getAvailableBiometrics() async {
    return await _localDataSource.getAvailableBiometrics();
  }
}
