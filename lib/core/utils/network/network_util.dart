import 'package:dio/dio.dart';

class NetworkUtil {
  Dio _dio;

  NetworkUtil() {
    var options = BaseOptions(receiveTimeout: 5000, connectTimeout: 5000);
    _dio = Dio(options);
    _dio.interceptors.add(LogInterceptor());
  }

  ///used for calling Get Request
  Future<Response> get(String url, Map<String, String> params) async {
    var response = await _dio.get(url,
        queryParameters: params,
        options: Options(responseType: ResponseType.json));
    return response;
  }

  ///used for calling post Request
  Future<Response> post(String url, Map<String, String> params) async {
    var response = await _dio.post(url,
        data: params, options: Options(responseType: ResponseType.json));
    return response;
  }
}
