import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/features/alerts/data/models/alerts_model.dart';
import 'package:open_cloud_encryptor/features/alerts/ui/store/alerts_store.dart';
import 'package:open_cloud_encryptor/helpers/navigation_helper.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:open_cloud_encryptor/helpers/flash_helper.dart';
import 'package:provider/provider.dart';

class AlertsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends StoreSFWidget<AlertsScreen> {
  AlertsStore _alertsStore;

  FlashHelper get _flashHelper => getIt<FlashHelper>();

  List<ReactionDisposer> _disposers;

  final List<AlertsModel> _activeAlerts = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _alertsStore ??= Provider.of<AlertsStore>(context);

    _disposers ??= [
      reaction(
        (_) => _alertsStore.alertsList.iterator,
        (alertsList) {
          if (isCurrentScreen(context)) {
            buildSnackbar();
          }
        },
      ),
    ];
  }

  @override
  void dispose() {
    _flashHelper.dispose();

    super.dispose();
  }

  @override
  Future<void> onInitApp() {
    _flashHelper.init(context);

    return super.onInitApp();
  }

  void buildSnackbar() {
    for (var i = 0; i < _alertsStore.alertsList.length; i++) {
      final item = _alertsStore.alertsList[i];

      if (_activeAlerts.contains(item)) {
        continue;
      }

      _showSnackbar(
        context,
        item,
      );
    }
  }

  void _showSnackbar(
    BuildContext context,
    AlertsModel alertItem,
  ) {
    final _flashInstance = _flashHelper.snackBar(
      context,
      message: alertItem.body,
      title: alertItem.title,
      duration: alertItem.duration,
    );

    _activeAlerts.add(alertItem);

    _flashInstance.then((value) {
      if (value == null) {
        _activeAlerts.remove(alertItem);

        unsetSnackbarList(alertItem);
      }
    });
  }

  Future<void> unsetSnackbarList(
    AlertsModel alertItem,
  ) async {
    _alertsStore.removeAlert(alert: alertItem);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.0,
      height: 0.0,
    );
  }
}
