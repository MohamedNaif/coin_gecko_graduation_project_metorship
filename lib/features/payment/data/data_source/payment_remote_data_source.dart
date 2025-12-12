import 'package:coin_gecko_graduation_project_metorship/core/api/api_query_paramter.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:injectable/injectable.dart';
import 'package:coin_gecko_graduation_project_metorship/core/api/end_points.dart';

part 'payment_remote_data_source.g.dart';

@RestApi(baseUrl: EndPoints.paymentBaseUrl)
@lazySingleton
abstract class PaymentRemoteDataSource {
  @factoryMethod
  factory PaymentRemoteDataSource(Dio dio) = _PaymentRemoteDataSource;

  @FormUrlEncoded()
  @POST(EndPoints.paymentEndPoint)
  Future<PaymentResponseModel> payWithCard(
    @Field(ApiQueryParameter.amount) String amount,
    @Field(ApiQueryParameter.currency) String currency,
  );
}
