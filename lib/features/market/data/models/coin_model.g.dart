// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinModel _$CoinModelFromJson(Map<String, dynamic> json) => CoinModel(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      imageUrl: json['image'] as String,
      currentPrice: (json['current_price'] as num).toDouble(),
      priceChangePercent24h:
          (json['price_change_percentage_24h'] as num).toDouble(),
      marketCapRank: (json['market_cap_rank'] as num).toInt(),
    );

Map<String, dynamic> _$CoinModelToJson(CoinModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'image': instance.imageUrl,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceChangePercent24h,
      'market_cap_rank': instance.marketCapRank,
    };
