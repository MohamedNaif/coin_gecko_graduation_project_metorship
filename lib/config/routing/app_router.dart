
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/faceid_camera_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/faceid_success_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/fingerprint_scanning_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/set_fingerprint_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/screens/login_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/splash/presentation/pages/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const Scaffold());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.setFingerprintScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BiometricCubit(
              getIt<AuthRepo>(),
            ),
            child: const SetFingerprintScreen(),
          ),
        );
      case Routes.fingerprintScanningScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BiometricCubit(
              getIt<AuthRepo>(),
            ),
            child: const FingerprintScanningScreen(),
          ),
        );
      case Routes.faceIdCameraScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BiometricCubit(
              getIt<AuthRepo>(),
            ),
            child: const FaceIdCameraScreen(),
          ),
        );
      case Routes.faceIdSuccessScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => BiometricCubit(
              getIt<AuthRepo>(),
            ),
            child: const FaceIdSuccessScreen(),
          ),
        );
      default:
        return null;
    }
  }
}
