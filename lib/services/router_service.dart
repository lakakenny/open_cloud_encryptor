import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/constants/routes.dart';
import 'package:open_cloud_encryptor/features/app/ui/pages/app.dart';

@lazySingleton
class RouterService {
  final _routesList = routesList;

  final Router _router;

  RouterService(this._router);

  void init() {
    for (var item in _routesList) {
      _router.define(
        item.route.path,
        handler: Handler(handlerFunc: item.route.handlerFunc),
        transitionType: item.route.transition,
      );
    }
  }

  Route<dynamic> generator(RouteSettings routeSettings) =>
      _router.generator(routeSettings);

  void pop(BuildContext context) => _router.pop(context);

  Future<dynamic> navigateTo(
    String path, {
    bool replace,
    bool clearStack,
    TransitionType transition,
    Duration transitionDuration,
    RouteTransitionsBuilder transitionBuilder,
    BuildContext context,
  }) async {
    final match = _router.match(path);

    if (match != null) {
      final route = _routesList
          .map((a) => a.route)
          .firstWhere((r) => r.path == match.route.route);
      final hasPermission = await route.hasPermission(match.parameters);

      if (hasPermission) {
        if (context != null) {
          return _router.navigateTo(
            context,
            path,
            replace: replace ?? route.replace,
            clearStack: clearStack ?? route.clearStack,
            transition: transition ?? route.transition,
            transitionDuration: transitionDuration ?? route.transitionDuration,
            transitionBuilder: transitionBuilder ?? route.transitionBuilder,
          );
        } else if (clearStack ?? route.clearStack) {
          return App.navigatorKey.currentState
              .pushNamedAndRemoveUntil(path, (check) => false);
        } else if (replace ?? route.replace) {
          return App.navigatorKey.currentState.pushReplacementNamed(path);
        } else {
          return App.navigatorKey.currentState.pushNamed(path);
        }
      }
    }
  }
}
