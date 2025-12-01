import 'package:coin_gecko_graduation_project_metorship/config/routing/app_router.dart';
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';

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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
