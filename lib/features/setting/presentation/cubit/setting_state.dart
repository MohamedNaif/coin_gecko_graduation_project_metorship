// ✅ State واحد فيه كل الـ data
import 'package:coin_gecko_graduation_project_metorship/core/constants/cache_keys.dart';
import 'package:equatable/equatable.dart';
import 'package:coin_gecko_graduation_project_metorship/core/storage/cache_helper.dart';

class SettingState extends Equatable {
  final bool isDarkMode;
  final bool isLoading;

  const SettingState({
    required this.isDarkMode,
    this.isLoading = false,
  });

  factory SettingState.initial() {
    final isDarkMode = AppSharedPreferences.sharedPreferences
            .getBool(CacheKeys.isDarkModeKey) ??
        false;
    return SettingState(isDarkMode: isDarkMode);
  }

  SettingState copyWith({
    bool? isDarkMode,
    bool? isLoading,
  }) {
    return SettingState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [isDarkMode, isLoading];
}
