import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/portfolio/presentation/widgets/tab_bar/month_filter_bar_item.dart';
import 'package:flutter/material.dart';

class MonthFilterBar extends StatefulWidget {
  const MonthFilterBar({super.key});

  @override
  State<MonthFilterBar> createState() => _MonthFilterBarState();
}

class _MonthFilterBarState extends State<MonthFilterBar> {
  int selectedIndex = 0;

  final List<String> _months = [
    'dec',
    'nov',
    'oct',
    'sep',
    'aug',
    'jul',
    'jun',
    'may',
    'apr',
    'mar',
    'feb',
    'jan'
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.heightScale(35),
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: _months.length,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return MonthFilterBarItem(
            month: _months[index],
            isSelected: index == selectedIndex,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        },
      ),
    );
  }
}
