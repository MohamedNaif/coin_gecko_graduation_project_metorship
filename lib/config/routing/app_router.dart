import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

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
        return MaterialPageRoute(builder: (_) => const Scaffold());
      case Routes.signup:
        return MaterialPageRoute(builder: (_) => const Scaffold());
      default:
        return null;
    }
  }
}
