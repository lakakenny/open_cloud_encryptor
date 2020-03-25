import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/alerts/data/controllers/alerts_controller.dart';
import 'package:open_cloud_encryptor/features/alerts/data/models/alerts_model.dart';
import 'package:open_cloud_encryptor/utils/log/log.dart';

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
  Future setAlert(
    String message, {
    String title,
    AlertsTypeEnum type,
    AlertsPopupEnum popupType,
    StackTrace stackTrace,
  }) async {
    final alert = alertsController.setAlert(
      message,
      title: title,
      type: type,
      stackTrace: stackTrace,
      popupType: popupType,
    );

    alertsList.add(alert);
  }

  @action
  void setException(Exception exception, {StackTrace stackTrace}) {
    final alert = alertsController.setException(
      exception,
      stackTrace: stackTrace,
    );

    alertsList.add(alert);
  }

  @action
  void removeAlert(int index) {
    alertsList.removeAt(index);
  }
}
