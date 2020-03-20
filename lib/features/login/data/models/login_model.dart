import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';

part 'login_model.g.dart';

@JsonSerializable(nullable: false)
class LoginModel {
  final String tokenId;

  LoginModel({
    @required this.tokenId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}

class LoginModelError implements ModelException {
  @override
  final String generic;

  LoginModelError({@required this.generic});
}
