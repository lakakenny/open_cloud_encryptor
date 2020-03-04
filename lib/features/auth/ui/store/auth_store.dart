import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

@lazySingleton
class AuthStore extends _AuthStoreBase with _$AuthStore {
  AuthStore() : super();
}

abstract class _AuthStoreBase with Store {
  _AuthStoreBase();

  @observable
  bool isLoggedIn = false;

  @observable
  String errorMessage;

  @action
  Future doLogin() async {
    Timer(
        const Duration(seconds: 2),
        () => {
              errorMessage = null,
              isLoggedIn = true,
            });
  }
}
