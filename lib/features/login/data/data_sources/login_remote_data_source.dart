import 'dart:convert';

import 'package:open_cloud_encryptor/core/errors/exception.dart';
import 'package:open_cloud_encryptor/core/utils/dio/dio_client.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';
import 'package:meta/meta.dart';

abstract class LoginRemoteDataSource {
  /// calls the end point
  /// Throws [ServerException] for all error codes
  Future<LoginModel> getLogin();

  /// calls the end point
  /// Throws [ServerException] for all error codes
  Future<LoginModel> postLogin(String username, String password);
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  final DioClient client;

  LoginRemoteDataSourceImpl({@required this.client});

  @override
  Future<LoginModel> getLogin() async {
    try {
      final response = await client.get(
        'http://localhost:8080/getLogin',
      );

      if (response.statusCode != 200) {
        throw ServerException();
      }

      return LoginModel.fromJson(json.decode(response.body));
    } catch (_) {
      throw ServerException();
    }
  }

  @override
  Future<LoginModel> postLogin(String username, String password) async {
    try {
      final response =
          await client.post('http://localhost:8080/doLogin', data: {
        username,
        password,
      });

      if (response.statusCode != 200) {
        throw ServerException();
      }

      return LoginModel.fromJson(json.decode(response.body));
    } catch (_) {
      throw ServerException();
    }
  }
}
