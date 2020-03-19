import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_error.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_model.dart';

class LoginMapper {
  static String modelToString(LoginModel model) {
    return model.modelValue;
  }

  static LoginModelError badRequestToModelError(BadRequestError error) {
    return LoginModelError(
      generic: error.generic(),
    );
  }
}
