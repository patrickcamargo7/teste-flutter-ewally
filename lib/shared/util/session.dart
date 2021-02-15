import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:teste_ewally/shared/models/auth/authorization_model.dart';

const sessionStorageKey = '_SESSION';

class Session {
  static Future<void> setAuthAuthorization(AuthorizationModel authDataModel) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(sessionStorageKey, json.encode(authDataModel.toJson()));
  }

  static Future<AuthorizationModel> getAuthAuthorization() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var jsonString = prefs.getString(sessionStorageKey);
    return AuthorizationModel.fromJson(json.decode(jsonString));
  }

  static Future<String> getAuthToken() async {
    Completer<String> completer = Completer<String>();

    Session.getAuthAuthorization().then((value) {
      completer.complete(value.token);
    }).catchError((error) => completer.completeError(error));

    return completer.future;
  }

  static Future<bool> isAuthenticated() async {
    Completer<bool> completer = Completer<bool>();

    try {
      var authData = await Session.getAuthAuthorization();
      if (authData != null) {
        completer.complete(true);
      } else {
        completer.complete(false);
      }
    } catch (e) {
      completer.complete(false);
    }

    return completer.future;
  }

  static Future<void> refreshToken(String token) async {
    if (await Session.isAuthenticated()) {
      var authData = await Session.getAuthAuthorization();
      var refreshedData = authData.copyWith(token: token);
      await Session.setAuthAuthorization(refreshedData);
    }
  }

  static Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
