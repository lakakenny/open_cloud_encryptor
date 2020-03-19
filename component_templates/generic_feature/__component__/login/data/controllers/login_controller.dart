import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';
import 'package:open_cloud_encryptor/features/login/data/repositories/login_repository.dart';

@lazySingleton
class LoginController {
  LoginRepository loginRepository;

  LoginController(this.loginRepository);

  Future<LoginModel> getModelValue() async {
    return loginRepository.getModelValue();
  }
}
