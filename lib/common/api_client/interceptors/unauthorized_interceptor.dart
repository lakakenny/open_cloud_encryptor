import 'package:dio/dio.dart';
import 'package:open_cloud_encryptor/common/api_client/api_errors/unauthorized_error.dart';

class UnauthorizedInterceptor extends Interceptor {
  @override
  Future onError(DioError error) async {
    if (error.response?.statusCode == 401 ||
        error.response?.statusCode == 403) {
      return UnauthorizedError();
    }

    return null;
  }
}
