import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/constants/env.dart';

//@todo
@lazySingleton
class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = Env.data.apiBaseUrl;
    dio.options.connectTimeout = Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = Duration(minutes: 3).inMilliseconds;
    /*
   _dio.interceptors.add(InternalServerErrorInterceptor());
   _dio.interceptors.add(AuthInterceptor());
    _dio.interceptors.add(UnauthorizedInterceptor());
    _dio.interceptors.add(BadRequestInterceptor());
*/
    if (Env.data.debugApiClient) {
      dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
  }

/*  Future<Response> post(
      String path, dynamic data, Function badRequestToModelError) async {
    try {
      return await _dio.post(path, data: data);
    } on BadRequestError catch (error) {
      throw badRequestToModelError(error);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }
    // You may also want to do some special treatment for InternalServerError
  }

  Future<Response> put(
      String path, dynamic data, Function badRequestToModelError) async {
    try {
      return await _dio.put(path, data: data);
    } on BadRequestError catch (error) {
      throw badRequestToModelError(error);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }
    // You may also want to do some special treatment for InternalServerError
  }

  Future<Response> delete(String path) async {
    try {
      return await _dio.delete(path);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }
    // You may also want to do some special treatment for InternalServerError
  }*/

  Future<Response> get(String path) async {
    return await dio.get(path);

    /*try {
      return await _dio.get(path);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }*/
    // You may also want to do some special treatment for InternalServerError
  }
}
