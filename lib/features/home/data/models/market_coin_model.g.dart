// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'market_coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MarketCoinModel _$MarketCoinModelFromJson(Map<String, dynamic> json) =>
    MarketCoinModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      image: json['image'] as String?,
      currentPrice: (json['current_price'] as num?)?.toDouble(),
      priceChangePercentage24h: (json['price_change_percentage_24h'] as num?)
          ?.toDouble(),
    );

Map<String, dynamic> _$MarketCoinModelToJson(MarketCoinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'image': instance.image,
      'current_price': instance.currentPrice,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
    };
