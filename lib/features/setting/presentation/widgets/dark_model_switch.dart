import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      buildWhen: (context, state) {
        return state is ToggleTheme;
      },
      builder: (context, state) {
        final isDarkMode = state.maybeWhen(
            orElse: () => false, toggleTheme: (isDarkMode) => isDarkMode);

        return SizedBox(
            width: context.widthScale(40),
            height: context.heightScale(25),
            child: Switch(
                value: isDarkMode,
                onChanged: (value) {
                  context.read<SettingCubit>().toggleTheme(value);
                }));
      },
    );
  }
}
