import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/features/auth/ui/store/auth_store.dart';
import 'package:open_cloud_encryptor/features/login/ui/store/login_store.dart';
import 'package:open_cloud_encryptor/common/router/router.gr.dart';
import 'package:open_cloud_encryptor/constants/env.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return const Scaffold(
        body: Center(
          child: Text('Oops.. Some error occured.'),
        ),
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthStore>(
          create: (_) => getIt<AuthStore>(),
        ),
        Provider<LoginStore>(
          create: (_) => getIt<LoginStore>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: Env.data.debugShowCheckedModeBanner,
        debugShowMaterialGrid: Env.data.debugShowMaterialGrid,
        builder: (BuildContext context, Widget widget) {
          setErrorBuilder();

          return widget;
        },
        title: Strings.APP_NAME,
        onGenerateRoute: Router.onGenerateRoute,
        initialRoute: Router.splashScreen,
        navigatorKey: Router.navigator.key,
        //Todo
        // theme: themeData,
      ),
    );
  }
}
