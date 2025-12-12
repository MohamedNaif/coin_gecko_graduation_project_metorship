// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CoinData _$CoinDataFromJson(Map<String, dynamic> json) => CoinData(
      name: json['name'] as String,
      usd: (json['usd'] as num?)?.toDouble(),
      usdChange: (json['usd_24h_change'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoinDataToJson(CoinData instance) => <String, dynamic>{
      'name': instance.name,
      'usd': instance.usd,
      'usd_24h_change': instance.usdChange,
    };
