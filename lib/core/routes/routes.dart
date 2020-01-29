import 'package:open_cloud_encryptor/features/login/presentation/pages/login.dart';
import 'package:open_cloud_encryptor/features/home/presentation/pages/home.dart';
import 'package:open_cloud_encryptor/features/home/presentation/widgets/splash.dart';
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
