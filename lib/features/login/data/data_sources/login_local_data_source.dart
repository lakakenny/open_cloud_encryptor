import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LoginLocalDataSource {
  SharedPreferences sharedPreferences;

  LoginLocalDataSource(this.sharedPreferences);

  Future<LoginModel> getModelValue() async {//todo
    return Future.value(LoginModel(tokenId: null));
  }
}
