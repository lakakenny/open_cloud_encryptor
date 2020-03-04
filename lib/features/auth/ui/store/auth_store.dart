import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/features/auth/data/controllers/auth_controller.dart';

part 'auth_store.g.dart';

@lazySingleton
class AuthStore extends _AuthStoreBase with _$AuthStore {
  @override
  AuthController authController;

  AuthStore(this.authController) : super(authController);
}

abstract class _AuthStoreBase with Store {
  AuthController authController;

  _AuthStoreBase(this.authController);

  @observable
  bool isLoggedIn = false;

  @observable
  String errorMessage;

  @action
  Future doLogin() async {
    final permission = await authController.getAuthPermission();

    if (permission.isAuthenticated) {
      errorMessage = null;
      isLoggedIn = true;

      return;
    }

    errorMessage = null;
    isLoggedIn = false;
  }
}
