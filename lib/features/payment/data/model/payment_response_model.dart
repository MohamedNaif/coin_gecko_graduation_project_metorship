import 'package:json_annotation/json_annotation.dart';
part 'payment_response_model.g.dart';

@JsonSerializable()
class PaymentResponseModel {
  final String id;

  @JsonKey(name: "client_secret")
  final String clientSecret;

  final int amount;
  final String currency;

  PaymentResponseModel({
    required this.id,
    required this.clientSecret,
    required this.amount,
    required this.currency,
  });

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaymentResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentResponseModelToJson(this);
}
