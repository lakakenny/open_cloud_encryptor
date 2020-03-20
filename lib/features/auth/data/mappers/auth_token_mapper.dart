import 'dart:convert';

import 'package:open_cloud_encryptor/common/api_client/api_errors/bad_request_api_error.dart';
import 'package:open_cloud_encryptor/features/auth/data/models/auth_token_model.dart';

class AuthTokenMapper {
  static String modelToString(AuthTokenModel model) {
    return model.token;
  }

  static AuthTokenModelError badRequestToModelError(BadRequestApiError error) {
    return AuthTokenModelError(
      generic: error.generic(),
    );
  }

  static Map<String, dynamic> _parseJwt(String token) {
    if (token == null) {
      return {};
    }

    final parts = token.split('.');

    if (parts.length != 3) {
      throw Exception('Invalid token.');
    }

    var payload = parts[1].replaceAll('-', '+').replaceAll('_', '/');

    switch (payload.length % 4) {
      case 0:
        break;
      case 2:
        payload += '==';
        break;
      case 3:
        payload += '=';
        break;
      default:
        throw Exception('Illegal base64url string."');
    }

    payload = utf8.decode(base64Url.decode(payload));
    final payloadMap = json.decode(payload);

    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('Invalid payload.');
    }

    return payloadMap as Map<String, dynamic>;
  }
}
