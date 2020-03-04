import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_permission_model.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_token_model.dart';
import 'package:open_cloud_encryptor/features/auth/data/repositories/auth_repository.dart';

@lazySingleton
class AuthController {
  AuthRepository authRepository;

  AuthController(this.authRepository);

  Future<AuthPermissionModel> getAuthPermission() async {
    return authRepository.getAuthPermission();
  }

  Future<AuthTokenModel> getAuthTokenId() async {
    return authRepository.getAuthTokenId();
  }

  Future<AuthTokenModel> getAuthTokenIdFromRemote() {
    return authRepository.getAuthTokenIdFromRemote();
  }
}
