import 'package:aqarmap_task/core/consts/api_urls.dart';
import 'package:aqarmap_task/core/extensions/padding.dart';
import 'package:aqarmap_task/core/extensions/radius.dart';
import 'package:aqarmap_task/core/extensions/widget.dart';
import 'package:aqarmap_task/core/shared_widget/custom_text_widget.dart';
import 'package:aqarmap_task/core/shared_widget/error_image_placeholder.dart';
import 'package:aqarmap_task/core/shared_widget/image_loader_widget.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/entities/movie_entity.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MovieItemWidget extends StatelessWidget {
  final MovieEntity movie;
  final Function? onPressed;

  const MovieItemWidget(
      {Key? key, required this.movie, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: MBorderRadius.set(all: 16.0),
      elevation: 6.0,
      child: Container(
        padding: const MPadding.set(all: 8.0),
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: MBorderRadius.set(all: 16.0),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: MBorderRadius.set(all: 16.0),
              child: CachedNetworkImage(
                imageUrl: APIUrls.imageUrl(
                  movie.posterPath,
                ),
                placeholder: (context, loader) => const ImageLoaderWidget(
                  height: 200.0,
                  width: 180.0,
                  radius: 16.0,
                ),
                errorWidget: (context, error, _) => const ErrorImagePlaceholder(
                  height: 200.0,
                  width: 180.0,
                  radius: 16.0,
                ),
                height: 200.0,
                width: 180.0,
                fit: BoxFit.fill,
              ),
            ).addPadding(end: 12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MText(
                    text: movie.title,
                    size: 22.0,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    weight: FontWeight.w500,
                  ).addPadding(bottom: 8.0),
                  MText(
                    text: movie.releaseDate,
                    size: 22.0,
                  ).addPadding(bottom: 12.0),
                  MText(
                    text: 'Popularity: ${movie.popularity.toStringAsFixed(2)}',
                    size: 22.0,
                  ).addPadding(bottom: 12.0),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            CupertinoIcons.star_fill,
                            color: Colors.amber,
                            size: 28.0,
                          ).addPadding(end: 8.0),
                          MText(
                            text: movie.voteAverage.toStringAsFixed(1),
                            color: Colors.amber,
                            weight: FontWeight.bold,
                            size: 26,
                          ),
                        ],
                      ),
                      if (movie.adult) const Spacer(),
                      if (movie.adult)
                        SvgPicture.asset(
                          'assets/images/svgs/adult-icon.svg',
                          height: 40.0,
                          width: 40.0,
                        )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ).addAction(onGesture: onPressed);
  }
}
