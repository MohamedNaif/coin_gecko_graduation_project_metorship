import 'package:coin_gecko_graduation_project_metorship/config/lang_manager.dart';
import 'dart:developer';
import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_theme.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/check_state_changes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/utils/my_bloc_observer.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/biometric_lock_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:privacy_screen/privacy_screen.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'config/routing/app_router.dart';

import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();
  await dotenv.load(fileName: ".env");

  Bloc.observer = MyBlocObserver();
  if (kDebugMode) {
    runApp(const MyApp());
  } else {
    await _initSentry();
  }
}

Future<void> _initSentry() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://371bf0e4728cfdfcf7ca762a9e965a2e@o4510234337214464.ingest.us.sentry.io/4510290955206656';

      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(
      SentryWidget(
        child: MyApp(),
      ),
    ),
  );

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
  final navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    super.initState();
    authStateService.checkStateChanges();
    _setupPrivacyScreen();
  }

  void _setupPrivacyScreen() {
    PrivacyScreen.instance.enable(
      iosOptions: const PrivacyIosOptions(
        enablePrivacy: true,
        autoLockAfterSeconds: 10,
        lockTrigger: IosLockTrigger.didEnterBackground,
      ),
      androidOptions: const PrivacyAndroidOptions(
        enableSecure: true,
        autoLockAfterSeconds: 10,
      ),
      backgroundColor: AppColors.deepBlue.withValues(alpha: 0.3),
      blurEffect: PrivacyBlurEffect.light,
    );
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
      navigatorKey: navigatorKey,
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter().generateRoute,
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    builder: (_, child) {
              return PrivacyGate(
                navigatorKey: navigatorKey,
                lockBuilder: (ctx) => BlocProvider(
                  create: (context) => BiometricCubit(
                    getIt<AuthRepo>(),
                  ),
                  child: const BiometricLockScreen(),
                ),
                onLifeCycleChanged: (v) => log("Lifecycle: $v"),
                onLock: () => log("App Locked"),
                onUnlock: () => log("App Unlocked"),
                child: child!,
              );
            },
          
    );
  }
}
