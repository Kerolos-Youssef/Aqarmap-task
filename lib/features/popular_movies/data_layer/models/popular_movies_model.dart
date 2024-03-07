import 'package:aqarmap_task/features/popular_movies/domain_layer/entities/popular_movies_entity.dart';
import 'package:json_annotation/json_annotation.dart';

import 'movie_model.dart';

part 'popular_movies_model.g.dart';

@JsonSerializable()
class PopularMoviesModel implements PopularMoviesEntity {
  @override
  @JsonKey(name: 'page')
  final int page;
  @override
  @JsonKey(name: 'results')
  final List<MovieModel> movies;
  @override
  @JsonKey(name: 'total_pages')
  final int totalPages;
  @override
  @JsonKey(name: 'total_results')
  final int totalResults;
  const PopularMoviesModel({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });

  factory PopularMoviesModel.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$PopularMoviesModelToJson(this);
}
