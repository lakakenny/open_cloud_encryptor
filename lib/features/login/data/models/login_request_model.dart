import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';

part 'login_request_model.g.dart';

@JsonSerializable(nullable: false)
class LoginRequestModel {
  final String username;
  final String password;

  LoginRequestModel({
    @required this.username,
    @required this.password,
  });

  Map<String, dynamic> toJson() => _$LoginRequestModelToJson(this);
}
