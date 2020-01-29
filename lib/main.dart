import 'package:open_cloud_encryptor/features/login/presentation/mobx/login_state.dart';
import 'package:open_cloud_encryptor/core/routes/routes.dart';
import 'package:open_cloud_encryptor/constants/app_theme.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(App());
}

@provide
class App extends StatelessWidget {
  void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Scaffold(body: Center(child: Text('Oops.. Some error occured.')));
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [Provider<LoginState>(create: (_) => LoginState())],
        child: MaterialApp(
          builder: (BuildContext context, Widget widget) {
            setErrorBuilder();
            return widget;
          },
          debugShowCheckedModeBanner: false,
          title: Strings.APP_NAME,
          theme: themeData,
          routes: Routes.routes,
          initialRoute: '/',
        ));
  }
}
