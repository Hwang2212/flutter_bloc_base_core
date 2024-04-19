import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_bloc_base/common/common.dart';

enum HttpRequestMethod { get, post, put, delete }

abstract class BaseApiService {
  BaseApiService() {
    final dio = _createDio();

    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onRequest: (options, handler) {
          handler.next(options);
        },
        onError: (error, handler) async {
          if (error.response?.statusCode == ApiStatusCodes.tokenExpired ||
              error.response?.statusCode == ApiStatusCodes.forbidden) {
            try {
              // final tokenResponse = await _refreshAccessToken();
              // TODO DEVELOPER: Add Handler for Refresh token and Cache Credentials
              // if (tokenResponse?.accessToken == null) {
              //   // await AuthenticationService.logOut();
              //   return handler.reject(error);
              // }

              // await GetIt.instance<SharedPreferencesService>()
              //     .setCredentials(tokenResponse!);

              final options = error.requestOptions;

              final response = await dio.fetch<void>(options);
              return handler.resolve(response);
            } on DioException catch (e) {
              await AuthenticationService.logOut();
              return handler.reject(e);
            } catch (e) {
              await AuthenticationService.logOut();
              return handler.reject(error);
            }
          }

          return handler.reject(error);
        },
      ),
    );

    _dio = dio;
  }

  late Dio _dio;
  Dio get dio => _dio;

  String? get accessToken =>
      GetIt.instance<SharedPreferencesService>().getAccessToken();

  String? get refreshToken =>
      GetIt.instance<SharedPreferencesService>().getRefreshToken();

  String get baseUrl => ApiDefaults.baseUrl;

  Dio _createDio() {
    return Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        sendTimeout:
            const Duration(milliseconds: ApiDefaults.sendTimeoutInMilliseconds),
        connectTimeout: const Duration(
            milliseconds: ApiDefaults.connectTimeoutInMilliseconds),
        receiveTimeout: const Duration(
            milliseconds: ApiDefaults.receiveTimeoutInMilliseconds),
      ),
    );
  }

  Future<void> _refreshAccessToken() async {
    // TODO DEVELOPER: Implement Refresh Token
  }

  Future<T?> callApi<T>(
    HttpRequestMethod method,
    String urlString, {
    Json? body,
    Map<String, String>? additionalHeaders,
    Dio? customizedDio,
  }) async {
    final _dio = customizedDio ?? dio;

    try {
      final url = Uri.parse(urlString);
      final queryParams = Map<String, String>.from(url.queryParameters);

      final headers = <String, String>{}..addAll(additionalHeaders ?? {});
      final options = Options(headers: headers);
      final bodyWithoutNullValues = body?..clearNullValues();

      Response<T> response;

      switch (method) {
        case HttpRequestMethod.get:
          response = await _dio.getUri<T>(
            url,
            options: options,
          );

          break;
        case HttpRequestMethod.post:
          response = await _dio.postUri<T>(
            url,
            data: bodyWithoutNullValues,
            options: options,
          );
          break;
        case HttpRequestMethod.put:
          response = await _dio.putUri<T>(
            url,
            data: bodyWithoutNullValues,
            options: options,
          );

          break;
        case HttpRequestMethod.delete:
          response = await _dio.deleteUri<T>(
            url,
            data: bodyWithoutNullValues,
            options: options,
          );
          break;
      }

      final data = response.data;
      if (data == null) {
        return null;
      }

      return data;
    } on DioException catch (e) {
      _logExceptionWithError(method, urlString, error: e);
      return e.response?.data as T;
    } catch (e) {
      _logExceptionWithError(method, urlString, error: e);
      return null;
    }
  }

  void _logExceptionWithError(
    HttpRequestMethod method,
    String path, {
    Object? error,
  }) {
    log(
      'Exception caught for ${method.name} $path: '
      '${error.toString()}',
    );

    if (error is DioException) {
      log('DioError ${error.response}');
    }
  }
}
