import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/core/utils/log_it/log_it.dart';

part 'login_state.g.dart';

class GoginState = _LoginState with _$LoginState;

abstract class _LoginState with Store {
  // disposers
  List<ReactionDisposer> _disposers;

  // store variables
  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  bool isLoggedIn = false;

  @action
  Future doLogin() async {
    loading = true;

    await Future.delayed(Duration(milliseconds: 2000)).then((future) {
      isLoggedIn = true;

      loading = false;
      success = true;
    }).catchError((e) {
      isLoggedIn = false;

      loading = false;
      success = false;

      LogIt.error(e, 'doLogin');
    });
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
