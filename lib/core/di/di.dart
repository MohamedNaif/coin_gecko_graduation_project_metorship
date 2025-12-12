import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:local_auth/local_auth.dart';

import 'di.config.dart';
	
final getIt = GetIt.instance;  
  
@InjectableInit(  
  initializerName: 'init',  
  preferRelativeImports: true,  
  asExtension: true,  
)  
void configureDependencies() {

  getIt.registerLazySingleton<LocalAuthentication>(
    () => LocalAuthentication(),
  );
  getIt.init();
} 
@module
abstract class FirebaseModule {
  @lazySingleton
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  
  @lazySingleton
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
} 