import 'package:aqarmap_task/core/extensions/padding.dart';
import 'package:aqarmap_task/core/shared_widget/custom_text_widget.dart';
import 'package:aqarmap_task/core/shared_widget/error_widget.dart';
import 'package:aqarmap_task/features/popular_movies/presentation_layer/logic/popular_movies_cubit/popular_movies_cubit.dart';
import 'package:aqarmap_task/features/popular_movies/presentation_layer/logic/popular_movies_cubit/popular_movies_state.dart';
import 'package:aqarmap_task/features/popular_movies/presentation_layer/screens/widgets/movie_details_widget.dart';
import 'package:aqarmap_task/features/popular_movies/presentation_layer/screens/widgets/movie_item_widget.dart';
import 'package:aqarmap_task/injection/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesScreen extends StatelessWidget {
  const PopularMoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final popularMoviesCubit = getIt<PopularMoviesCubit>();
    return BlocProvider(
      create: (context) => popularMoviesCubit..getPopularMovies(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 2.0,
          centerTitle: true,
          title: const MText(
            text: 'Popular Movies',
            weight: FontWeight.bold,
            size: 26.0,
          ),
        ),
        body: BlocBuilder<PopularMoviesCubit, PopularMoviesState>(
          builder: (context, state) {
            if (state is PopularMoviesLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PopularMoviesErrorState) {
              return MErrorWidget(
                errorMessage: state.error,
                onPressed: () => popularMoviesCubit.getPopularMovies(),
              );
            } else if (state is PopularMoviesSuccessState) {
              return ListView.separated(
                padding: const MPadding.set(horizontal: 14.0, vertical: 16.0),
                itemBuilder: (context, index) => MovieItemWidget(
                  movie: state.popularMoviesEntity.movies[index],
                  onPressed: () {
                    showGeneralDialog(
                        context: context,
                        transitionDuration: const Duration(milliseconds: 500),
                        barrierDismissible: true,
                        barrierLabel: '',
                        pageBuilder: (context, animation1, animation2) =>
                            Container(),
                        transitionBuilder: (context, animation1, animation2,
                                widget) =>
                            FadeTransition(
                              opacity: Tween<double>(begin: 0.5, end: 1.0)
                                  .animate(animation1),
                              child: MovieDetailsWidget(
                                  movie:
                                      state.popularMoviesEntity.movies[index]),
                            ));
                  },
                ),
                separatorBuilder: (context, index) => const Divider(
                  height: 40.0,
                ),
                itemCount: state.popularMoviesEntity.movies.length,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
