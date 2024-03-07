import 'package:aqarmap_task/features/popular_movies/domain_layer/entities/popular_movies_entity.dart';

abstract class PopularMoviesState {}

class PopularMoviesInitial extends PopularMoviesState {}

class PopularMoviesLoadingState extends PopularMoviesState {}

class PopularMoviesSuccessState extends PopularMoviesState {
  final PopularMoviesEntity popularMoviesEntity;
  PopularMoviesSuccessState({required this.popularMoviesEntity});
}

class PopularMoviesErrorState extends PopularMoviesState {
  final String error;
  PopularMoviesErrorState({required this.error});
}
