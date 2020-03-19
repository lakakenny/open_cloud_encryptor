import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/common/errors/model_error.dart';

part 'login_model.g.dart';

@JsonSerializable(nullable: false)
class LoginModel {
  final String modelValue;

  LoginModel({
    @required this.modelValue,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

class LoginModelError implements ModelError {
  @override
  final String generic;

  LoginModelError({@required this.generic});
}
