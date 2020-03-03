import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/auth/data/api/auth_api.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSourceBase {
  Future<AuthModel> getAuth();
}

@lazySingleton
class AuthRemoteDataSource extends AuthRemoteDataSourceBase {
  final AuthApi _authApi;

  AuthRemoteDataSource(this._authApi);

  @override
  Future<AuthModel> getAuth() async {
    return _authApi.getAuth();
  }
}
