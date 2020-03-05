import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/route/routing.dart';
import 'package:open_cloud_encryptor/constants/routes.dart';
import 'package:open_cloud_encryptor/features/home/ui/pages/home.dart';

class HomeRoute extends RouteProps {
  static const String _path = RoutesPath.HOME;

  static String buildPath() => _path;

  @override
  String get path => _path;

  @override
  final bool clearStack = true;

  @override
  final TransitionType transition = TransitionType.fadeIn;

  @override
  Widget handlerFunc(BuildContext context, Map<String, dynamic> params) =>
      const HomeScreen();
}
