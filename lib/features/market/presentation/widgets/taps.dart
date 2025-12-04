import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TapsBar extends StatefulWidget {
  const TapsBar({super.key});

  @override
  State<TapsBar> createState() => _TapsBarState();
}

class _TapsBarState extends State<TapsBar> {
  int selectedIndex = 0;

  final List<String> categories = [
    'All',
    'DeFi',
    'NFT',
    'Gaming',
    'Metaverse',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return CategoryTap(
            name: categories[index],
            isSelected: selectedIndex == index,
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
          );
        }),
      ),
    );
  }
}

class CategoryTap extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTap({
    super.key,
    required this.name,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(25),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryDark : AppColors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
          child: Text(
            name,
            style: GoogleFonts.raleway(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: isSelected ? AppColors.white : AppColors.primaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
