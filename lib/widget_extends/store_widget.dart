import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/common/errors/error_handler.dart';

abstract class StoreSFWidget<S extends StatefulWidget> extends State<S> {
  ErrorHandler get _errorHandler => getIt<ErrorHandler>();

  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => initApp());
  }

  @protected
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }

  @protected
  @mustCallSuper
  void onError(Object error) => _errorHandler.handle(error, context: context);

  Future<void> initApp() async {}
}
