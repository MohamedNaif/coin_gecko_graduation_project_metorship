// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinDetailsModel _$CoinDetailsModelFromJson(Map<String, dynamic> json) =>
    CoinDetailsModel(
      id: json['id'] as String,
      name: json['name'] as String,
      symbol: json['symbol'] as String,
      currentPrice:
          (CoinDetailsModel._readCurrentPrice(json, 'currentPrice') as num?)
              ?.toDouble(),
      priceChange24h:
          (CoinDetailsModel._readPriceChange(json, 'priceChange24h') as num)
              .toDouble(),
      marketCap: (CoinDetailsModel._readMarketCap(json, 'marketCap') as num)
          .toDouble(),
      volume24h:
          (CoinDetailsModel._readVolume(json, 'volume24h') as num).toDouble(),
      circulatingSupply:
          (CoinDetailsModel._readCirculatingSupply(json, 'circulatingSupply')
                  as num)
              .toDouble(),
      maxSupply: (CoinDetailsModel._readMaxSupply(json, 'maxSupply') as num)
          .toDouble(),
      description:
          CoinDetailsModel._readDescription(json, 'description') as String,
    );

Map<String, dynamic> _$CoinDetailsModelToJson(CoinDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'currentPrice': instance.currentPrice,
      'priceChange24h': instance.priceChange24h,
      'marketCap': instance.marketCap,
      'volume24h': instance.volume24h,
      'circulatingSupply': instance.circulatingSupply,
      'maxSupply': instance.maxSupply,
      'description': instance.description,
    };
