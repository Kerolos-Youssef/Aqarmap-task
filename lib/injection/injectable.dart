import 'package:aqarmap_task/core/consts/api_urls.dart';
import 'package:aqarmap_task/injection/injectable.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  getIt.init();
}

@module
abstract class InjectionModule {
  @lazySingleton
  Dio get dio => Dio(
        BaseOptions(
          headers: {
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
          baseUrl: APIUrls.baseUrl,
        ),
      )..interceptors.add(LogInterceptor(
          requestBody: true,
          responseBody: true,
          error: true,
          request: true,
          requestHeader: true,
          responseHeader: true,
        ));
}
