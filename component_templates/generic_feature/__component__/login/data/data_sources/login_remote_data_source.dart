import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/login/data/api/login_api.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';

@lazySingleton
class LoginRemoteDataSource {
  final LoginApi _loginApi;

  LoginRemoteDataSource(this._loginApi);

  Future<LoginModel> getModelValue() async {
    return _loginApi.getModelValue();
  }
}
