import 'dart:convert';

import 'package:open_cloud_encryptor/constants/shared_preferences_keys.dart';
import 'package:open_cloud_encryptor/core/errors/exception.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginLocalDataSource {
  /// Gets the cached [LoginModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [NoLocalDataException] if no cached data is present.
  Future<LoginModel> getLogin();

  Future<void> doCacheLogin(LoginModel loginToCache);
}

class LoginLocalDataSourceImpl implements LoginLocalDataSource {
  final SharedPreferences sharedPreferences;

  LoginLocalDataSourceImpl({
    @required this.sharedPreferences,
  });

  @override
  Future<LoginModel> getLogin() {
    final jsonString = sharedPreferences.getString(SharedPreferencesKeys.LOGIN);

    if (json != null) {
      return Future.value(LoginModel.fromJson(json.decode(jsonString)));
    }

    throw CacheException();
  }

  @override
  Future<void> doCacheLogin(LoginModel loginToCache) {
    return sharedPreferences.setString(
      SharedPreferencesKeys.LOGIN,
      json.encode(loginToCache.toJson()),
    );
  }
}
