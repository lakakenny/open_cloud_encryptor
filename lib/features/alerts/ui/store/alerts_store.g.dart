// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlertsStore on _AlertsStoreBase, Store {
  final _$alertsListAtom = Atom(name: '_AlertsStoreBase.alertsList');

  @override
  ObservableList<AlertsModel> get alertsList {
    _$alertsListAtom.context.enforceReadPolicy(_$alertsListAtom);
    _$alertsListAtom.reportObserved();
    return super.alertsList;
  }

  @override
  set alertsList(ObservableList<AlertsModel> value) {
    _$alertsListAtom.context.conditionallyRunInAction(() {
      super.alertsList = value;
      _$alertsListAtom.reportChanged();
    }, _$alertsListAtom, name: '${_$alertsListAtom.name}_set');
  }

  final _$setAlertAsyncAction = AsyncAction('setAlert');

  @override
  Future setAlert(String message,
      {String title,
      AlertsTypeEnum type,
      AlertsPopupEnum popupType,
      StackTrace stackTrace}) {
    return _$setAlertAsyncAction.run(() => super.setAlert(message,
        title: title,
        type: type,
        popupType: popupType,
        stackTrace: stackTrace));
  }

  final _$_AlertsStoreBaseActionController =
      ActionController(name: '_AlertsStoreBase');

  @override
  void setException(Exception exception, {StackTrace stackTrace}) {
    final _$actionInfo = _$_AlertsStoreBaseActionController.startAction();
    try {
      return super.setException(exception, stackTrace: stackTrace);
    } finally {
      _$_AlertsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeAlert(int index) {
    final _$actionInfo = _$_AlertsStoreBaseActionController.startAction();
    try {
      return super.removeAlert(index);
    } finally {
      _$_AlertsStoreBaseActionController.endAction(_$actionInfo);
    }
  }
}
