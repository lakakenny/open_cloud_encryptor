import 'package:open_cloud_encryptor/stores/auth/auth.dart';
import 'package:open_cloud_encryptor/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:provider/provider.dart';

import 'constants/app_theme.dart';
import 'constants/strings.dart';

void main() {
  runApp(App());
}

@provide
class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<AuthStore>(create: (_) => AuthStore())],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Strings.APP_NAME,
          theme: themeData,
          routes: Routes.routes,
          initialRoute: '/',
        ));
  }
}
