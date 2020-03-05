import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_token_model.dart';

abstract class AuthApiBase {
  Future<AuthTokenModel> getAuthTokenId();
}

@lazySingleton
class AuthApi extends AuthApiBase {
  final ApiClient _apiClient;

  AuthApi(this._apiClient);

  @override
  Future<AuthTokenModel> getAuthTokenId() async {
    final response = await _apiClient.get('');

    return AuthTokenModel.fromJson(response.data as Map<String, dynamic>);
  }
}
