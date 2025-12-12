import 'package:coin_gecko_graduation_project_metorship/config/theme/app_style.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:coin_gecko_graduation_project_metorship/features/auth/data/models/user_model.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsHeader extends StatelessWidget {
  const SettingsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      buildWhen: (context, state) {
        return state is! ToggleTheme;
      },
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () => const SizedBox(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          failure: (errorMessage) => Center(
            child: Text(errorMessage),
          ),
          success: (user) => SettingsHeaderSuccessState(user: user),
        );
      },
    );
  }
}

class SettingsHeaderSuccessState extends StatelessWidget {
  const SettingsHeaderSuccessState({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CircleAvatar(
          radius: AppDimensions.profileAvatarRadius,
          // did'nt have user image cause firebase storage is not implemented so i used placeholder
          backgroundImage: NetworkImage(
            'https://i.pravatar.cc/400',
          ),
        ),
        const SizedBox(height: 16),
        Text(
          user.name ?? 'User',
          style: AppTextStyles.bold20,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            user.email ?? '',
            style: const TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}
