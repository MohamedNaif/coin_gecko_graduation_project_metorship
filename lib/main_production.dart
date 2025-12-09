import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/core/function/check_state_changes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/utils/my_bloc_observer.dart';
import 'package:coin_gecko_graduation_project_metorship/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'config/routing/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  configureDependencies();

  Bloc.observer = MyBlocObserver();

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
      initialRoute: Routes.splash,
      onGenerateRoute: AppRouter().generateRoute,
    );
  }
}
