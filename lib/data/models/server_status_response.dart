import 'package:json_annotation/json_annotation.dart';

@JsonEnum()
enum ServerStatusResponse {
  @JsonValue('success')
  success,

  @JsonValue('failed')
  failed
}
