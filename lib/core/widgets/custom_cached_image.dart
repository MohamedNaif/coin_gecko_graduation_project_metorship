// import 'dart:developer';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:coin_gecko_graduation_project_metorship/config/theme/app_colors.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/api/end_points.dart';
// import 'package:coin_gecko_graduation_project_metorship/core/constants/app_assets.dart';
// import 'package:shimmer/shimmer.dart';

// class CustomCachedImage extends StatelessWidget {
//   const CustomCachedImage({
//     super.key,
//     this.width,
//     this.height,
//     required this.imagePath,
//     this.fit,
//     this.borderRadius,
//     this.customRadius,
//     this.isCircle = false,
//   });

//   final double? width, height, borderRadius;
//   final String imagePath;
//   final BoxFit? fit;
//   final bool isCircle;
//   final BorderRadius? customRadius;

//   @override
//   Widget build(BuildContext context) {
//     String imageUrl = imagePath.startsWith('http')
//         ? imagePath
//         : "${EndPoints.baseUrl}$imagePath";
//     return CachedNetworkImage(
//       width: width,
//       height: height,
//       cacheKey: imagePath,
//       fit: fit ?? BoxFit.cover,
//       imageBuilder: (context, imageProvider) => Container(
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           borderRadius:
//               customRadius ??
//               BorderRadius.circular(isCircle ? 50 : (borderRadius ?? 10)),
//           image: DecorationImage(
//             image: imageProvider,
//             fit: fit ?? BoxFit.cover,
//           ),
//         ),
//       ),
//       imageUrl: imageUrl,
//       fadeInDuration: const Duration(milliseconds: 300),
//       errorListener: (value) {
//         log('Error loading image: ${EndPoints.baseUrl}$imagePath');
//         log('Error loading image: $value');
//       },
//       errorWidget: (context, url, error) => isCircle
//           ? CircleAvatar(
//               radius: (height ?? 56 / 2),
//               backgroundColor: Colors.transparent,
//               child: ClipRRect(
//                 child: Center(
//                   child: Image.asset(
//                     AppAssets.agentIcon,
//                     fit: BoxFit.contain,
//                     width: width,
//                     height: height,
//                   ),
//                 ),
//               ),
//             )
//           : Center(
//               child: Image.asset(
//                 AppAssets.agentIcon,
//                 fit: BoxFit.contain,
//                 width: width,
//                 height: height,
//               ),
//             ),
//       progressIndicatorBuilder: (context, url, progress) => isCircle
//           ? ShimmerCircleAvatarEffect(radius: borderRadius)
//           : ShimmerContainerEffect(
//               borderRadius: borderRadius,
//               customRadius: customRadius,
//             ),
//     );
//   }
// }

// class ShimmerCircleAvatarEffect extends StatelessWidget {
//   const ShimmerCircleAvatarEffect({super.key, this.radius});

//   final double? radius;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: AppColors.neutral200.withValues(alpha: 0.4),
//       highlightColor: AppColors.white.withValues(alpha: 0.6),
//       child: CircleAvatar(
//         backgroundColor: AppColors.neutral100,
//         radius: radius ?? 6,
//       ),
//     );
//   }
// }

// class ShimmerContainerEffect extends StatelessWidget {
//   const ShimmerContainerEffect({
//     super.key,
//     this.width,
//     this.height,
//     this.borderRadius,
//     this.baseColor,
//     this.highlightColor,
//     this.margin,
//     this.customRadius,
//   });

//   final double? width;
//   final double? height;
//   final double? borderRadius;
//   final EdgeInsetsGeometry? margin;
//   final Color? baseColor;
//   final Color? highlightColor;
//   final BorderRadius? customRadius;

//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       baseColor: baseColor ?? AppColors.neutral200.withValues(alpha: 0.3),
//       highlightColor: highlightColor ?? AppColors.white.withValues(alpha: 0.6),
//       child: Container(
//         margin: margin,
//         width: width,
//         height: height,
//         decoration: BoxDecoration(
//           color: AppColors.neutral100,
//           borderRadius:
//               customRadius ?? BorderRadius.circular(borderRadius ?? 10),
//         ),
//       ),
//     );
//   }
// }
