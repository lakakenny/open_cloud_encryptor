import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/alerts/data/models/alerts_model.dart';
import 'package:open_cloud_encryptor/features/alerts/ui/store/alerts_store.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:open_cloud_encryptor/widgets/flash_helper.dart';
import 'package:provider/provider.dart';

class AlertsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AlertsScreenState();
}

class _AlertsScreenState extends StoreSFWidget<AlertsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  AlertsStore _alertsStore;

  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _alertsStore ??= Provider.of<AlertsStore>(context);

    _disposers ??= [];

    _disposers.add(
      autorun((_) {
        // if (_alertsStore.alertsList.isNotEmpty) {
        final scaffold = Scaffold.of(context);

        print('======================dd');

        /* scaffold.showSnackBar(
              const SnackBar(
                content: Text('Updating..'),
              ),
            );*/
      }
          // },
          ),
    );
  }

  @override
  void dispose() {
    FlashHelper.dispose();

    super.dispose();
  }

  Widget buildAlertWidget(BuildContext _context, AlertsModel _alertsListItem) {
    /* Flushbar(
      title: '_alertsListItem.title',
      message: '_alertsListItem.body',
      duration: const Duration(seconds: 5),
    ).show(context);*/

    print('======================dd');

    //_showBasicsFlash();
    //_showBasicsFlash(context);

    return Container(width: 0.0, height: 0.0);
  }

  void _showBasicsFlash(
    BuildContext context, {
    Duration duration,
    FlashStyle flashStyle = FlashStyle.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          style: flashStyle,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            message: const Text('This is a basic flash'),
          ),
        );
      },
    );
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
