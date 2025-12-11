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
      marketData: json['market_data'] as Map<String, dynamic>,
      description: json['description'] as Map<String, dynamic>,
    );

Map<String, dynamic> _$CoinDetailsModelToJson(CoinDetailsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'market_data': instance.marketData,
      'description': instance.description,
    };
