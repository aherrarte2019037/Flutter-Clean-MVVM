import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BaseResponse {
  const BaseResponse({
    required this.status,
    required this.message,
  });

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'messages')
  final String message;
}
