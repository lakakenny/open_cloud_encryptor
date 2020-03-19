import 'package:dio/dio.dart';
import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_error.dart';

class BadRequestInterceptor extends Interceptor {
  @override
  Future onRequest(RequestOptions options) async {
    return options;
  }

  @override
  Future onError(DioError error) async {
    if (error.response != null) {
      if (error.response.statusCode == 400) {
        return BadRequestError(error.response.data as Map<String, dynamic>);
      } else if (error.response.statusCode == 417) {//todo
        return BadRequestError({});
      }
    }

    return null;
  }
}
