import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:flutter/material.dart';

import '../../features/market/presentation/pages/market_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.market:
        return MaterialPageRoute(builder: (_) => const MarketScreen());

      default:
        return null;
    }
  }
}
