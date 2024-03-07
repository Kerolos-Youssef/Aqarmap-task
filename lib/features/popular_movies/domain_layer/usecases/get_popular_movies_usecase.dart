import 'package:aqarmap_task/core/errors/failures.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/entities/popular_movies_entity.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/repositories/popular_movies_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetPopularMoviesUseCase {
  final PopularMoviesRepository popularMoviesRepository;
  GetPopularMoviesUseCase({required this.popularMoviesRepository});

  Future<Either<Failure, PopularMoviesEntity>> call() async {
    return await popularMoviesRepository.getPopularMovies();
  }
}
