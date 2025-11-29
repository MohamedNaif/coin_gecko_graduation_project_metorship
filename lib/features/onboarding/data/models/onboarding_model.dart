import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';

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
          title: AppStrings.welcomeToCryptoX,
          description: '',
        ),
        OnboardingModel(
          image: AppAssets.onboardingSecondPage,
          title: AppStrings.transactionSecurity,
          description: '',
        ),
        OnboardingModel(
          image: AppAssets.onboardingThirdPage,
          title: AppStrings.fastAndReliableMarketUpdated,
          description: '',
        ),
        OnboardingModel(
          image: AppAssets.onboardingForthPage,
          title: AppStrings.getStartedNow,
          description: '',
        ),
      ];
}
