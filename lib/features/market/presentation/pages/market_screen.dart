import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injector.dart';
import '../cubit/market_cubit.dart';
import '../cubit/search_cubit.dart';
import 'market_page.dart';

class MarketScreen extends StatelessWidget {
  const MarketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MarketCubit>.value(
            value: Injector.marketCubit..loadInitial()),
        BlocProvider<SearchCubit>.value(value: Injector.searchCubit),
      ],
      child:  MarketView(),
    );
  }
}
