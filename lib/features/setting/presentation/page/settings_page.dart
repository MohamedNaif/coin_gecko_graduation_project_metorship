import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/cubit/setting_cubit.dart';
import 'package:coin_gecko_graduation_project_metorship/features/setting/presentation/widgets/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<SettingCubit>()..getProfile(),
      child: Scaffold(
        body: const SettingsBody(),
      ),
    );
  }
}
