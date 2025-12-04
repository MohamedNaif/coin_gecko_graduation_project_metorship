import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DarkModeSwitch extends StatelessWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingCubit, SettingState>(
      builder: (context, state) {
        return state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Switch(
                value: state.isDarkMode,
                onChanged: (value) async {
                  context.read<SettingCubit>().toggleTheme(value);
                });
      },
    );
  }
}
