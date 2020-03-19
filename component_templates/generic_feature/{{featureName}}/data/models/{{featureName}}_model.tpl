import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'package:open_cloud_encryptor/common/errors/model_error.dart';

part '{{featureName}}_model.g.dart';

@JsonSerializable(nullable: false)
class {{className}}Model {
  final String modelValue;

  {{className}}Model({
    @required this.modelValue,
  });

  factory {{className}}Model.fromJson(Map<String, dynamic> json) =>
      _${{className}}ModelFromJson(json);

  Map<String, dynamic> toJson() => _${{className}}ModelToJson(this);
}

class {{className}}ModelError implements ModelError {
  @override
  final String generic;

  {{className}}ModelError({@required this.generic});
}
