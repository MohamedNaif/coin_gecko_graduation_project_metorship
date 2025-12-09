import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/core/storage/secure_storage_services.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/login_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/screens/login_screen_body.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LoginCubit(getIt<AuthRepo>()),
        ),
        BlocProvider(
          create: (context) => BiometricCubit(
            getIt<AuthRepo>(),
            getIt<SecureStorageServices>(),
          )..checkSupport(),
        ),
      ],
      child: const LoginScreenBody(),
    );
  }
}
