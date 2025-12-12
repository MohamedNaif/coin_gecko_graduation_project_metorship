import 'package:bloc/bloc.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/cache_keys.dart';
import 'package:coin_gecko_graduation_project_metorship/core/storage/cache_helper.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/data/repos/settings_repo_impl.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class SettingCubit extends Cubit<SettingState> {
  final SettingsRepo _settingsRepo;

  SettingCubit(this._settingsRepo) : super(SettingState.initial());

  void toggleTheme(bool value) async {
    await AppSharedPreferences.sharedPreferences
        .setBool(CacheKeys.isDarkModeKey, value);

    emit(SettingState.toggleTheme(isDarkMode: value));
  }

  Future<void> getProfile() async {
    emit(SettingState.loading());
    final result = await _settingsRepo.getProfile();
    result.fold(
        (failure) =>
            emit(SettingState.failure(errorMessage: failure.errMessage)),
        (userModel) => emit(SettingState.success(user: userModel)));
  }
}
