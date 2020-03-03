// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_cloud_encryptor/common/local_storage/shared_preferences_di.dart';
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

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final sharedPreferencesDi = _$SharedPreferencesDi();
  final dioDi = _$DioDi();
  final networkInfoDi = _$NetworkInfoDi();
  g.registerLazySingleton<AuthLocalDataSource>(() => AuthLocalDataSource());
  final sharedPreferences = await sharedPreferencesDi.sharedPreferences;
  g.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
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

class _$SharedPreferencesDi extends SharedPreferencesDi {}

class _$DioDi extends DioDi {}

class _$NetworkInfoDi extends NetworkInfoDi {}
