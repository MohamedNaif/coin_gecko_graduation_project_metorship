import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/fingerprint_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/screens/login_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/presentation/screens/register_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/page/home_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/page/trending_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/page/portfolio_page.dart';
import 'package:coin_gecko_graduation_project_metorship/features/splash/presentation/pages/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onboardingScreen:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());
      // case Routes.home:
      //   return MaterialPageRoute(builder: (_) => const Scaffold());
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      // case Routes.signup:
      //   return MaterialPageRoute(builder: (_) => const Scaffold());

      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.trendingScreen:
        return MaterialPageRoute(builder: (_) => const TrendingScreen());
      case Routes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.fingerprintScreen:
        return MaterialPageRoute(builder: (_) => const FingerprintScreen());
      case Routes.portfolio:
        return MaterialPageRoute(builder: (_) => const PortfolioPage());

      default:
        return null;
    }
  }
}
