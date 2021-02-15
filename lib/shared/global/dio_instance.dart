import 'dart:io';

import 'package:dio/dio.dart';
import 'package:teste_ewally/shared/constants/app.dart';
import 'package:teste_ewally/shared/util/session.dart';

class DioInstance {
  static newInstance() {
    BaseOptions options = new BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      baseUrl: baseUrl,
    );

    Dio dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (Options options) async {
          dio.interceptors.requestLock.lock();

          if (await Session.isAuthenticated()) {
            final authData = await Session.getAuthAuthorization();
            options.headers[HttpHeaders.authorizationHeader] =
                "Bearer " + authData.token;
          }

          dio.interceptors.requestLock.unlock();
          return options;
        },
        onResponse: (Response response) async {
          dio.interceptors.responseLock.lock();

          try {
            if (response.statusCode == 110) {}
          } catch (e) {}

          dio.interceptors.responseLock.unlock();
        },
      ),
    );

    return dio;
  }
}
