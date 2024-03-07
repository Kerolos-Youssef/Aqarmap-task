import 'dart:io';

import 'package:aqarmap_task/core/errors/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

abstract class WebService {
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  });

  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  });

  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? data,
    String? token,
  });

  Future<Response> patchData({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  });
}

@LazySingleton(as: WebService)
class WebServiceWithDio extends WebService {
  final Dio dio;

  WebServiceWithDio({required this.dio});

  @override
  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      dio.options.headers["Authorization"] = "Bearer $token";
      return await dio.get(
        endPoint,
        queryParameters: query,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> postData({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      FormData formData = FormData();
      if (data.values.whereType<File>().isNotEmpty) {
        data.forEach((String key, dynamic value) async {
          if (value is File) {
            String fileName = value.path.split('/').last;
            formData.files.add(
              MapEntry(
                  key,
                  await MultipartFile.fromFile(
                    value.path,
                    filename: fileName,
                  )),
            );
          } else {
            formData.fields.add(MapEntry(key, value.toString()));
          }
        });
      } else {
        data.forEach((String key, dynamic value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }
      dio.options.headers["Authorization"] = "Bearer $token";
      return await dio.post(
        endPoint,
        data: formData,
        queryParameters: query,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> deleteData({
    required String endPoint,
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    String? token,
  }) async {
    try {
      FormData formData = FormData();
      if (data != null) {
        if (data.values.whereType<File>().isNotEmpty) {
          data.forEach((String key, dynamic value) async {
            if (value is File) {
              String fileName = value.path.split('/').last;
              formData.files.add(
                MapEntry(
                    key,
                    await MultipartFile.fromFile(
                      value.path,
                      filename: fileName,
                    )),
              );
            } else {
              formData.fields.add(MapEntry(key, value.toString()));
            }
          });
        } else {
          data.forEach((String key, dynamic value) {
            formData.fields.add(MapEntry(key, value.toString()));
          });
        }
      }
      dio.options.headers["Authorization"] = "Bearer $token";
      return await dio.delete(
        endPoint,
        data: formData,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }

  @override
  Future<Response> patchData({
    required String endPoint,
    required Map<String, dynamic> data,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    try {
      FormData formData = FormData();
      if (data.values.whereType<File>().isNotEmpty) {
        data.forEach((String key, dynamic value) async {
          if (value is File) {
            String fileName = value.path.split('/').last;
            formData.files.add(
              MapEntry(
                  key,
                  await MultipartFile.fromFile(
                    value.path,
                    filename: fileName,
                  )),
            );
          } else {
            formData.fields.add(MapEntry(key, value.toString()));
          }
        });
      } else {
        data.forEach((String key, dynamic value) {
          formData.fields.add(MapEntry(key, value.toString()));
        });
      }
      dio.options.headers["Authorization"] = "Bearer $token";
      return await dio.patch(
        endPoint,
        data: formData,
        queryParameters: query,
      );
    } on DioException catch (e) {
      return _handleDioError(e);
    }
  }
}

dynamic _handleDioError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      throw const FetchDataException();
    case DioExceptionType.badResponse:
      switch (error.response?.statusCode) {
        case 400:
          throw const BadRequestException();
        case 401:
        case 403:
          throw const UnauthorizedException();
        case 404:
          throw const NotFoundException();
        case 409:
          throw const ConflictException();

        case 500:
          throw const InternalServerErrorException();
      }
      break;
    case DioExceptionType.connectionError:
    case DioExceptionType.unknown:
      throw const NoInternetConnectionException();
    case DioExceptionType.cancel:
      throw const CancelException();
    case DioExceptionType.badCertificate:
      throw const BadCertificateException();
  }
}
