import 'package:coin_gecko_graduation_project_metorship/config/lang_manager.dart';
import 'dart:developer';

import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_theme.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/cache_keys.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/check_state_changes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/storage/cache_helper.dart';
import 'package:coin_gecko_graduation_project_metorship/core/utils/my_bloc_observer.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_state.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/cubit/biometric_cubit.dart';
// import 'package:coin_gecko_graduation_project_metorship/features/auth/biometric_auth/screens/biometric_lock_screen.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/repos/auth_repo.dart';
import 'package:coin_gecko_graduation_project_metorship/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
// import 'package:privacy_screen/privacy_screen.dart';
import 'config/routing/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  configureDependencies();
  await dotenv.load(fileName: ".env");

  Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
  await Stripe.instance.applySettings();
  await AppSharedPreferences.initialSharedPreference();

  Bloc.observer = MyBlocObserver();

  runApp(
    EasyLocalization(
      supportedLocales: const [arabicLocal, englishLocal],
      fallbackLocale: englishLocal,
      startLocale: englishLocal,
      path: assetsLocalization,
      child: MultiBlocProvider(providers: [
        BlocProvider<BiometricCubit>(
          create: (context) => BiometricCubit(
            getIt<AuthRepo>(),
          ),
        ),
        BlocProvider<SettingCubit>(
          create: (context) => SettingCubit(getIt()),
        ),
        
      ],
        child: const MyApp(),
      ),
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
    // _setupPrivacyScreen();
  }

  // void _setupPrivacyScreen() {
  //   PrivacyScreen.instance.enable(
  //     iosOptions: const PrivacyIosOptions(
  //       enablePrivacy: true,
  //       autoLockAfterSeconds: 10,
  //       lockTrigger: IosLockTrigger.didEnterBackground,
  //     ),
  //     androidOptions: const PrivacyAndroidOptions(
  //       enableSecure: true,
  //       autoLockAfterSeconds: 10,
  //     ),
  //     backgroundColor: AppColors.deepBlue.withValues(alpha: 0.3),
  //     blurEffect: PrivacyBlurEffect.light,
  //   );
  // }

  @override
  void dispose() {
    authStateService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      buildWhen: (context, state) {
        return state is ToggleTheme;
      },
      builder: (context, state) {
        final isDark = state.maybeWhen(
          toggleTheme: (isDarkMode) => isDarkMode,
          orElse: () =>
              AppSharedPreferences.sharedPreferences
                  .getBool(CacheKeys.isDarkModeKey) ??
              false,
        );
        return MaterialApp(
          navigatorKey: navigatorKey,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          initialRoute: Routes.splash,
          onGenerateRoute: AppRouter().generateRoute,
          title: 'Fintech App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          // builder: (_, child) {
          //   return child!;
          // },
        );
      },
    );
  }
}
