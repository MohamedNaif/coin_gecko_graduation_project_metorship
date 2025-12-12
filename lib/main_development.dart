import 'package:coin_gecko_graduation_project_metorship/config/lang_manager.dart';
import 'package:coin_gecko_graduation_project_metorship/config/routing/app_router.dart';
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_theme.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/check_state_changes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/utils/my_bloc_observer.dart';
import 'package:coin_gecko_graduation_project_metorship/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  await dotenv.load(fileName: ".env");

  Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
  await Stripe.instance.applySettings();

  Bloc.observer = MyBlocObserver();

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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final authStateService = getIt<AuthStateChangesChecker>();

  @override
  void initState() {
    authStateService.checkStateChanges();
    super.initState();
  }

  @override
  void dispose() {
    authStateService.dispose();
    super.dispose();
  }

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
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
