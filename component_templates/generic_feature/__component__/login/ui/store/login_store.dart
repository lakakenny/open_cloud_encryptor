import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/login/data/controllers/login_controller.dart';

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

  @observable
  bool someValue;

  @observable
  String errorMessage;

  @action
  Future doGetModelValue() async {
    final data = await loginController.getModelValue();

    if (data.modelValue.isNotEmpty) {
      errorMessage = null;
      someValue = true;

      return;
    }

    errorMessage = null;
    someValue = false;
  }
}
