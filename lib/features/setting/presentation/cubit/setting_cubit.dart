import 'package:bloc/bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/cache_keys.dart';
import 'package:coin_gecko_graduation_project_metorship/core/storage/cache_helper.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_state.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit() : super(SettingState.initial());

  void toggleTheme(bool value) async {
    emit(state.copyWith(isDarkMode: value, isLoading: true));
    await AppSharedPreferences.sharedPreferences
        .setBool(CacheKeys.isDarkModeKey, value);
    emit(state.copyWith(isLoading: false));
  }
}
