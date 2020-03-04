import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/features/auth/ui/store/auth_store.dart';
import 'package:open_cloud_encryptor/services/router_service.dart';
import 'package:open_cloud_encryptor/features/splash/ui/pages/splash.dart';
import 'package:open_cloud_encryptor/constants/env.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  /// Navigate without context in Flutter with a Navigation Service
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  //todo RouterService get _routerService => getIt<RouterService>();

  void setErrorBuilder() {
    ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
      return Scaffold(
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
        )
      ],
      child: MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: Env.data.debugShowCheckedModeBanner,
        debugShowMaterialGrid: Env.data.debugShowMaterialGrid,
        builder: (BuildContext context, Widget widget) {
          setErrorBuilder();

          return widget;
        },
        title: Strings.APP_NAME,
        onGenerateRoute: RouterService.instance.generator,
        home: SplashScreen(),
        //Todo
        //routes: Routes.routes,
        //initialRoute: '/',
        // theme: themeData,
      ),
    );
  }
}
