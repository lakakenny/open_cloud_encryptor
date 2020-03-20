// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'errors_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ErrorsStore on _ErrorsStoreBase, Store {
  final _$exceptionAtom = Atom(name: '_ErrorsStoreBase.exception');

  @override
  Exception get exception {
    _$exceptionAtom.context.enforceReadPolicy(_$exceptionAtom);
    _$exceptionAtom.reportObserved();
    return super.exception;
  }

  @override
  set exception(Exception value) {
    _$exceptionAtom.context.conditionallyRunInAction(() {
      super.exception = value;
      _$exceptionAtom.reportChanged();
    }, _$exceptionAtom, name: '${_$exceptionAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_ErrorsStoreBase.errorMessage');

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

  final _$setExceptionAsyncAction = AsyncAction('setException');

  @override
  Future setException(Exception e) {
    return _$setExceptionAsyncAction.run(() => super.setException(e));
  }

  final _$setErrorMessageAsyncAction = AsyncAction('setErrorMessage');

  @override
  Future setErrorMessage(String message) {
    return _$setErrorMessageAsyncAction
        .run(() => super.setErrorMessage(message));
  }
}
