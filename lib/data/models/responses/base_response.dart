import 'package:json_annotation/json_annotation.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  const BaseResponse({
    required this.status,
    required this.message,
  });

  @JsonKey(name: 'status', defaultValue: 0)
  final int status;

  @JsonKey(name: 'messages', defaultValue: 'Empty message')
  final String message;

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
