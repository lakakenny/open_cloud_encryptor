import 'package:open_cloud_encryptor/ui/splash/splash.dart';
import 'package:flutter/material.dart';

import '../ui/home/home.dart';

class Routes {
  Routes._();

  //static variables
  static const String home = '/home';
  static const String splash = '/splash';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    home: (BuildContext context) => HomeScreen(
          title: "OpenCloudEncryptor",
        ),
  };
}
