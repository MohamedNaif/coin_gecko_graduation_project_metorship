// // // lib/main.dart
// import 'package:coin_gecko_graduation_project_metorship/features/coinDetails/presentation/screens/coin_details_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'domain/usecase/get_chart_details.dart';
// import 'domain/usecase/get_coin_details.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await initializeDependencies();
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiRepositoryProvider(
//       providers: [
//         RepositoryProvider(create: (_) => sl<GetCoinDetails>()),
//         RepositoryProvider(create: (_) => sl<GetChartData>()),
//       ],
//       child: MaterialApp(
//         title: 'Crypto App',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//           useMaterial3: true,
//         ),
//         home: const CoinDetailsPage(coinId: 'bitcoin'),
//       ),
//     );
//   }
// }
