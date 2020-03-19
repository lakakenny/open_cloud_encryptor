import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/api/{{featureName}}_api.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/models/{{featureName}}_model.dart';

@lazySingleton
class {{className}}RemoteDataSource {
  final {{className}}Api _{{featureName}}Api;

  {{className}}RemoteDataSource(this._{{featureName}}Api);

  Future<{{className}}Model> getModelValue() async {
    return _{{featureName}}Api.getModelValue();
  }
}
