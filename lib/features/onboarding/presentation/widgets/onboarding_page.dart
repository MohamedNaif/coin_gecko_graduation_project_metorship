import 'package:coin_gecko_graduation_project_metorship/features/onboarding/data/models/onboarding_model.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingPage({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image asset
          Image.asset(
            model.image,
            height: 300,
          ),
          // Container(
          //   height: 300,
          //   width: double.infinity,
          //   decoration: BoxDecoration(
          //     color: Colors.grey[200],
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   child: const Icon(
          //     Icons.image,
          //     size: 100,
          //     color: Colors.grey,
          //   ),
          // ),
          const SizedBox(height: 40),
          Text(
            model.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          const SizedBox(height: 16),
          Text(
            model.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
