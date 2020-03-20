import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';
import 'package:open_cloud_encryptor/common/router/router.gr.dart';
import 'package:open_cloud_encryptor/services/crashes_service.dart';
import 'package:open_cloud_encryptor/utils/log/log.dart';
import 'package:open_cloud_encryptor/widgets/dialogs.dart';

// todo make sure this works
@lazySingleton
class ErrorHandler {
  final CrashesService crashesService;

  ErrorHandler(this.crashesService);

  Future<void> handle(
    Object error, {
    StackTrace stackTrace,
    BuildContext context,
  }) async {
    log.error('Error encountered', error: error, stackTrace: stackTrace);

    if (error is UnauthenticatedException) {
      // Todo
      // final di = await AppDi.instance;
      // await di.accountsRepository.logOut();
      Router.navigator.pushNamed(Router.splashScreen);
    } else if (error is ModelException &&
        error.generic != null &&
        context != null) {
      DialogAlert.show(context, error.generic);
    } else if (error is ApiException && context != null) {
      DialogAlert.show(
        context,
        'Oops! Something went wrong when connecting to our servers.',
      );
    } else {
      crashesService.nonFatalError(
        error,
        stackTrace,
        context: 'ErrorHandler.handle.else',
      );
    }
  }
}
