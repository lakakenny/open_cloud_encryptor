import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_error.dart';
import 'package:open_cloud_encryptor/features/{{featureName}}/data/models/{{featureName}}_model.dart';

class {{className}}Mapper {
  static String modelToString({{className}}Model model) {
    return model.modelValue;
  }

  static {{className}}ModelError badRequestToModelError(BadRequestError error) {
    return {{className}}ModelError(
      generic: error.generic(),
    );
  }
}
