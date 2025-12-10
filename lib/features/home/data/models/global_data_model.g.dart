// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalDataResponse _$GlobalDataResponseFromJson(Map<String, dynamic> json) =>
    GlobalDataResponse(
      data: json['data'] == null
          ? null
          : GlobalDataModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GlobalDataResponseToJson(GlobalDataResponse instance) =>
    <String, dynamic>{'data': instance.data};

GlobalDataModel _$GlobalDataModelFromJson(
  Map<String, dynamic> json,
) => GlobalDataModel(
  activeCryptocurrencies: (json['active_cryptocurrencies'] as num?)?.toInt(),
  markets: (json['markets'] as num?)?.toInt(),
  totalMarketCap: (json['total_market_cap'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  totalVolume: (json['total_volume'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(k, (e as num).toDouble()),
  ),
  marketCapPercentage: (json['market_cap_percentage'] as Map<String, dynamic>?)
      ?.map((k, e) => MapEntry(k, (e as num).toDouble())),
);

Map<String, dynamic> _$GlobalDataModelToJson(GlobalDataModel instance) =>
    <String, dynamic>{
      'active_cryptocurrencies': instance.activeCryptocurrencies,
      'markets': instance.markets,
      'total_market_cap': instance.totalMarketCap,
      'total_volume': instance.totalVolume,
      'market_cap_percentage': instance.marketCapPercentage,
    };
