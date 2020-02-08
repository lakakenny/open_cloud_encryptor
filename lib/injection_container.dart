import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:open_cloud_encryptor/core/utils/dio/dio_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:open_cloud_encryptor/features/login/data/mobx/login_store.dart';
import 'package:open_cloud_encryptor/core/utils/network/network_info.dart';
import 'package:open_cloud_encryptor/features/login/data/data_sources/login_local_data_source.dart';
import 'package:open_cloud_encryptor/features/login/data/data_sources/login_remote_data_source.dart';
import 'package:open_cloud_encryptor/features/login/data/repositories/login_repository.dart';
import 'package:open_cloud_encryptor/features/login/data/use_cases/get_login.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Login
  // Store
  sl.registerFactory(
    () => LoginStore(
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => GetLogin(sl()));

  // Repository
  sl.registerLazySingleton<LoginRepositoryBase>(
    () => LoginRepository(
      localDataSource: sl(),
      networkInfo: sl(),
      remoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<LoginRemoteDataSourceBase>(
    () => LoginRemoteDataSource(client: sl()),
  );

  sl.registerLazySingleton<LoginLocalDataSourceBase>(
    () => LoginLocalDataSource(sharedPreferences: sl()),
  );

  sl.registerLazySingleton<NetworkInfoBase>(() => NetworkInfo(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  var dio = Dio();

  sl.registerLazySingleton(() => DioClient(dio));

  sl.registerLazySingleton(() => DataConnectionChecker());
}
