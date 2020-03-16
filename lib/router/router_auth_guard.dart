import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

class RouterAuthGuard extends RouteGuard {
  @override
  Future<bool> canNavigate(
      BuildContext context, String routeName, Object arguments) async {
    // todo implement router guard logic
    return Future.value(true);
  }
}
