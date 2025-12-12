import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/data/data_source/remote/settings_remote_data_source.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract interface class SettingsRepo {
  Future<Result<UserModel>> getProfile();
}

@Injectable(as: SettingsRepo)
class SettingsRepoImpl implements SettingsRepo {
  final SettingsRemoteDataSource _remoteDataSource;

  SettingsRepoImpl(this._remoteDataSource);

  @override
  Future<Result<UserModel>> getProfile() async {
    try {
      final userModel = await _remoteDataSource.getProfile();
      return Success<UserModel>(userModel);
    } on FirebaseAuthException catch (e) {
      return FailureResult(FirebaseFailure.fromFirebaseException(code: e.code));
    } on Exception catch (e) {
      return FailureResult(GeneralFailure.fromException(e));
    }
  }
}
