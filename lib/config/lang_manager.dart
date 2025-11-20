import 'package:flutter/material.dart';

enum LanguageType { english, arabic }

const String arabic = 'ar';
const String english = 'en';
const String assetsLocalization = 'assets/translations';

const Locale arabicLocal = Locale("ar", "SA");
const Locale englishLocal = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String get getValue {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
