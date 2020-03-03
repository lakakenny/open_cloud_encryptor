import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_token_response.dart';

@injectable
@lazySingleton
class AuthApi {
  final ApiClient _apiClient;

  AuthApi(this._apiClient);

  Future<AuthTokenResponse> getLogin() async {
    final response = await _apiClient.get('');

    return AuthTokenResponse.fromJson(response.data);
  }
}
