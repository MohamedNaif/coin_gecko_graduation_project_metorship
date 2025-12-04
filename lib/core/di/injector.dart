import 'package:coin_gecko_graduation_project_metorship/core/api/end_points.dart';
import 'package:dio/dio.dart';

import '../../features/market/data/repos/market_repository.dart';
import '../../features/market/presentation/cubit/market_cubit.dart';
import '../../features/market/presentation/cubit/search_cubit.dart';
import '../api/api_services.dart';

class Injector {
  static late final ApiService apiService;
  static late final MarketRepository marketRepository;
  static late final MarketCubit marketCubit;
  static late final SearchCubit searchCubit;

  static void init() {
    final dio = Dio(BaseOptions(baseUrl: EndPoints.baseUrl));
    apiService = ApiService(dio);
    marketRepository = MarketRepository(api: apiService);
    marketCubit = MarketCubit(repo: marketRepository);
    searchCubit = SearchCubit(marketRepository);
  }
}
