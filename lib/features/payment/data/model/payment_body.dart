import 'package:json_annotation/json_annotation.dart';
part 'payment_body.g.dart';

@JsonSerializable()
class PaymentBody {
  final String amount;
  final String name;
  final String currency;

  PaymentBody({
    required this.amount,
    required this.name,
    required this.currency,
  });
  factory PaymentBody.fromJson(Map<String, dynamic> json) =>
      _$PaymentBodyFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentBodyToJson(this);
}
