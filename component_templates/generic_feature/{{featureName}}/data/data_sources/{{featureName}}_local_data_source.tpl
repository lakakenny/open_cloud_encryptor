import 'dart:async';
import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/constants/shared_preferences_keys.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/models/{{featureName}}_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class {{className}}LocalDataSource {
  SharedPreferences sharedPreferences;

  {{className}}LocalDataSource(this.sharedPreferences);

  Future<{{className}}Model> getModelValue() async {
    final pref = sharedPreferences;
    final json = pref.getString(SharedPreferencesKeys.{{classNameCaps}}_PREF_VALUE);

    if (json != null) {
      return Future.value(
          {{className}}Model.fromJson(jsonDecode(json) as Map<String, dynamic>));
    }

    return Future.value({{className}}Model(modelValue: null));
  }

  Future<void> cache{{className}}({{className}}Model response) async {
    final pref = sharedPreferences;
    final data = jsonEncode(response.toJson());

    return pref.setString(SharedPreferencesKeys.{{classNameCaps}}_PREF_VALUE, data);
  }
}
