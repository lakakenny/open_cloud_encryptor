import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/common/errors/model_error.dart';

class AuthTokenModel {
  final String token;

  AuthTokenModel({
    @required this.token,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      token: json['token'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}

class AuthTokenModelError implements ModelError {
  @override
  final String generic;

  AuthTokenModelError({this.generic});
}
