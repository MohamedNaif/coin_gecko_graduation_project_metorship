
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:flutter/material.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (_) => const Scaffold());
     
      default:
        return null;
    }
  }
}
