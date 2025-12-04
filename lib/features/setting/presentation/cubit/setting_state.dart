import 'package:coin_gecko_graduation_project_metorship/feature/auth/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'setting_state.freezed.dart';

@freezed
class SettingState with _$SettingState {
  const factory SettingState.initial() = _Initial;
  const factory SettingState.toggleTheme({required bool isDarkMode}) =
      ToggleTheme;

  const factory SettingState.loading() = Loading;
  const factory SettingState.failure({required String errorMessage}) = Failure;
  const factory SettingState.success({required UserModel user}) = Success;
}
