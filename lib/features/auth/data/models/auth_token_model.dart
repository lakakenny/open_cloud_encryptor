import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/common/exceptions/exceptions.dart';

part 'auth_token_model.g.dart';

@JsonSerializable(nullable: false)
class AuthTokenModel {
  final String token;

  AuthTokenModel({
    @required this.token,
  });

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      _$AuthTokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthTokenModelToJson(this);
}

class AuthTokenModelError implements ModelException {
  @override
  final String generic;

  AuthTokenModelError({this.generic});
}
