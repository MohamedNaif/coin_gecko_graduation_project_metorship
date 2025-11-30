import 'package:coin_gecko_graduation_project_metorship/config/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/page/portfolio_page.dart';

void main() {
  configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: const PortfolioPage(),
    );
  }
}
