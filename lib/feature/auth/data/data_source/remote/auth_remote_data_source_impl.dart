
import 'package:coin_gecko_graduation_project_metorship/core/api/firebase_utils.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
 final FirebaseUtils firebaseUtils;
  
  AuthRemoteDataSourceImpl(
    this.firebaseUtils,
  );

  @override
  Future<String> createUserWithEmailAndPassword({required String email, required String password}) async {
    return await firebaseUtils.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> saveUserData({required UserModel userModel}) async {
    return await firebaseUtils.saveUserData(userModel: userModel);
  }
 }
