import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/errors/bad_request_error.dart';
import 'package:open_cloud_encryptor/common/api_client/errors/unauthorized_error.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/auth_interceptor.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/bad_request_interceptor.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/internal_server_error_interceptor.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/unauthorized_interceptor.dart';
import 'package:open_cloud_encryptor/common/errors/api_error.dart';
import 'package:open_cloud_encryptor/common/errors/unauthenticated_error.dart';
import 'package:open_cloud_encryptor/constants/env.dart';

//@todo
@lazySingleton
class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = Env.data.apiBaseUrl;
    dio.options.connectTimeout = Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = Duration(minutes: 3).inMilliseconds;
    dio.interceptors.add(InternalServerErrorInterceptor());
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(UnauthorizedInterceptor());
    dio.interceptors.add(BadRequestInterceptor());
    if (Env.data.debugApiClient) {
      dio.interceptors.add(LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
      ));
    }
  }

  Future<Response> post(
      String path, dynamic data, Function badRequestToModelError) async {
    try {
      return await dio.post(path, data: data);
    } on BadRequestError catch (error) {
      throw badRequestToModelError(error);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }

    //@todo
    // You may also want to do some special treatment for InternalServerError
  }

  Future<Response> put(
      String path, dynamic data, Function badRequestToModelError) async {
    try {
      return await dio.put(path, data: data);
    } on BadRequestError catch (error) {
      throw badRequestToModelError(error);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }

    //@todo
    // You may also want to do some special treatment for InternalServerError
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }

    //@todo
    // You may also want to do some special treatment for InternalServerError
  }

  Future<Response> get(String path) async {
    try {
      return await dio.get(path);
    } on UnauthorizedError {
      throw UnauthenticatedError();
    } on DioError {
      throw ApiError();
    }

    //@todo
    // You may also want to do some special treatment for InternalServerError
  }
}
