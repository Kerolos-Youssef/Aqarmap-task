import 'package:aqarmap_task/core/errors/failures.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/entities/popular_movies_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PopularMoviesRepository {
  Future<Either<Failure, PopularMoviesEntity>> getPopularMovies();
}
