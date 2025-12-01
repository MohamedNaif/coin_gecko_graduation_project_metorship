import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:flutter/material.dart';

import 'config/routing/app_router.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter().generateRoute,
      home: const Scaffold(body: Center(child: Text('Coin Gecko Production'))),
    );
  }
}
