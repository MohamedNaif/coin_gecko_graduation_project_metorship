import 'package:coin_gecko_graduation_project_metorship/core/api/result.dart';

abstract class UseCase<Type, Params> {
  Future<Result<Type>> call(Params params);
}

class NoParams {}
