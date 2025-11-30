import 'package:coin_gecko_graduation_project_metorship/config/lang_manager.dart';
import 'package:coin_gecko_graduation_project_metorship/config/routing/app_router.dart';
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';

import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  configureDependencies();

  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocal, englishLocal],
      fallbackLocale: englishLocal,
      startLocale: englishLocal,
      path: assetsLocalization,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter().generateRoute,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(body: Center(child: Text('Coin Gecko Development'))),
    );
  }
}
