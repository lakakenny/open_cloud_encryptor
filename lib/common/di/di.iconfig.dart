// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:logger/logger.dart';
import 'package:open_cloud_encryptor/common/di/logger_di.dart';
import 'package:dio/dio.dart';
import 'package:open_cloud_encryptor/common/di/dio_di.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_cloud_encryptor/common/di/shared_preferences_di.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:open_cloud_encryptor/common/di/network_info_di.dart';
import 'package:open_cloud_encryptor/common/network/network_info.dart';
import 'package:open_cloud_encryptor/services/analytics_service.dart';
import 'package:open_cloud_encryptor/services/crashes_service.dart';
import 'package:open_cloud_encryptor/services/pushes_service.dart';
import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:open_cloud_encryptor/utils/log/log_it.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/common/errors/error_handler.dart';
import 'package:open_cloud_encryptor/features/auth/data/api/auth_api.dart';
import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:open_cloud_encryptor/features/auth/data/repositories/auth_repository.dart';
import 'package:open_cloud_encryptor/features/auth/data/controllers/auth_controller.dart';
import 'package:open_cloud_encryptor/features/auth/ui/store/auth_store.dart';
import 'package:get_it/get_it.dart';

Future<void> $initGetIt(GetIt g, {String environment}) async {
  final loggerDi = _$LoggerDi();
  final dioDi = _$DioDi();
  final sharedPreferencesDi = _$SharedPreferencesDi();
  final networkInfoDi = _$NetworkInfoDi();
  g.registerLazySingleton<Logger>(() => loggerDi.logger);
  g.registerLazySingleton<Dio>(() => dioDi.dio);
  final sharedPreferences = await sharedPreferencesDi.sharedPreferences;
  g.registerFactory<SharedPreferences>(() => sharedPreferences);
  g.registerLazySingleton<DataConnectionChecker>(
      () => networkInfoDi.dataConnectionChecker);
  g.registerLazySingleton<NetworkInfo>(
      () => NetworkInfo(g<DataConnectionChecker>()));
  g.registerLazySingleton<AnalyticsService>(() => AnalyticsService());
  g.registerLazySingleton<CrashesService>(() => CrashesService());
  g.registerLazySingleton<PushesService>(() => PushesService());
  g.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSource(g<SharedPreferences>()));
  g.registerLazySingleton<LogIt>(() => LogIt(g<Logger>()));
  g.registerLazySingleton<ApiClient>(() => ApiClient(g<Dio>()));
  g.registerLazySingleton<ErrorHandler>(
      () => ErrorHandler(g<CrashesService>()));
  g.registerLazySingleton<AuthApi>(() => AuthApi(g<ApiClient>()));
  g.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSource(g<AuthApi>()));
  g.registerLazySingleton<AuthRepository>(() => AuthRepository(
        g<AuthLocalDataSource>(),
        g<AuthRemoteDataSource>(),
        g<NetworkInfo>(),
      ));
  g.registerLazySingleton<AuthController>(
      () => AuthController(g<AuthRepository>()));
  g.registerLazySingleton<AuthStore>(() => AuthStore(g<AuthController>()));
}

class _$LoggerDi extends LoggerDi {}

class _$DioDi extends DioDi {}

class _$SharedPreferencesDi extends SharedPreferencesDi {}

class _$NetworkInfoDi extends NetworkInfoDi {}
