import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';

part 'login_response_model.g.dart';

@JsonSerializable(nullable: false)
class LoginResponseModel {
  final String token_id;
  final String error_message;

  LoginResponseModel({
    @required this.token_id,
    @required this.error_message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

class LoginResponseModelError implements ModelException {
  @override
  final String generic;

  LoginResponseModelError({@required this.generic});
}
