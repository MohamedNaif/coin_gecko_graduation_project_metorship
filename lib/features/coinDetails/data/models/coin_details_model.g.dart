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
      currentPrice: CoinDetailsModel._priceFromJson(
          json['currentPrice'] as Map<String, dynamic>),
      priceChange24h: CoinDetailsModel._priceChangeFromJson(
          json['priceChange24h'] as Map<String, dynamic>),
      marketCap: CoinDetailsModel._marketCapFromJson(
          json['marketCap'] as Map<String, dynamic>),
      volume24h: CoinDetailsModel._volumeFromJson(
          json['volume24h'] as Map<String, dynamic>),
      circulatingSupply: CoinDetailsModel._circulatingSupplyFromJson(
          json['circulatingSupply'] as Map<String, dynamic>),
      maxSupply: CoinDetailsModel._maxSupplyFromJson(
          json['maxSupply'] as Map<String, dynamic>),
      description: CoinDetailsModel._descriptionFromJson(
          json['description'] as Map<String, dynamic>),
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
