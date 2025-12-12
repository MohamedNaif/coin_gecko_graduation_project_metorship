import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/firebase_constant.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract interface class SettingsRemoteDataSource {
  Future<UserModel> getProfile();
}

@Injectable(as: SettingsRemoteDataSource)
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;

  SettingsRemoteDataSourceImpl(this._firebaseAuth, this._firebaseFirestore);

  @override
  Future<UserModel> getProfile() async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw FirebaseAuthException(
          code: 'user-not-found', message: 'User not logged in');
    }

    final doc = await _firebaseFirestore
        .collection(FirebaseConstants.usersCollection)
        .doc(user.uid)
        .get();
    if (!doc.exists) {
      throw FirebaseAuthException(
          code: 'user-not-found', message: 'User data not found');
    }

    return UserModel.fromMap(doc.data()!);
  }
}
