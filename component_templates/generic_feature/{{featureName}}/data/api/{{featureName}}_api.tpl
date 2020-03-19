import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/common/api_client/api_client.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/models/{{featureName}}_model.dart';

@lazySingleton
class {{className}}Api {
  final ApiClient _apiClient;

  {{className}}Api(this._apiClient);

  Future<{{className}}Model> getModelValue() async {
    final response = await _apiClient.get('api/v1/');

    return {{className}}Model.fromJson(response.data as Map<String, dynamic>);
  }
}
