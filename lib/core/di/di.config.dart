// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/repos/home_repo.dart' as _i447;
import '../../features/home/presentation/manager/home_cubit.dart' as _i629;
import '../api/api_services.dart' as _i124;
import '../api/dio_module.dart' as _i784;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioModule = _$DioModule();
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.provideLogger());
    gh.singleton<_i361.Dio>(
        () => dioModule.provideDio(gh<_i528.PrettyDioLogger>()));
    gh.singleton<_i124.ApiService>(
        () => dioModule.provideApiService(gh<_i361.Dio>()));
    gh.factory<_i362.HomeRemoteDataSource>(
        () => _i362.HomeRemoteDataSource(gh<_i124.ApiService>()));
    gh.factory<_i447.HomeRepo>(
        () => _i447.HomeRepo(gh<_i362.HomeRemoteDataSource>()));
    gh.factory<_i629.HomeCubit>(() => _i629.HomeCubit(gh<_i447.HomeRepo>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
