import 'package:flutter/material.dart';

import '../../../../core/constants/app_dimensions.dart';

class SearchListItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int marketCapRank;

  const SearchListItemWidget({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.marketCapRank,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingHorizontal,
        vertical: AppDimensions.paddingVerticalSmall,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingHorizontalSmall,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(
          AppDimensions.containerBorderRadiusLarge,
        ),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(
            AppDimensions.containerBorderRadiusMedium,
          ),
          child: imageUrl.isNotEmpty
              ? Image.network(
                  imageUrl,
                  width: AppDimensions.containerWidth,
                  height: AppDimensions.containerHeight,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: AppDimensions.containerWidth,
                    height: AppDimensions.containerHeight,
                    color: Theme.of(context).dividerColor,
                  ),
                )
              : Container(
                  width: AppDimensions.containerWidth,
                  height: AppDimensions.containerHeight,
                  color: Theme.of(context).dividerColor,
                ),
        ),
        title: Text(name),
        subtitle: Text('Rank #$marketCapRank'),
      ),
    );
  }
}
