// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/common/api_client/dio_di.dart';
import 'package:open_cloud_encryptor/features/auth/data/api/auth_api.dart';
import 'package:open_cloud_encryptor/features/auth/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<ApiClient>(() => ApiClient());
  g.registerLazySingleton<DioDi>(() => DioDi());
  g.registerLazySingleton<AuthApi>(() => AuthApi(
        g<ApiClient>(),
      ));
  g.registerLazySingleton<AuthRepository>(() => AuthRepository(
        g<AuthApi>(),
      ));
}
