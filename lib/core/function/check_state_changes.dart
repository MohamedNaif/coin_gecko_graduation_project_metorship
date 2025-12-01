import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

void checkStateChanges() {
   StreamSubscription<User?>? _authSubscription;
  _authSubscription = FirebaseAuth.instance
    .authStateChanges()
    .listen((user) {
      if (user == null) {
        log('User signed out', name: 'Auth');
      } else {
        log('User signed in', name: 'Auth');
        _authSubscription?.cancel();
      }
    });
}