import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

abstract class RouteProps {
  String path;
  bool replace = false;
  bool clearStack = false;
  TransitionType transition = TransitionType.native;
  Duration transitionDuration = const Duration(milliseconds: 250);
  RouteTransitionsBuilder transitionBuilder;

  Widget handlerFunc(BuildContext context, Map<String, dynamic> params);

  Future<bool> hasPermission(Map<String, List<String>> params) async => true;
}

class RouteMaker {
  final RouteProps route;

  final bool hasPublicAccess;

  RouteMaker({@required this.route, this.hasPublicAccess = false});
}
