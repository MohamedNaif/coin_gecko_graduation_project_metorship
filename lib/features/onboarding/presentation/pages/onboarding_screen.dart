import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
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
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: AppAssets.onboardingFirstPage,
      title: 'Welcome To Crypto X',
      description: '',
    ),
    OnboardingModel(
      image: AppAssets.onboardingSecondPage,
      title: 'Transaction Security',
      description: '',
    ),
    OnboardingModel(
      image: AppAssets.onboardingThirdPage,
      title: 'Fast And Reliable Market Updated',
      description: '',
    ),
    OnboardingModel(
      image: AppAssets.onboardingForthPage,
      title: 'Get Started Now!',
      description: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          if (_currentPage != _pages.length - 1)
            TextButton(
              onPressed: () {
                _pageController.jumpToPage(_pages.length - 1);
              },
              child: const Text(
                'Skip',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 16,
                ),
              ),
            ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingBody(model: _pages[index]);
                },
              ),
            ),
            if (_currentPage != _pages.length - 1)
              OnboardingNavigation(
                pageController: _pageController,
                pageCount: _pages.length,
                currentPage: _currentPage,
                onNext: () {
                  _pageController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              )
            else
              const OnboardingButtons(),
          ],
        ),
      ),
    );
  }
}
