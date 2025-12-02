import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/widgets.dart';

class HoldingSectionErrorState extends StatelessWidget {
  const HoldingSectionErrorState({super.key, required this.errorMessaga});
  final String? errorMessaga;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(
          errorMessaga ?? AppStrings.errorMessaga,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
