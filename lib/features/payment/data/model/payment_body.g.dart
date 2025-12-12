// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentBody _$PaymentBodyFromJson(Map<String, dynamic> json) => PaymentBody(
      amount: json['amount'] as String,
      name: json['name'] as String,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$PaymentBodyToJson(PaymentBody instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'name': instance.name,
      'currency': instance.currency,
    };
