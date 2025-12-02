import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/data/models/onboarding_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/presentation/widgets/onboarding_body.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/presentation/widgets/onboarding_buttons.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/presentation/widgets/onboarding_navigation.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  // Constants
  static const _pageDuration = Duration(milliseconds: 300);
  static const _pageCurve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: _buildPageView(),
            ),
            _buildBottomSection(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: SizedBox.shrink(),
      backgroundColor: AppColors.white,
      elevation: 0,
      actions: [
        if (_isNotLastPage) _buildSkipButton(),
      ],
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      controller: _pageController,
      itemCount: OnboardingModel.pages.length,
      onPageChanged: _onPageChanged,
      itemBuilder: (context, index) {
        return OnboardingBody(model: OnboardingModel.pages[index]);
      },
    );
  }

  Widget _buildBottomSection() {
    if (_isNotLastPage) {
      return OnboardingNavigation(
        pageController: _pageController,
        pageCount: OnboardingModel.pages.length,
        currentPage: _currentPage,
        onNext: _navigateToNextPage,
      );
    }
    return const OnboardingButtons();
  }

  Widget _buildSkipButton() {
    return TextButton(
      onPressed: _skipToLastPage,
      child: const Text(
        AppStrings.skip,
        style: TextStyle(
          color: AppColors.gray800,
          fontSize: 16,
        ),
      ),
    );
  }

  // Helper methods
  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToNextPage() {
    _pageController.nextPage(
      duration: _pageDuration,
      curve: _pageCurve,
    );
  }

  void _skipToLastPage() {
    _pageController.jumpToPage(OnboardingModel.pages.length - 1);
  }

  // Computed properties
  bool get _isNotLastPage => _currentPage != OnboardingModel.pages.length - 1;
}
