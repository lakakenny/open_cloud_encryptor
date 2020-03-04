import 'dart:convert';
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/constants/shared_preferences_keys.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSourceBase {
  Future<AuthTokenModel> getAuthTokenId();

  Future<void> cacheLogin(AuthTokenModel AuthTokenModel);
}

@lazySingleton
class AuthLocalDataSource extends AuthLocalDataSourceBase {
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  AuthLocalDataSource();

  //todo
  //AuthLocalDataSource(this.sharedPreferences);

  @override
  Future<AuthTokenModel> getAuthTokenId() async {
    final pref = await sharedPreferences;
    final json = pref.getString(SharedPreferencesKeys.AUTH_TOKEN);

    if (json != null) {
      return Future.value(AuthTokenModel.fromJson(jsonDecode(json)));
    }

    return Future.value(AuthTokenModel(token: null));
  }

  @override
  Future<void> cacheLogin(AuthTokenModel AuthTokenModel) async {
    final pref = await sharedPreferences;
    final tokenData = jsonEncode(AuthTokenModel.toJson());

    return pref.setString(SharedPreferencesKeys.AUTH_TOKEN, tokenData);
  }
}
