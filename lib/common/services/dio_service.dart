import 'package:dio/dio.dart';
import 'package:flutter_bloc_base/common/common.dart';

class DioService {
  DioService() {
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
}
