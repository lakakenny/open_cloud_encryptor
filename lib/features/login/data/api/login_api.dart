import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_error.dart';
import 'package:open_cloud_encryptor/features/login/data/mappers/login_mapper.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_request_model.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_response_model.dart';

@lazySingleton
class LoginApi {
  final ApiClient _apiClient;

  LoginApi(this._apiClient);

  Future<LoginResponseModel> postLogin(LoginRequestModel params) async {
    final response = await _apiClient.post(
      'api/v1/users/login',
      params,
      (BadRequestError badRequestError) =>
          LoginMapper.badRequestToModelError(badRequestError),
    );

    return LoginResponseModel.fromJson(response.data as Map<String, dynamic>);
  }
}
