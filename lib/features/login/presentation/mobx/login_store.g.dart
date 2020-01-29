// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStore, Store {
  Computed<StoreState> _$stateComputed;

  @override
  StoreState get state =>
      (_$stateComputed ??= Computed<StoreState>(() => super.state)).value;

  final _$_loginFutureAtom = Atom(name: '_LoginStore._loginFuture');

  @override
  ObservableFuture<Login> get _loginFuture {
    _$_loginFutureAtom.context.enforceReadPolicy(_$_loginFutureAtom);
    _$_loginFutureAtom.reportObserved();
    return super._loginFuture;
  }

  @override
  set _loginFuture(ObservableFuture<Login> value) {
    _$_loginFutureAtom.context.conditionallyRunInAction(() {
      super._loginFuture = value;
      _$_loginFutureAtom.reportChanged();
    }, _$_loginFutureAtom, name: '${_$_loginFutureAtom.name}_set');
  }

  final _$isLoggedInAtom = Atom(name: '_LoginStore.isLoggedIn');

  @override
  bool get isLoggedIn {
    _$isLoggedInAtom.context.enforceReadPolicy(_$isLoggedInAtom);
    _$isLoggedInAtom.reportObserved();
    return super.isLoggedIn;
  }

  @override
  set isLoggedIn(bool value) {
    _$isLoggedInAtom.context.conditionallyRunInAction(() {
      super.isLoggedIn = value;
      _$isLoggedInAtom.reportChanged();
    }, _$isLoggedInAtom, name: '${_$isLoggedInAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_LoginStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$doLoginAsyncAction = AsyncAction('doLogin');

  @override
  Future doLogin() {
    return _$doLoginAsyncAction.run(() => super.doLogin());
  }
}
