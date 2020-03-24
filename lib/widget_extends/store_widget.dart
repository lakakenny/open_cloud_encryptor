import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/common/handlers/error_handler.dart';

// todo make sure this works
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
  void onErrorException(Object error) =>
      _errorHandler.handleException(error, context: context);

  @protected
  @mustCallSuper
  void onErrorMessage(String error) =>
      _errorHandler.handleError(error, context: context);

  Future<void> initApp() async {}
}
