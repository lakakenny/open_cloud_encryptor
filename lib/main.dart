import 'package:flutter/material.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/common/env.dart';
import 'package:open_cloud_encryptor/features/app/ui/pages/app.dart';
import 'package:open_cloud_encryptor/features/auth/data/repository/auth_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Env.init();

  setupDi();

  runApp(App());

  var repo = getIt<AuthRepository>();

  await repo.getLogin();
}
