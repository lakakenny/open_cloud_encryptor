import 'package:open_cloud_encryptor/ui/login/login.dart';
import 'package:open_cloud_encryptor/ui/splash/splash.dart';
import 'package:flutter/material.dart';

import '../ui/home/home.dart';

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
