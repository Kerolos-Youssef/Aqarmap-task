import 'package:aqarmap_task/core/utils.dart';
import 'package:aqarmap_task/features/popular_movies/domain_layer/usecases/get_popular_movies_usecase.dart';
import 'package:aqarmap_task/features/popular_movies/presentation_layer/logic/popular_movies_cubit/popular_movies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class PopularMoviesCubit extends Cubit<PopularMoviesState> {
  final GetPopularMoviesUseCase _getPopularMoviesUseCase;

  PopularMoviesCubit(this._getPopularMoviesUseCase)
      : super(PopularMoviesInitial());

  Future<void> getPopularMovies() async {
    emit(PopularMoviesLoadingState());
    final result = await _getPopularMoviesUseCase();

    result.fold(
        (failure) =>
            emit(PopularMoviesErrorState(error: mapFailureToMessage(failure))),
        (data) {
      emit(PopularMoviesSuccessState(popularMoviesEntity: data));
    });
  }
}
