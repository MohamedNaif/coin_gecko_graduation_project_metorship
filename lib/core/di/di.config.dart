// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:local_auth/local_auth.dart' as _i152;

import '../../features/biometric_auth/cubit/biometric_cubit.dart' as _i872;
import '../../features/auth/data/data_source/local/auth_local_data_source.dart'
    as _i288;
import '../../features/auth/data/data_source/local/auth_local_data_source_impl.dart'
    as _i878;
import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i921;
import '../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i586;
import '../../features/auth/data/repos/auth_repo.dart' as _i559;
import '../../features/auth/data/repos/auth_repo_impl.dart' as _i703;
import '../../features/portfolio/data/data_source/portfolio_remote_data_source.dart'
    as _i914;
import '../../features/portfolio/data/repository/portfolio_repository.dart'
    as _i11;
import '../../features/portfolio/presentation/cubit/portfolio_cubit.dart'
    as _i380;
import '../api/api_services.dart' as _i124;
import '../api/dio_module.dart' as _i784;
import '../api/firebase_utils.dart' as _i726;
import '../function/check_state_changes.dart' as _i977;
import '../storage/secure_storage_services.dart' as _i506;
import 'di.dart' as _i913;

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
    final firebaseModule = _$FirebaseModule();
    final dioModule = _$DioModule();
    gh.factory<_i977.AuthStateChangesChecker>(
        () => _i977.AuthStateChangesChecker());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
        () => firebaseModule.firebaseFirestore);
    gh.singleton<_i506.SecureStorageServices>(
        () => _i506.SecureStorageServices(gh<_i558.FlutterSecureStorage>()));
    gh.lazySingleton<_i361.LogInterceptor>(() => dioModule.provideLogger());
    gh.singleton<_i726.FirebaseUtils>(() => _i726.FirebaseUtils(
          gh<_i59.FirebaseAuth>(),
          gh<_i974.FirebaseFirestore>(),
        ));
    gh.factory<_i288.AuthLocalDataSource>(
        () => _i878.AuthLocalDataSourceImpl(gh<_i152.LocalAuthentication>()));
    gh.singleton<_i361.Dio>(
        () => dioModule.provideDio(gh<_i361.LogInterceptor>()));
    gh.singleton<_i124.ApiService>(
        () => dioModule.provideApiService(gh<_i361.Dio>()));
    gh.factory<_i914.PortfolioRemoteDataSource>(
        () => _i914.PortfolioRemoteDataSource.new(gh<_i361.Dio>()));
    gh.factory<_i921.AuthRemoteDataSource>(
        () => _i586.AuthRemoteDataSourceImpl(gh<_i726.FirebaseUtils>()));
    gh.lazySingleton<_i11.PortfolioRepository>(() =>
        _i11.PortfolioRepositoryImpl(gh<_i914.PortfolioRemoteDataSource>()));
    gh.factory<_i559.AuthRepo>(() => _i703.AuthRepoImpl(
          gh<_i921.AuthRemoteDataSource>(),
          gh<_i288.AuthLocalDataSource>(),
        ));
    gh.singleton<_i872.BiometricCubit>(() => _i872.BiometricCubit(
          gh<_i559.AuthRepo>(),
          gh<_i506.SecureStorageServices>(),
        ));
    gh.factory<_i380.PortfolioCubit>(
        () => _i380.PortfolioCubit(repository: gh<_i11.PortfolioRepository>()));
    return this;
  }
}

class _$FirebaseModule extends _i913.FirebaseModule {}

class _$DioModule extends _i784.DioModule {}
