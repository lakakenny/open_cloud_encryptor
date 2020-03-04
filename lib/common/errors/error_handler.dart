import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/errors/api_error.dart';
import 'package:open_cloud_encryptor/common/errors/model_error.dart';
import 'package:open_cloud_encryptor/common/errors/unauthenticated_error.dart';
import 'package:open_cloud_encryptor/features/splash/ui/routes/splash_route.dart';
import 'package:open_cloud_encryptor/services/crashes_service.dart';
import 'package:open_cloud_encryptor/services/router_service.dart';
import 'package:open_cloud_encryptor/widgets/dialogs.dart';

@lazySingleton
class ErrorHandler {
  // todo final RouterService routerService;
  // todo final CrashesService crashesService;

  ErrorHandler();

  void handle(
    Object error, {
    StackTrace stackTrace,
    BuildContext context,
  }) async {
    if (error is UnauthenticatedError) {
      // Todo
      // final di = await AppDi.instance;
      // await di.accountsRepository.logOut();
      // todo
      // await routerService.navigateTo(SplashRoute.buildPath());
      await RouterService.instance.navigateTo(SplashRoute.buildPath());
    } else if (error is ModelError &&
        error.generic != null &&
        context != null) {
      DialogAlert.show(context, error.generic);
    } else if (error is ApiError && context != null) {
      DialogAlert.show(
        context,
        'Oops! Something went wrong when connecting to our servers.',
      );
    } else {
      CrashesService.instance.nonFatalError(
        error,
        stackTrace,
        context: 'ErrorHandler.handle.else',
      );
    }
  }
}
