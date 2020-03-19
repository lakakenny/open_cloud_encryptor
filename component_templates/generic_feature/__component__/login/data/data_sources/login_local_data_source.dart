import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/constants/shared_preferences_keys.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LoginLocalDataSource {
  SharedPreferences sharedPreferences;

  LoginLocalDataSource(this.sharedPreferences);

  Future<LoginModel> getModelValue() async {
    final pref = sharedPreferences;
    final json = pref.getString(SharedPreferencesKeys.LOGIN_PREF_VALUE);

    if (json != null) {
      return Future.value(
          LoginModel.fromJson(jsonDecode(json) as Map<String, dynamic>));
    }

    return Future.value(LoginModel(modelValue: null));
  }

  Future<void> cacheLogin(LoginModel response) async {
    final pref = sharedPreferences;
    final data = jsonEncode(response.toJson());

    return pref.setString(SharedPreferencesKeys.LOGIN_PREF_VALUE, data);
  }
}
