import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/network/network_info.dart';
import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:open_cloud_encryptor/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_token_model.dart';

abstract class AuthRepositoryBase {
  Future<AuthTokenModel> getAuthTokenId();

  // @todo remove this
  Future<AuthTokenModel> getAuthTokenIdFromRemote();
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
  Future<AuthTokenModel> getAuthTokenId() async {
    return _authLocalDataSource.getAuthTokenId();
  }

  // @todo remove this
  @override
  Future<AuthTokenModel> getAuthTokenIdFromRemote() {
    return _authRemoteDataSource.getAuthTokenId();
  }
}
