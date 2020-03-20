import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/login/data/api/login_api.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_response_model.dart';

@lazySingleton
class LoginRemoteDataSource {
  final LoginApi _loginApi;

  LoginRemoteDataSource(this._loginApi);

  Future<Either<Exception, LoginResponseModel>> postLogin(
      LoginRequestModel params) async {
    return _loginApi.postLogin(params);
  }
}
