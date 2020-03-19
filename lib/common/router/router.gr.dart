// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:open_cloud_encryptor/features/home/ui/pages/home.dart';
import 'package:open_cloud_encryptor/features/login/ui/pages/login.dart';
import 'package:open_cloud_encryptor/features/splash/ui/pages/splash.dart';

class Router {
  static const homeScreen = '/';
  static const loginScreen = '/login-screen';
  static const splashScreen = '/splash-screen';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.homeScreen:
        if (hasInvalidArgs<Key>(args)) {
          return misTypedArgsRoute<Key>(args);
        }
        final typedArgs = args as Key;
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) =>
              HomeScreen(key: typedArgs),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          transitionDuration: Duration(milliseconds: 200),
        );
      case Router.loginScreen:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) => LoginScreen(),
          settings: settings,
          transitionsBuilder: TransitionsBuilders.slideLeft,
          transitionDuration: Duration(milliseconds: 200),
          fullscreenDialog: true,
        );
      case Router.splashScreen:
        return PageRouteBuilder<dynamic>(
          pageBuilder: (ctx, animation, secondaryAnimation) => SplashScreen(),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}
