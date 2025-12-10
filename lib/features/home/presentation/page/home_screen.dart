import 'package:coin_gecko_graduation_project_metorship/core/di/di.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/manager/home_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/custom_bottom_navigation_bar.dart';
import 'package:coin_gecko_graduation_project_metorship/features/home/presentation/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> get _widgetOptions => <Widget>[
        BlocProvider(
          create: (context) => getIt<HomeCubit>(),
          child: const HomeScreenBody(),
        ),
        Center(child: Text(AppStrings.marketScreenBody.tr())),
        Center(child: Text(AppStrings.portfolioScreenBody.tr())),
        Center(child: Text(AppStrings.settingsScreenBody.tr())),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
