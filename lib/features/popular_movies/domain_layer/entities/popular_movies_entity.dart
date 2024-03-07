import 'package:aqarmap_task/features/popular_movies/data_layer/models/movie_model.dart';

class PopularMoviesEntity {
  final int page;
  final List<MovieModel> movies;

  final int totalPages;
  final int totalResults;

  const PopularMoviesEntity({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  /*@override
  List<Object> get props => [page, movies, totalPages, totalResults];*/
}
