import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/alerts/data/models/alerts_model.dart';
import 'package:open_cloud_encryptor/features/alerts/ui/store/alerts_store.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:provider/provider.dart';

class AlertsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends StoreSFWidget<AlertsScreen> {
  AlertsStore _alertsStore;

  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _alertsStore ??= Provider.of<AlertsStore>(context);
  }

  Widget buildAlertWidget(BuildContext _context, AlertsModel _alertsListItem) {
    Flushbar(
      title: '_alertsListItem.title',
      message: '_alertsListItem.body',
      duration: const Duration(seconds: 5),
    ).show(context);

    return Container(width: 0.0, height: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.0,
      height: 0.0,
      child: Observer(builder: (_) {
        final _alertsList = _alertsStore.alertsList;

        return ListView.builder(
            itemCount: _alertsList.length,
            itemBuilder: (_context, index) {
              final item = _alertsList[index];

              return buildAlertWidget(context, item);
            });
      }),
    );
  }
}
