import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
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

  Future<void> handleException(
    Object error, {
    StackTrace stackTrace,
    @required BuildContext context,
  }) async {
    log.error('Error encountered', error: error, stackTrace: stackTrace);

    if (error is UnauthenticatedException) {
      // Todo
      // final di = await AppDi.instance;
      // await di.accountsRepository.logOut();

      Router.navigator.pushNamed(Router.loginScreen);
    }
    // todo do we need this
    else if (error is ModelException &&
        error.generic != null &&
        context != null) {
      //@todo doesnt work
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

  Future<void> handleError(
    String errorMessage, {
    StackTrace stackTrace,
    String title = 'Error encountered',
    @required BuildContext context,
  }) async {
    log.error('Error encountered', error: errorMessage, stackTrace: stackTrace);

    if (errorMessage.isNotEmpty) {
      /*Flushbar(
        title: title,
        message: errorMessage,
        duration: const Duration(seconds: 5),
      ).show(context);*/
    }
  }
}
