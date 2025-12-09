<<<<<<< HEAD:lib/feature/auth/presentation/screens/register_screen.dart
import 'package:coin_gecko_graduation_project_metorship/core/di/dependency_injection.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/cubit/register_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/feature/auth/presentation/screens/register_screen_body.dart';

=======
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/cubit/register_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/screens/register_screen_body.dart';
>>>>>>> origin/main:lib/features/auth/presentation/screens/register_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: RegisterScreenBody(),
    );
  }
}
