import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListItemWidget extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double changePercent;
  final int marketCapRank;
  final double price;

  const ListItemWidget(
      {super.key,
      required this.name,
      required this.imageUrl,
      required this.changePercent,
      required this.marketCapRank,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: imageUrl.isNotEmpty
              ? Image.network(imageUrl,
                  width: 52,
                  height: 52,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      Container(width: 52, height: 52, color: Colors.grey[200]))
              : Container(width: 52, height: 52, color: Colors.grey[200]),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            Container(
              width: 52,
              height: 22,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color:
                    changePercent >= 0 ? Color(0xff00CB6A) : Color(0xffF26666),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  changePercent >= 0
                      ? SvgPicture.asset(
                          'assets/icons/arow_up_right_icon.svg',
                          height: 18,
                          width: 18,
                          fit: BoxFit.scaleDown,
                        )
                      : Transform.rotate(
                          angle: pi * 2 / 2,
                          child: SvgPicture.asset(
                            'assets/icons/arow_up_right_icon.svg',
                            height: 18,
                            width: 18,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                  Flexible(
                    child: Text(
                      '${changePercent.abs().toStringAsFixed(2)}%',
                      style: TextStyle(fontSize: 10, color: Colors.white),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
