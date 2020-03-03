import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart' as di;
import 'package:open_cloud_encryptor/constants/env.dart';
import 'package:open_cloud_encryptor/features/app/ui/pages/app.dart';
import 'package:open_cloud_encryptor/features/auth/data/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.init();
  await di.init();

  runApp(App());

  var repo = di.getIt<AuthRepository>();

  print(await repo.getAuthTokenIdFromRemote());
}
