import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
@injectable
class AuthStateChangesChecker {
StreamSubscription<User?>? _authSubscription;
void checkStateChanges() {
   
  _authSubscription = FirebaseAuth.instance
    .authStateChanges()
    .listen((user) {
      if (user == null) {
        log('User signed out', name: 'Auth');
      } else {
        log('User signed in', name: 'Auth');
      }
    });
}
dispose(){
  _authSubscription?.cancel();
}
}