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
    gh.lazySingleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i361.Dio>(
        () => dioModule.provideDio(gh<_i361.LogInterceptor>()));
    gh.singleton<_i124.ApiService>(
        () => dioModule.provideApiService(gh<_i361.Dio>()));
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}
