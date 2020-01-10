import 'package:open_cloud_encryptor/ui/splash/splash.dart';
import 'package:open_cloud_encryptor/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

import 'constants/app_theme.dart';
import 'constants/strings.dart';

void main() {
  runApp(App());
}

@provide
class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.APP_NAME,
      theme: themeData,
      routes: Routes.routes,
      home: SplashScreen(),
    );
  }
}
