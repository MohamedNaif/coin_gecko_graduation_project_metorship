import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';

@singleton
class FirebaseUtils {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firebaseFirestore;
  FirebaseUtils(
    this._firebaseAuth,
    this._firebaseFirestore,
  );

  Future<String> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      log('Starting user creation for email: $email');

      if (email.isEmpty || password.isEmpty) {
        throw Exception('Email and password cannot be empty');
      }

      log('Firebase Auth creating user...');
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      final userId = credential.user?.uid;
      if (userId == null) {
        throw Exception('User creation failed: no UID returned');
      }

      log('User created successfully with ID: $userId');
      return userId;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException: ${e.code} - ${e.message}');
      throw FirebaseFailure.fromFirebaseException(code: e.code);
    }
  }

  Future<void> saveUserData({required UserModel userModel}) {
    try {
      final users = _firebaseFirestore.collection('users');
      return users.doc(userModel.uesrId).set(userModel.toMap()).then((value) {
        log('User Data Added successfully for user: ${userModel.uesrId}');
      }).catchError((error) {
        log('Failed to add user data: $error');
        throw Exception('Failed to add user data: $error');
      });
    } catch (e) {
      log('Exception during saveUserData: $e');
      throw Exception('Failed to save user data: $e');
    }
  }

  Future<String> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );
      final userId = credential.user?.uid;
      if (userId == null) {
        throw Exception('User sign-in failed: no UID returned');
      }

      log('User signed in successfully with ID: $userId');
      return userId;
    } on FirebaseAuthException catch (e) {
      log('FirebaseAuthException during signIn: ${e.code} - ${e.message}');
      throw FirebaseFailure.fromFirebaseException(code: e.code);
    }
  }
}
