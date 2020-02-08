import 'package:open_cloud_encryptor/features/login/ui/pages/login.dart';
import 'package:open_cloud_encryptor/features/home/ui/pages/home.dart';
import 'package:open_cloud_encryptor/features/home/ui/widgets/splash.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  //static variables
  static const String splash = '/';
  static const String login = '/login';
  static const String home = '/home';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
