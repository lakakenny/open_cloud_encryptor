// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:dio/dio.dart';
import 'package:open_cloud_encryptor/common/api_client/dio_di.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:open_cloud_encryptor/common/network/network_info_di.dart';
import 'package:open_cloud_encryptor/features/auth/data/api/auth_api.dart';
import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:open_cloud_encryptor/common/network/network_info.dart';
import 'package:open_cloud_encryptor/features/auth/data/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  final dioDi = _$DioDi();
  final networkInfoDi = _$NetworkInfoDi();
  g.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());
  g.registerLazySingleton<Dio>(() => dioDi.dio);
  g.registerLazySingleton<ApiClient>(() => ApiClient(
        g<Dio>(),
      ));
  g.registerLazySingleton<DataConnectionChecker>(
      () => networkInfoDi.dataConnectionChecker);
  g.registerLazySingleton<AuthApi>(() => AuthApi(
        g<ApiClient>(),
      ));
  g.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSource(
        g<AuthApi>(),
      ));
  g.registerLazySingleton<NetworkInfo>(() => NetworkInfo(
        g<DataConnectionChecker>(),
      ));
  g.registerLazySingleton<AuthRepository>(() => AuthRepository(
        g<AuthLocalDataSource>(),
        g<AuthRemoteDataSource>(),
        g<NetworkInfo>(),
      ));
}

class _$DioDi extends DioDi {}

class _$NetworkInfoDi extends NetworkInfoDi {}
