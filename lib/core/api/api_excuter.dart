
import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';
import 'package:dio/dio.dart';
import 'package:coin_gecko_graduation_project_metorship/core/errors/failures.dart';

Future<Result<T>> apiExecuter<T>(
  Future<T> Function() apiCall, {
  String? tag,
}) async {
  try {
    final data = await apiCall();
    return Success(data);
  } on DioException catch (e) {
    final failure = ServerFailure.fromDioException( dioException: e,);
    return FailureResult(failure);
  } on Exception catch (e) {
    return FailureResult(ServerFailure(errMessage: e.toString()));
  } catch (e) {
    return FailureResult(ServerFailure(errMessage: e.toString()));
  }
}
