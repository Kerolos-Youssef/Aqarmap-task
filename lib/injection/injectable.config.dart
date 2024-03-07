// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aqarmap_task/core/web_service_handler.dart' as _i4;
import 'package:aqarmap_task/features/popular_movies/data_layer/data_sources/remote_data_source.dart'
    as _i5;
import 'package:aqarmap_task/features/popular_movies/data_layer/repositories/popular_movies_repository_imp.dart'
    as _i7;
import 'package:aqarmap_task/features/popular_movies/domain_layer/repositories/popular_movies_repository.dart'
    as _i6;
import 'package:aqarmap_task/features/popular_movies/domain_layer/usecases/get_popular_movies_usecase.dart'
    as _i8;
import 'package:aqarmap_task/features/popular_movies/presentation_layer/logic/popular_movies_cubit/popular_movies_cubit.dart'
    as _i9;
import 'package:aqarmap_task/injection/injectable.dart' as _i10;
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final injectionModule = _$InjectionModule();
    gh.lazySingleton<_i3.Dio>(() => injectionModule.dio);
    gh.lazySingleton<_i4.WebService>(
        () => _i4.WebServiceWithDio(dio: gh<_i3.Dio>()));
    gh.factory<_i5.RemoteDataSource>(
        () => _i5.RemoteDataSourceImp(webService: gh<_i4.WebService>()));
    gh.factory<_i6.PopularMoviesRepository>(() =>
        _i7.PopularMoviesRepositoryImp(
            remoteDataSource: gh<_i5.RemoteDataSource>()));
    gh.factory<_i8.GetPopularMoviesUseCase>(() => _i8.GetPopularMoviesUseCase(
        popularMoviesRepository: gh<_i6.PopularMoviesRepository>()));
    gh.factory<_i9.PopularMoviesCubit>(
        () => _i9.PopularMoviesCubit(gh<_i8.GetPopularMoviesUseCase>()));
    return this;
  }
}

class _$InjectionModule extends _i10.InjectionModule {}
