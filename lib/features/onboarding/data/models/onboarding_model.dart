import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboardingModel> get pages => [
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
}
