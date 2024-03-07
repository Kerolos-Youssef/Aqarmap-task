import 'package:aqarmap_task/core/errors/exceptions.dart';
import 'package:aqarmap_task/core/errors/failures.dart';
import 'package:aqarmap_task/features/popular_movies/data_layer/data_sources/remote_data_source.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/entities/popular_movies_entity.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/repositories/popular_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PopularMoviesRepository)
class PopularMoviesRepositoryImp extends PopularMoviesRepository {
  final RemoteDataSource remoteDataSource;

  PopularMoviesRepositoryImp({required this.remoteDataSource});

  @override
  Future<Either<Failure, PopularMoviesEntity>> getPopularMovies() async {
    try {
      final popularMovieEntity = await remoteDataSource.getPopularMovies();
      return Right(popularMovieEntity);
    } on NoInternetConnectionException {
      return Left(OfflineFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
