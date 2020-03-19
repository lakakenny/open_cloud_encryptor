import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_error.dart';
import 'package:open_cloud_encryptor/features/login/data/models/login_response_model.dart';

class LoginResponseMapper {
  static String modelToString(LoginResponseModel model) {
    return model.token_id;
  }

  static LoginResponseModelError badRequestToModelError(
    BadRequestError error,
  ) {
    return LoginResponseModelError(
      generic: error.generic(),
    );
  }
}
