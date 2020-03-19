import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/controllers/{{featureName}}_controller.dart';

part '{{featureName}}_store.g.dart';

@lazySingleton
class {{className}}Store extends _{{className}}StoreBase with _${{className}}Store {
  @override
  {{className}}Controller {{featureName}}Controller;

  {{className}}Store(this.{{featureName}}Controller) : super({{featureName}}Controller);
}

abstract class _{{className}}StoreBase with Store {
  {{className}}Controller {{featureName}}Controller;

  _{{className}}StoreBase(this.{{featureName}}Controller);

  @observable
  bool someValue;

  @observable
  String errorMessage;

  @action
  Future doGetModelValue() async {
    final data = await {{featureName}}Controller.getModelValue();

    if (data.modelValue.isNotEmpty) {
      errorMessage = null;
      someValue = true;

      return;
    }

    errorMessage = null;
    someValue = false;
  }
}
