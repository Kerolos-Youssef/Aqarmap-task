import 'package:aqarmap_task/core/consts/api_urls.dart';
import 'package:aqarmap_task/core/extensions/context.dart';
import 'package:aqarmap_task/core/extensions/padding.dart';
import 'package:aqarmap_task/core/extensions/radius.dart';
import 'package:aqarmap_task/core/shared_widget/custom_text_widget.dart';
import 'package:aqarmap_task/core/shared_widget/error_image_placeholder.dart';
import 'package:aqarmap_task/core/shared_widget/image_loader_widget.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/entities/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MovieDetailsWidget extends StatelessWidget {
  final MovieEntity movie;

  const MovieDetailsWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: MBorderRadius.set(all: 18.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: MBorderRadius.set(
                  topStart: 18.0,
                  topEnd: 18.0,
                ),
                child: CachedNetworkImage(
                  imageUrl: APIUrls.imageUrl(movie.backDropPath),
                  height: context.height * 0.3,
                  width: double.infinity,
                  fit: BoxFit.fill,
                  placeholder: (context, loader) => ImageLoaderWidget(
                    height: context.height * 0.3,
                    width: double.infinity,
                  ),
                  errorWidget: (context, error, _) => ErrorImagePlaceholder(
                    height: context.height * 0.3,
                    width: double.infinity,
                  ),
                ),
              ).addPadding(bottom: 14.0),
              MText(
                text: movie.title,
                weight: FontWeight.bold,
                size: 28.0,
              ).addPadding(horizontal: 14.0, bottom: 12.0),
              MText(
                text: movie.overview,
                weight: FontWeight.w400,
                size: 22.0,
                align: TextAlign.justify,
                height: 1.4,
              ).addPadding(horizontal: 14.0, bottom: 14.0),
              MText(
                text: 'Language: ${movie.originalLanguage}',
                weight: FontWeight.w600,
                size: 24.0,
              ).addPadding(horizontal: 14.0, bottom: 8.0),
              MText(
                text: 'Release Date: ${movie.releaseDate}',
                weight: FontWeight.w600,
                size: 24.0,
              ).addPadding(horizontal: 14.0, bottom: 8.0),
              MText(
                text: 'Popularity: ${movie.popularity.toStringAsFixed(2)}',
                weight: FontWeight.w600,
                size: 24.0,
              ).addPadding(horizontal: 14.0, bottom: 8.0),
              MText(
                text:
                    'Rating: ${movie.voteAverage.toStringAsFixed(1)} (${movie.voteCount})',
                weight: FontWeight.w600,
                size: 24.0,
              ).addPadding(horizontal: 14.0, bottom: 24.0),
            ],
          ),
        ),
      ),
    );
  }
}
