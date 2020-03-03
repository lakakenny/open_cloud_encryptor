import 'package:meta/meta.dart';

class AuthTokenModel {
  final String token;

  AuthTokenModel({
    @required this.token,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) {
    return AuthTokenModel(
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
    };
  }
}
