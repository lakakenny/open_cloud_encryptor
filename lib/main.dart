import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart' as di;
import 'package:open_cloud_encryptor/constants/env.dart';
import 'package:open_cloud_encryptor/features/app/ui/pages/app.dart';
import 'package:open_cloud_encryptor/router/router.gr.dart';
import 'package:open_cloud_encryptor/router/router_auth_guard.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Env.init();

  await di.init();

  Router.navigator.addGuards([
    RouterAuthGuard(),
  ]);

  runApp(App());
}
