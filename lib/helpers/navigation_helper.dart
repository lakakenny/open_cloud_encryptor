import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/router/router.gr.dart';

bool isCurrentScreen(BuildContext context) {
  return ModalRoute.of(context).isCurrent;
}

String getCurrentScreen(BuildContext context) {
  return ModalRoute.of(context).settings.name;
}

void navigateToRoute(String _routeName) {
  ExtendedNavigator.ofRouter<Router>().pushNamed(_routeName);
}
