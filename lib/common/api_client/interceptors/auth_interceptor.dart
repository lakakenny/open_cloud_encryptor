import 'package:dio/dio.dart';
import 'package:open_cloud_encryptor/common/di/di.dart';
import 'package:open_cloud_encryptor/features/auth/data/controllers/auth_controller.dart';

class AuthInterceptor extends Interceptor {
  AuthController get authController => getIt<AuthController>();

  @override
  Future<RequestOptions> onRequest(RequestOptions options) async {
    final permission = await authController.getAuthPermission();

    if (permission.isAuthenticated) {
      final authToken = await authController.getAuthTokenId();

      options.headers['Authorization'] = 'Bearer ${authToken.token}';
    }

    return options;
  }

  @override
  Null onError(DioError error) {
    return null;
  }
}
