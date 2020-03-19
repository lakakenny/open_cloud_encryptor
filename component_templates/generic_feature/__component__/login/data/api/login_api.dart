import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';

@lazySingleton
class LoginApi {
  final ApiClient _apiClient;

  LoginApi(this._apiClient);

  Future<LoginModel> getModelValue() async {
    final response = await _apiClient.get('api/v1/');

    return LoginModel.fromJson(response.data as Map<String, dynamic>);
  }
}
