import 'package:open_cloud_encryptor/constants/errors.dart';
import 'package:open_cloud_encryptor/core/errors/failures.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/core/use_cases/use_cases.dart';
import 'package:open_cloud_encryptor/features/login/domain/entities/login.dart';
import 'package:open_cloud_encryptor/features/login/domain/use_cases/get_login.dart';

part 'login_store.g.dart';

class LoginStore extends _LoginStore with _$LoginStore {
  LoginStore(GetLogin getLogin) : super(getLogin);
}

enum StoreState {
  initial,
  loading,
  loaded,
}

abstract class _LoginStore with Store {
  // disposers
  List<ReactionDisposer> _disposers;

  final GetLogin _getLogin;

  _LoginStore(this._getLogin);

  @observable
  ObservableFuture<Login> _loginFuture;

  @observable
  bool isLoggedIn = false;

  @observable
  String errorMessage;

  @computed
  StoreState get state {
    if (_loginFuture == null || _loginFuture.status == FutureStatus.rejected) {
      return StoreState.initial;
    }
    return _loginFuture.status == FutureStatus.pending
        ? StoreState.loading
        : StoreState.loaded;
  }

  @action
  Future doLogin() async {
    errorMessage = null;
    var login = await _getLogin(NoParams());

    login.fold(
      (failure) {
        errorMessage = _mapFailureToMessage(failure);
      },
      (res) {
        isLoggedIn = res.email.isNotEmpty;
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return Errors.SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return Errors.CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}
