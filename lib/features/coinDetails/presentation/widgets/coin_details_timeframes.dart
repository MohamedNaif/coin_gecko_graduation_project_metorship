import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/coin_details_cubit.dart';

class CoinDetailsTimeframes extends StatelessWidget {
  final String selected;

  const CoinDetailsTimeframes({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    final timeframes = [
      {'label': '1h', 'value': '0.04'},
      {'label': '1d', 'value': '1'},
      {'label': '1w', 'value': '7'},
      {'label': '1m', 'value': '30'},
      {'label': '1y', 'value': '365'},
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: timeframes.map((tf) {
        final isSelected = tf['value'] == selected;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: ElevatedButton(
            onPressed: () {
              context.read<CoinDetailsCubit>().changeTimeframe('bitcoin', tf['value']!);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
              isSelected ? const Color(0xFF1E3A8A) : Colors.grey.shade200,
              foregroundColor: isSelected ? Colors.white : Colors.black,
            ),
            child: Text(tf['label']!),
          ),
        );
      }).toList(),
    );
  }
}
