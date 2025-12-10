// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_coin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrendingData _$TrendingDataFromJson(Map<String, dynamic> json) => TrendingData(
  coins: (json['coins'] as List<dynamic>?)
      ?.map((e) => TrendingCoinModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TrendingDataToJson(TrendingData instance) =>
    <String, dynamic>{'coins': instance.coins};

TrendingCoinModel _$TrendingCoinModelFromJson(Map<String, dynamic> json) =>
    TrendingCoinModel(
      id: TrendingCoinModel._readId(json, 'id') as String?,
      name: TrendingCoinModel._readName(json, 'name') as String?,
      symbol: TrendingCoinModel._readSymbol(json, 'symbol') as String?,
      thumb: TrendingCoinModel._readThumb(json, 'thumb') as String?,
      price: (TrendingCoinModel._readPrice(json, 'price') as num?)?.toDouble(),
      priceChangePercentage24h:
          (TrendingCoinModel._readPriceChange(
                    json,
                    'price_change_percentage_24h',
                  )
                  as num?)
              ?.toDouble(),
      sparkline: TrendingCoinModel._readSparkline(json, 'sparkline') as String?,
    );

Map<String, dynamic> _$TrendingCoinModelToJson(TrendingCoinModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'thumb': instance.thumb,
      'price': instance.price,
      'price_change_percentage_24h': instance.priceChangePercentage24h,
      'sparkline': instance.sparkline,
    };
