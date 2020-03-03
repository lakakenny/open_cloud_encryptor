import 'package:dio/dio.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/features/auth/data/repository/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  AuthRepository get _authRepository => getIt<AuthRepository>();

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    final permission = await _authRepository.getAuthPermission();

    if (permission.isAuthenticated) {
      final authToken = await _authRepository.getAuthTokenId();

      options.headers['Authorization'] = 'Bearer ${authToken.token}';
    }

    return options;
  }

  @override
  Null onError(DioError error) {
    return null;
  }
}
