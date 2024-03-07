import 'package:aqarmap_task/core/consts/api_urls.dart';
import 'package:aqarmap_task/core/web_service_handler.dart';
import 'package:aqarmap_task/features/popular_movies/data_layer/models/popular_movies_model.dart';
import 'package:injectable/injectable.dart';

abstract class RemoteDataSource {
  Future<PopularMoviesModel> getPopularMovies();
}

@Injectable(as: RemoteDataSource)
class RemoteDataSourceImp extends RemoteDataSource {
  final WebService webService;

  RemoteDataSourceImp({required this.webService});

  @override
  Future<PopularMoviesModel> getPopularMovies() async {
    final response = await webService.getData(
      endPoint: APIUrls.popularMoviesUrl,
      token: APIUrls.token,
    );
    return PopularMoviesModel.fromJson(response.data);
  }
}
