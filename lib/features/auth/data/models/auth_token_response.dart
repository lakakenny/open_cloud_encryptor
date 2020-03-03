import 'package:meta/meta.dart';

class AuthTokenResponse {
  final String token;
  final bool success;
  final String message;

  AuthTokenResponse({
    @required this.token,
    @required this.success,
    @required this.message,
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) {
    return AuthTokenResponse(
      token: json['token'],
      message: json['message'],
      success: json['success'],
    );
  }
}
