import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/alerts/data/controllers/alerts_controller.dart';
import 'package:open_cloud_encryptor/features/alerts/data/models/alerts_model.dart';

part 'alerts_store.g.dart';

@lazySingleton
class AlertsStore extends _AlertsStoreBase with _$AlertsStore {
  @override
  AlertsController alertsController;

  AlertsStore(this.alertsController) : super(alertsController);
}

abstract class _AlertsStoreBase with Store {
  AlertsController alertsController;

  _AlertsStoreBase(this.alertsController);

  @observable
  ObservableList<AlertsModel> alertsList = ObservableList<AlertsModel>();

  @action
  void setAlert(
    String message, {
    String title,
    AlertsTypeEnum type = AlertsTypeEnum.ERROR,
    AlertsPopupEnum popupType = AlertsPopupEnum.FLUSHBAR,
    StackTrace stackTrace,
    Duration duration,
  }) {
    final alert = alertsController.getAlert(
      message,
      title: title,
      type: type,
      stackTrace: stackTrace,
      popupType: popupType,
      duration: duration,
    );

    alertsList.add(alert);
  }

  @action
  void setException(Exception exception, {StackTrace stackTrace}) {
    final alert = alertsController.getException(
      exception,
      stackTrace: stackTrace,
    );

    alertsList.add(alert);
  }

  @action
  void removeAlert(int generatedTime) {
    alertsList.removeWhere((a) => a.generatedTime == generatedTime);
  }
}
