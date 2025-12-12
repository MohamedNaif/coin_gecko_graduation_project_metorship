import 'dart:math';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../config/theme/app_colors.dart';
import '../../../../core/constants/app_assets.dart';
import '../../../coinDetails/presentation/screens/coin_details_page.dart';

class ListItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double changePercent;
  final int marketCapRank;
  final double price;
  final String coinId;

  const ListItemWidget({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.changePercent,
    required this.marketCapRank,
    required this.price,
    required this.coinId,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingHorizontal,
        vertical: AppDimensions.paddingVerticalSmall,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingHorizontalSmall,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
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
                    color: Colors.grey[200],
                  ),
                )
              : Container(
                  width: AppDimensions.containerWidth,
                  height: AppDimensions.containerHeight,
                  color: Colors.grey[200],
                ),
        ),
        title: Text(name),
        subtitle: Text('Rank #$marketCapRank'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Flexible(
              child: Text(
                '\$$price',
                style: TextStyle(
                  fontSize: AppDimensions.textSizeLarge,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: AppDimensions.spacingXTiny),
            Container(
              width: AppDimensions.containerWidth,
              height: AppDimensions.containerHeightSmall,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  AppDimensions.containerBorderRadiusSmall,
                ),
                color: changePercent >= 0
                    ? AppColors.success
                    : AppColors.secondary,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  changePercent >= 0
                      ? SvgPicture.asset(
                          AppAssets.iconArowUpRight,
                          height: AppDimensions.svgIconHeight,
                          width: AppDimensions.svgIconWidth,
                          fit: BoxFit.scaleDown,
                        )
                      : Transform.rotate(
                          angle: pi * 2 / 2,
                          child: SvgPicture.asset(
                            AppAssets.iconArowUpRight,
                            height: AppDimensions.svgIconHeight,
                            width: AppDimensions.svgIconWidth,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                  Flexible(
                    child: Text(
                      '${changePercent.abs().toStringAsFixed(2)}%',
                      style: TextStyle(
                        fontSize: AppDimensions.textSizeXSmall,
                        color: AppColors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CoinDetailsPage(coinId: coinId),
            ),
          );
        },
      ),
    );
  }
}
