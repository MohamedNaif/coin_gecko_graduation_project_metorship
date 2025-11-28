import 'package:coin_gecko_graduation_project_metorship/features/portfolio/page/portfolio_page.dart';
import 'package:flutter/material.dart';

void main() {
  // configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const PortfolioPage(),
    );
  }
}
