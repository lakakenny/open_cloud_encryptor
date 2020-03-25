import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/features/alerts/ui/pages/alerts.dart';

class CommonWidget extends StatelessWidget {
  final Widget child;

  const CommonWidget({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: child,
        ),
        AlertsScreen(),
      ],
    );
  }
}
