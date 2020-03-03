import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/auth/data/api/auth_api.dart';

@injectable
@lazySingleton
class AuthRepository {
  final AuthApi _authApi;

  AuthRepository(this._authApi);

  Future<void> getLogin() async {
    print(await _authApi.getLogin());
  }
}
