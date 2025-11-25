import 'package:coin_gecko_graduation_project_metorship/config/routing/routes.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/data/models/onboarding_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/onboarding/presentation/widgets/onboarding_page.dart';
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
      body: Column(
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
                return OnboardingPage(model: _pages[index]);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 8),
                      height: 8,
                      width: _currentPage == index ? 24 : 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? const Color(0xFF1A1A1A)
                            : Colors.grey[300],
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
                if (_currentPage != _pages.length - 1)
                  GestureDetector(
                    onTap: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1A1A1A),
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
          ),
          if (_currentPage == _pages.length - 1)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1A1A1A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, Routes.signup);
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xFF1A1A1A)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      child: const Text(
                        'Register',
                        style:
                            TextStyle(color: Color(0xFF1A1A1A), fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
