import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_response_model.dart';
import 'package:open_cloud_encryptor/features/login/data/repositories/login_repository.dart';

@lazySingleton
class LoginController {
  LoginRepository loginRepository;

  LoginController(this.loginRepository);

  Future<Either<Exception, LoginResponseModel>> postLogin(
      LoginRequestModel params) async {
    return loginRepository.postLogin(params);
  }
}
