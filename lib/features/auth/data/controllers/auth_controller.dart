import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_permission_model.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_token_model.dart';
import 'package:open_cloud_encryptor/features/auth/data/repositories/auth_repository.dart';

@lazySingleton
class AuthController {
  AuthRepository authRepository;

  AuthController(this.authRepository);

  // todo init -> fetch token from url -> validate -> refresh
  Future<AuthPermissionModel> getAuthPermission() async {
    final tokenData = await getAuthTokenId();

    // todo validate token
    return AuthPermissionModel(
        isAuthenticated: tokenData.token != null && tokenData.token.isNotEmpty);
  }

  Future<AuthTokenModel> getAuthTokenId() async {
    return authRepository.getAuthTokenId();
  }
}
