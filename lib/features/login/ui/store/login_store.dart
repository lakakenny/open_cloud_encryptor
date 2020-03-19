import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/login/data/controllers/login_controller.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/router/router.gr.dart';

part 'login_store.g.dart';

@lazySingleton
class LoginStore extends _LoginStoreBase with _$LoginStore {
  @override
  LoginController loginController;

  LoginStore(this.loginController) : super(loginController);
}

abstract class _LoginStoreBase with Store {
  LoginController loginController;

  _LoginStoreBase(this.loginController);

  @action
  Future doLogin(LoginRequestModel params) async {
    final data = await loginController.postLogin(params);

    if (data.token_id.isNotEmpty) {
      Router.navigator.pushNamed(Router.homeScreen);

      return;
    }
  }
}
