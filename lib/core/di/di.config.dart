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
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:pretty_dio_logger/pretty_dio_logger.dart' as _i528;

import '../../features/auth/data/data_source/remote/auth_remote_data_source.dart'
    as _i548;
import '../../features/auth/data/data_source/remote/auth_remote_data_source_impl.dart'
    as _i923;
import '../../features/auth/data/repos/auth_repo.dart' as _i507;
import '../../features/auth/data/repos/auth_repo_impl.dart' as _i152;
import '../../features/home/data/datasources/home_remote_data_source.dart'
    as _i362;
import '../../features/home/data/repos/home_repo.dart' as _i447;
import '../../features/home/presentation/manager/home_cubit.dart' as _i629;
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
import 'di.dart' as _i913;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i977.AuthStateChangesChecker>(
      () => _i977.AuthStateChangesChecker(),
    );
    gh.lazySingleton<_i528.PrettyDioLogger>(() => dioModule.provideLogger());
    gh.lazySingleton<_i59.FirebaseAuth>(() => firebaseModule.firebaseAuth);
    gh.lazySingleton<_i974.FirebaseFirestore>(
      () => firebaseModule.firebaseFirestore,
    );
    gh.singleton<_i361.Dio>(
      () => dioModule.provideDio(gh<_i528.PrettyDioLogger>()),
    );
    gh.singleton<_i124.ApiService>(
      () => dioModule.provideApiService(gh<_i361.Dio>()),
    );
    gh.factory<_i362.HomeRemoteDataSource>(
      () => _i362.HomeRemoteDataSource.new(gh<_i361.Dio>()),
    );
    gh.factory<_i914.PortfolioRemoteDataSource>(
      () => _i914.PortfolioRemoteDataSource.new(gh<_i361.Dio>()),
    );
    gh.factory<_i447.HomeRepo>(
      () => _i447.HomeRepo(gh<_i362.HomeRemoteDataSource>()),
    );
    gh.singleton<_i726.FirebaseUtils>(
      () => _i726.FirebaseUtils(
        gh<_i59.FirebaseAuth>(),
        gh<_i974.FirebaseFirestore>(),
      ),
    );
    gh.lazySingleton<_i11.PortfolioRepository>(
      () => _i11.PortfolioRepositoryImpl(gh<_i914.PortfolioRemoteDataSource>()),
    );
    gh.factory<_i548.AuthRemoteDataSource>(
      () => _i923.AuthRemoteDataSourceImpl(gh<_i726.FirebaseUtils>()),
    );
    gh.factory<_i629.HomeCubit>(() => _i629.HomeCubit(gh<_i447.HomeRepo>()));
    gh.factory<_i380.PortfolioCubit>(
      () => _i380.PortfolioCubit(repository: gh<_i11.PortfolioRepository>()),
    );
    gh.factory<_i507.AuthRepo>(
      () => _i152.AuthRepoImpl(gh<_i548.AuthRemoteDataSource>()),
    );
    return this;
  }
}

class _$DioModule extends _i784.DioModule {}

class _$FirebaseModule extends _i913.FirebaseModule {}
