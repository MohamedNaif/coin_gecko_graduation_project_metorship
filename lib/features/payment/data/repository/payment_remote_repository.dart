import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:coin_gecko_graduation_project_metorship/core/constants/app_strings.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/data_source/payment_remote_data_source.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_body.dart';
import 'package:coin_gecko_graduation_project_metorship/features/payment/data/model/payment_response_model.dart';
import 'package:dio/dio.dart';

abstract class PaymentRemoteRepository {
  Future<Result<PaymentResponseModel>> payWithCard({required PaymentBody body});
}

class PaymentRemoteRepositoryImpl implements PaymentRemoteRepository {
  final PaymentRemoteDataSource _paymentRemoteDataSource;

  PaymentRemoteRepositoryImpl(this._paymentRemoteDataSource);

  @override
  Future<Result<PaymentResponseModel>> payWithCard(
      {required PaymentBody body}) async {
    try {
      final response = await _paymentRemoteDataSource.payWithCard(
        (int.parse(body.amount) * 100).toString(),
        body.currency,
      );
      return Success(response);
    } on DioException catch (e) {
      return FailureResult(ServerFailure.fromDioException(dioException: e));
    } on Exception catch (e) {
      return FailureResult(ServerFailure(errMessage: e.toString()));
    } catch (e) {
      return FailureResult(ServerFailure(errMessage: AppStrings.errorMessage));
    }
  }
}
