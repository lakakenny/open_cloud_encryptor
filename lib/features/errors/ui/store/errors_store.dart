import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';

part 'errors_store.g.dart';

@lazySingleton
class ErrorsStore extends _ErrorsStoreBase with _$ErrorsStore {
  ErrorsStore() : super();
}

abstract class _ErrorsStoreBase with Store {
  _ErrorsStoreBase();

  @observable
  Exception exception;

  @observable
  String errorMessage;

  @action
  Future setException(Exception e) async {
    exception = e;
  }

  @action
  Future setErrorMessage(String message) async {
    errorMessage = message;
  }
}
