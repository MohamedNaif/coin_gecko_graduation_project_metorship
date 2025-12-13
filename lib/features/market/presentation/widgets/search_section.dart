import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/constants/app_strings.dart';
import '../cubit/search_cubit.dart';

class SearchSection extends StatefulWidget {
  const SearchSection({super.key});

  @override
  State<SearchSection> createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  final TextEditingController searchTextController = TextEditingController();

  @override
  void dispose() {
    searchTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.90,
        child: TextField(
          controller: searchTextController,
          onChanged: (value) => context.read<SearchCubit>().search(value),
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).colorScheme.surface,
            hintText: AppStrings.searchHint,
            hintStyle: TextStyle(color: Theme.of(context).dividerColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            prefixIcon: SvgPicture.asset(
              AppAssets.searchIcon,
              height: AppDimensions.svgIconHeight,
              width: AppDimensions.svgIconWidth,
              fit: BoxFit.scaleDown,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                // filter action
              },
              icon: SvgPicture.asset(
                AppAssets.filterIcon,
                height: AppDimensions.svgIconHeight,
                width: AppDimensions.svgIconWidth,
                fit: BoxFit.scaleDown,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: AppDimensions.paddingHorizontal,
              vertical: AppDimensions.paddingVertical,
            ),
          ),
        ),
      ),
    );
  }
}
