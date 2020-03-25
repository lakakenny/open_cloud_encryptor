import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/common/handlers/error_handler.dart';
import 'package:open_cloud_encryptor/features/alerts/data/models/alerts_model.dart';
import 'package:open_cloud_encryptor/features/alerts/ui/store/alerts_store.dart';
import 'package:after_layout/after_layout.dart';

// todo make sure this works
abstract class StoreSFWidget<S extends StatefulWidget> extends State<S>
    with AfterLayoutMixin<S> {
  ErrorHandler get _errorHandler => getIt<ErrorHandler>();

  AlertsStore get _alertsStore => getIt<AlertsStore>();

  @protected
  @override
  @mustCallSuper
  void initState() {
    super.initState();
  }

  @override
  @override
  @mustCallSuper
  void didChangeDependencies() {
    super.didChangeDependencies();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      onWidgetUpdate();
    });
  }

  @protected
  @override
  Future<void> afterFirstLayout(BuildContext context) async {
    onInitApp();
  }

  @protected
  @override
  @mustCallSuper
  void dispose() {
    super.dispose();
  }

  @protected
  @mustCallSuper
  void throwException(Exception exception, {StackTrace stackTrace}) =>
      _alertsStore.setException(
        exception,
        stackTrace: stackTrace,
      );

  @protected
  @mustCallSuper
  void throwAlert(
    String message, {
    String title,
    AlertsTypeEnum type,
    AlertsPopupEnum popupType,
    StackTrace stackTrace,
    Duration duration,
  }) =>
      _alertsStore.setAlert(
        message,
        title: title,
        type: type,
        stackTrace: stackTrace,
        popupType: popupType,
        duration: duration,
      );

  Future<void> onInitApp() async {}

  Future<void> onWidgetUpdate() async {}
}
