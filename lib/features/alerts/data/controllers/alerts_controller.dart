import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';
import 'package:open_cloud_encryptor/common/router/router.gr.dart';
import 'package:open_cloud_encryptor/constants/errors.dart';
import 'package:open_cloud_encryptor/features/alerts/data/models/alerts_model.dart';
import 'package:open_cloud_encryptor/services/crashes_service.dart';
import 'package:open_cloud_encryptor/utils/log/log.dart';

@lazySingleton
class AlertsController {
  CrashesService crashesService;

  AlertsController(
    this.crashesService,
  );

  AlertsModel getAlert(
    String body, {
    String title,
    AlertsTypeEnum type = AlertsTypeEnum.ERROR,
    AlertsPopupEnum popupType = AlertsPopupEnum.FLUSHBAR,
    StackTrace stackTrace,
    Duration duration,
  }) {
    String _title;

    switch (type) {
      case AlertsTypeEnum.INFO:
        _title = 'Info!';

        log.info(_title, error: body, stackTrace: stackTrace);
        break;
      case AlertsTypeEnum.WARNING:
        _title = 'Warning!';

        log.warn(_title, error: body, stackTrace: stackTrace);
        break;
      case AlertsTypeEnum.SUCCESS:
        _title = 'Great!';
        break;
      case AlertsTypeEnum.ERROR:
      default:
        _title = 'Oops... Some error occured!';

        log.error(_title, error: body, stackTrace: stackTrace);
        break;
    }

    return AlertsModel(
      body: body,
      title: _title,
      type: type,
      popupType: popupType,
      duration: duration,
    );
  }

  AlertsModel getException(
    Exception exception, {
    @required StackTrace stackTrace,
  }) {
    String _body;

    if (exception is UnauthenticatedException) {
      // Todo
      // final di = await AppDi.instance;
      // await di.accountsRepository.logOut();

      _body = Errors.INVALID_UNAUTHENTICATED_MESSAGE;

      ExtendedNavigator.ofRouter<Router>().pushNamed(Routes.loginScreen);
    } else if (exception is ModelException && exception.generic != null) {
      _body = exception.generic;
    } else if (exception is ApiException) {
      _body = Errors.INVALID_API_MESSAGE;
    } else if (exception is InternalServerException) {
      _body = Errors.INTERNAL_SERVER_MESSAGE;
    } else if (exception is CacheException) {
      _body = Errors.CACHE_FAILURE_MESSAGE;
    } else {
      _body = Errors.UNKNOWN_FAILURE_MESSAGE;

      crashesService.nonFatalError(_body, stackTrace);
    }

    return getAlert(_body);
  }
}
