import 'dart:convert';
import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSourceBase {
  Future<AuthModel> getAuth();

  Future<void> cacheLogin(AuthModel authModel);
}

@lazySingleton
class AuthLocalDataSource extends AuthLocalDataSourceBase {
  final Future<SharedPreferences> sharedPreferences =
      SharedPreferences.getInstance();

  AuthLocalDataSource();

  // @todo
  //AuthLocalDataSource(this.sharedPreferences);

  @override
  Future<AuthModel> getAuth() async {
    final pref = await sharedPreferences;
    final tokenData = pref.getString('token_data'); //@todo string

    return Future.value(AuthModel.fromJson(jsonDecode(tokenData)));
  }

  @override
  Future<void> cacheLogin(AuthModel authModel) async {
    final pref = await sharedPreferences;
    final tokenData = jsonEncode(authModel.toJson());

    return pref.setString('token_data', tokenData); //@todo string
  }
}
