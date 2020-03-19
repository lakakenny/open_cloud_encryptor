import 'package:injectable/injectable.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/models/{{featureName}}_model.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/repositories/{{featureName}}_repository.dart';

@lazySingleton
class {{className}}Controller {
  {{className}}Repository {{featureName}}Repository;

  {{className}}Controller(this.{{featureName}}Repository);

  Future<{{className}}Model> getModelValue() async {
    return {{featureName}}Repository.getModelValue();
  }
}
