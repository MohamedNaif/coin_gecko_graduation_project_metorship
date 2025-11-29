import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  static const Duration _animationDuration = Duration(milliseconds: 260);
  static const Curve _animationCurve = Curves.easeOutCubic;

  List<_NavItem> get _items {
    return [
      const _NavItem(icon: AppAssets.iconHome, label: 'Home'),
      const _NavItem(icon: AppAssets.iconMarket, label: 'Market'),
      const _NavItem(icon: AppAssets.iconPortfolio, label: 'Portfolio'),
      const _NavItem(icon: AppAssets.iconSetting, label: 'Settings'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final bool isDark = Theme.of(context).brightness == Brightness.dark;
    final Color barBackground =
        isDark ? Colors.white.withValues(alpha: 0.06) : Colors.white;
    final Color shadowColor = Colors.black.withValues(
      alpha: isDark ? 0.20 : 0.08,
    );

    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: barBackground,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: 20,
              offset: const Offset(0, -4),
              spreadRadius: 0,
            ),
          ],
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final double itemWidth = constraints.maxWidth / _items.length;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(_items.length, (int index) {
                    final _NavItem item = _items[index];
                    final bool isSelected = index == selectedIndex;
                    return _NavItemWidget(
                      width: itemWidth,
                      index: index,
                      item: item,
                      isSelected: isSelected,
                      onTap: onItemTapped,
                    );
                  }),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem {
  final String icon;
  final String label;
  const _NavItem({required this.icon, required this.label});
}

class _NavItemWidget extends StatelessWidget {
  final double width;
  final int index;
  final _NavItem item;
  final bool isSelected;
  final ValueChanged<int> onTap;

  const _NavItemWidget({
    required this.width,
    required this.index,
    required this.item,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color color =
        isSelected ? AppColors.primaryLight : const Color(0xFF9CA3AF);

    return RepaintBoundary(
      child: SizedBox(
        width: width,
        child: Tooltip(
          message: item.label,
          waitDuration: const Duration(milliseconds: 500),
          child: InkResponse(
            onTap: () => onTap(index),
            radius: 36,
            highlightShape: BoxShape.rectangle,
            containedInkWell: true,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedScale(
                    scale: isSelected ? 1.12 : 1.0,
                    duration: CustomBottomNavigationBar._animationDuration,
                    curve: CustomBottomNavigationBar._animationCurve,
                    child: SvgPicture.asset(
                      item.icon,
                      width: 24,
                      height: 24,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
                    ),
                  ),
                  const SizedBox(height: 4),
                  AnimatedDefaultTextStyle(
                    duration: CustomBottomNavigationBar._animationDuration,
                    curve: CustomBottomNavigationBar._animationCurve,
                    style: (isSelected
                            ? AppTextStyles.medium12
                            : AppTextStyles.regular12)
                        .copyWith(color: color),
                    child: AnimatedOpacity(
                      duration: CustomBottomNavigationBar._animationDuration,
                      opacity: isSelected ? 1.0 : 0.85,
                      child: Text(
                        item.label,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
