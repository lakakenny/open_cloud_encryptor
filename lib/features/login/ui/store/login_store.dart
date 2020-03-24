import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';
import 'package:open_cloud_encryptor/constants/errors.dart';
import 'package:open_cloud_encryptor/features/errors/ui/store/errors_store.dart';
import 'package:open_cloud_encryptor/features/login/data/controllers/login_controller.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/common/router/router.gr.dart';

part 'login_store.g.dart';

@lazySingleton
class LoginStore extends _LoginStoreBase with _$LoginStore {
  @override
  LoginController loginController;

  @override
  ErrorsStore errorsStore;

  LoginStore(this.loginController, this.errorsStore)
      : super(loginController, errorsStore);
}

abstract class _LoginStoreBase with Store {
  LoginController loginController;

  ErrorsStore errorsStore;

  _LoginStoreBase(this.loginController, this.errorsStore);

  @action
  Future doLogin(LoginRequestModel params) async {
    final data = await loginController.postLogin(params);

    data.fold(
      (failure) {
        if (failure is UnauthenticatedException) {
          errorsStore.setErrorMessage(Errors.INVALID_AUTHENTICATION_MESSAGE);

          return;
        }

        errorsStore.setException(failure);
      },
      (res) {
        if (res.token_id.isNotEmpty) {
          Router.navigator.pushNamed(Router.homeScreen);

          return;
        }
      },
    );
  }
}
