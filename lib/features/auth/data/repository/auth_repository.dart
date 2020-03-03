import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/network/network_info.dart';
import 'package:open_cloud_encryptor/features/auth/data/api/auth_api.dart';
import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_model.dart';

abstract class AuthRepositoryBase {
  Future<AuthModel> getAuth();
}

@lazySingleton
class AuthRepository extends AuthRepositoryBase {
  final AuthLocalDataSource _authLocalDataSource;
  final AuthRemoteDataSource _authRemoteDataSource;
  final NetworkInfo _networkInfo;

  AuthRepository(
    this._authLocalDataSource,
    this._authRemoteDataSource,
    this._networkInfo,
  );

  @override
  Future<AuthModel> getAuth() async {
    if (await _networkInfo.isConnected) {
      return _authRemoteDataSource.getAuth();
    }

    return _authLocalDataSource.getAuth();
  }
}
