import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/features/alerts/ui/store/alerts_store.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:open_cloud_encryptor/widgets/flash_helper.dart';
import 'package:provider/provider.dart';

class AlertsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends StoreSFWidget<AlertsScreen> {
  AlertsStore _alertsStore;

  FlashHelper get _flashHelper => getIt<FlashHelper>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _alertsStore ??= Provider.of<AlertsStore>(context);
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

  void _showSnackbar(
    BuildContext context, {
    @required String message,
    @required String title,
    @required int generatedTime,
  }) {
    const _duration = Duration(seconds: 3);

    Future.delayed(_duration, () => {unsetSnackbarList(generatedTime)});

    _flashHelper.snackBar(
      context,
      message: message,
      title: title,
      duration: _duration,
    );
  }

  Future<void> unsetSnackbarList(int index) async {
    _alertsStore.removeAlert(index);
  }

  // todo not working
  Future<void> executeAfterBuild() async {
    for (var i = 0; i < _alertsStore.alertsList.length; i++) {
      final item = _alertsStore.alertsList[i];

      _showSnackbar(
        context,
        message: item.body,
        title: item.title,
        generatedTime: item.generatedTime,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    executeAfterBuild();

    return Container(
      width: 0.0,
      height: 0.0,
      child: Observer(builder: (_) {
        final _alertsList = _alertsStore.alertsList;

        return ListView.builder(
            itemCount: _alertsList.length,
            itemBuilder: (_context, index) {
              return Container(width: 0.0, height: 0.0);
            });
      }),
    );
  }
}
