import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_dimensions.dart';

class TabsBar extends StatefulWidget {
  const TabsBar({super.key});

  @override
  State<TabsBar> createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  int selectedIndex = 0;

  final List<String> categories = ['All', 'DeFi', 'NFT', 'Gaming', 'Metaverse'];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(categories.length, (index) {
          return CategoryTab(
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

class CategoryTab extends StatelessWidget {
  final String name;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryTab({
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
        borderRadius: BorderRadius.circular(
          AppDimensions.containerBorderRadiusXLarge,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryDark : AppColors.white,
            borderRadius: BorderRadius.circular(
              AppDimensions.containerBorderRadiusXLarge,
            ),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: AppDimensions.paddingVerticalXSmall,
            horizontal: AppDimensions.paddingHorizontal,
          ),
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
