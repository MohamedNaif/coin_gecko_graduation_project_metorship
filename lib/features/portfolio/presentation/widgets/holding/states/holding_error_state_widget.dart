import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/extension/context_extention.dart';
import 'package:flutter/widgets.dart';

class HoldingSectionErrorState extends StatelessWidget {
  const HoldingSectionErrorState({super.key, required this.errorMessage});
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Text(
          errorMessage ?? AppStrings.errorMessage,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.theme.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
