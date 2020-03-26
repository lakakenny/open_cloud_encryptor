import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';
import 'package:open_cloud_encryptor/common/router/router.gr.dart';
import 'package:open_cloud_encryptor/constants/errors.dart';
import 'package:open_cloud_encryptor/features/alerts/ui/store/alerts_store.dart';
import 'package:open_cloud_encryptor/features/login/data/controllers/login_controller.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/helpers/navigation_helper.dart';

part 'login_store.g.dart';

@lazySingleton
class LoginStore extends _LoginStoreBase with _$LoginStore {
  @override
  LoginController loginController;

  @override
  AlertsStore alertsStore;

  LoginStore(
    this.loginController,
    this.alertsStore,
  ) : super(loginController, alertsStore);
}

abstract class _LoginStoreBase with Store {
  LoginController loginController;

  AlertsStore alertsStore;

  _LoginStoreBase(this.loginController, this.alertsStore);

  @action
  Future doLogin(LoginRequestModel params) async {
    final data = await loginController.postLogin(params);

    data.fold(
      (failure) {
        if (failure is UnauthenticatedException) {
          alertsStore.setAlert(Errors.INVALID_AUTHENTICATION_MESSAGE);

          return;
        }
      },
      (res) {
        if (res.token_id.isNotEmpty) {
          navigateToRoute(Routes.homeScreen);

          return;
        }
      },
    );
  }
}
