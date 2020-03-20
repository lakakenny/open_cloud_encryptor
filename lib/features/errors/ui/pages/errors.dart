import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:open_cloud_encryptor/features/errors/ui/store/errors_store.dart';
import 'package:open_cloud_encryptor/widget_extends/store_widget.dart';
import 'package:provider/provider.dart';

class ErrorsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ErrorsScreenState();
}

class _ErrorsScreenState extends StoreSFWidget<ErrorsScreen> {
  ErrorsStore _errorsStore;

  List<ReactionDisposer> _disposers;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _errorsStore ??= Provider.of<ErrorsStore>(context);

    _disposers ??= [
      reaction(
        (_) => _errorsStore.exception,
        (Exception exception) {
          onError(exception);
        },
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.0,
      height: 0.0,
    );
  }
}
