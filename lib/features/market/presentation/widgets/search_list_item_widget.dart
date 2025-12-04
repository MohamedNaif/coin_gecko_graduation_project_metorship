import 'package:flutter/material.dart';

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
      ),
    );
  }
}
