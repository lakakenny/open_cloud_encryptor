import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/route/routing.dart';
import 'package:open_cloud_encryptor/constants/routes.dart';
import 'package:open_cloud_encryptor/features/splash/ui/pages/splash.dart';

class SplashRoute extends RouteProps {
  static final String _path = RoutesPath.SPLASH;

  static String buildPath() => _path;

  @override
  String get path => _path;

  @override
  final bool clearStack = true;

  @override
  final TransitionType transition = TransitionType.fadeIn;

  @override
  Widget handlerFunc(BuildContext context, Map<String, dynamic> params) =>
      SplashScreen();
}
