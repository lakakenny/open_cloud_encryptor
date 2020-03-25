import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_api_error.dart';
import 'package:open_cloud_encryptor/common/api_client/api_errors/internal_server_api_error.dart';
import 'package:open_cloud_encryptor/common/api_client/api_errors/unauthorized_api_error.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/auth_interceptor.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/bad_request_interceptor.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/internal_server_error_interceptor.dart';
import 'package:open_cloud_encryptor/common/api_client/interceptors/unauthorized_interceptor.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';
import 'package:open_cloud_encryptor/constants/env.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//@todo
@lazySingleton
class ApiClient {
  final Dio dio;

  ApiClient(this.dio) {
    dio.options.baseUrl = Env.data.apiBaseUrl;
    dio.options.connectTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.options.receiveTimeout = const Duration(minutes: 3).inMilliseconds;
    dio.interceptors.add(InternalServerErrorInterceptor());
    dio.interceptors.add(AuthInterceptor());
    dio.interceptors.add(UnauthorizedInterceptor());
    dio.interceptors.add(BadRequestInterceptor());

    if (Env.data.debugApiClient) {
      dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ));
    }
  }

  Future<Response> post(
    String path,
    dynamic data,
    Function badRequestToModelException,
  ) async {
    try {
      return await dio.post(path, data: data);
    } on InternalServerApiError {
      throw InternalServerException();
    } on BadRequestApiError catch (error) {
      throw badRequestToModelException(error);
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> put(
      String path, dynamic data, Function badRequestToModelException) async {
    try {
      return await dio.put(path, data: data);
    } on InternalServerApiError {
      throw InternalServerException();
    } on BadRequestApiError catch (error) {
      throw badRequestToModelException(error);
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> delete(String path) async {
    try {
      return await dio.delete(path);
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }

  Future<Response> get(String path) async {
    try {
      return await dio.get(path);
    } on InternalServerApiError {
      throw InternalServerException();
    } on UnauthorizedApiError {
      throw UnauthenticatedException();
    } on DioError {
      throw ApiException();
    }
  }
}
