import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingNavigation extends StatelessWidget {
  final PageController pageController;
  final int pageCount;
  final int currentPage;
  final VoidCallback onNext;

  const OnboardingNavigation({
    super.key,
    required this.pageController,
    required this.pageCount,
    required this.currentPage,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SmoothPageIndicator(
            controller: pageController,
            count: pageCount,
            effect: const ExpandingDotsEffect(
              activeDotColor: AppColors.primaryDark,
              dotColor: AppColors.gray300,
              dotHeight: 8,
              dotWidth: 8,
              expansionFactor: 3,
              spacing: 8,
            ),
          ),
          if (currentPage != pageCount - 1)
            GestureDetector(
              onTap: onNext,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: const BoxDecoration(
                  color: AppColors.primaryDark,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
