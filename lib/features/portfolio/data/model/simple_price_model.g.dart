// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'simple_price_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimplePriceModel _$SimplePriceModelFromJson(Map<String, dynamic> json) =>
    SimplePriceModel(
      coins: (json['coins'] as List<dynamic>?)
          ?.map((e) => CoinData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimplePriceModelToJson(SimplePriceModel instance) =>
    <String, dynamic>{'coins': instance.coins};
