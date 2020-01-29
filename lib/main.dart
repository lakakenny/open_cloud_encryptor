import 'package:get_it/get_it.dart';
import 'package:open_cloud_encryptor/core/routes/routes.dart';
import 'package:open_cloud_encryptor/constants/app_theme.dart';
import 'package:open_cloud_encryptor/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/features/login/presentation/mobx/login_store.dart';
import 'package:provider/provider.dart';
import 'package:open_cloud_encryptor/injection_container.dart' as di;

final sl = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  runApp(App());
}

class App extends StatelessWidget {
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
          Provider<LoginStore>(
            create: (_) => sl<LoginStore>(),
          )
        ],
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
