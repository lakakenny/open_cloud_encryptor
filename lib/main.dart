import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart' as di;
import 'package:open_cloud_encryptor/constants/env.dart';
import 'package:open_cloud_encryptor/features/app/ui/pages/app.dart';
import 'package:open_cloud_encryptor/services/router_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.init();
  await di.init();

  var _routerService = di.getIt<RouterService>();
  _routerService.init();

  runApp(App());
}
