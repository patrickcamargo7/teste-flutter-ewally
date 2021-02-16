import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:teste_ewally/app/screens/auth/auth_screen.dart';
import 'package:teste_ewally/shared/constants/app.dart';
import 'package:teste_ewally/shared/global/global_navigation.dart';
import 'package:teste_ewally/shared/global/global_scaffold.dart';
import 'package:teste_ewally/shared/models/base/error_response.dart';
import 'package:teste_ewally/shared/util/session.dart';

class DioInstance {
  static newInstance() {
    BaseOptions options = new BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 10000,
      baseUrl: baseUrl,
    );

    Dio dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(onRequest: (Options options) async {
        dio.interceptors.requestLock.lock();

        options = await setAuthorization(options);

        dio.interceptors.requestLock.unlock();

        return options;
      }, onResponse: (Response response) async {
        dio.interceptors.responseLock.lock();
        dio.interceptors.responseLock.unlock();
      }, onError: (DioError dioError) async {
        handleResponse(dioError.response);

        return dioError;
      }),
    );

    return dio;
  }

  static handleResponse(Response response) {
    switch (response.statusCode) {
      case 401:
        handleUnauthorizedResponse(response);
        break;
    }
  }

  static handleUnauthorizedResponse(Response response) {
    final errorResponse = ErrorResponse.fromJson(response.data);

    //Autenticação expirada
    if (errorResponse.code == 110) {
      GlobalNavigation.instance.navigatorKey.currentState
          .pushReplacementNamed(AuthScreen.routeName);

      GlobalScaffold.instance
          .showSnackbar(SnackBar(content: Text(errorResponse.msg)));
    }
  }

  static setAuthorization(Options options) async {
    if (await Session.isAuthenticated()) {
      final authData = await Session.getAuthAuthorization();
      options.headers[HttpHeaders.authorizationHeader] =
          "Bearer " + authData.token;
    }

    return options;
  }
}
