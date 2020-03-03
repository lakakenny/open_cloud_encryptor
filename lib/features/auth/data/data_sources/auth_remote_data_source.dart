import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/auth/data/api/auth_api.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_model.dart';

@lazySingleton
class AuthRemoteDataSource {
  final AuthApi _authApi;

  AuthRemoteDataSource(this._authApi);

  Future<AuthModel> getLogin() async {
    return _authApi.getLogin();
  }
}
