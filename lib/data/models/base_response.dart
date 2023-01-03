import 'package:json_annotation/json_annotation.dart';
import 'package:tutapp/data/models/server_status_response.dart';
part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse {
  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson(json);

  const BaseResponse({
    required this.status,
    required this.message,
  });

  @JsonKey(name: 'status', defaultValue: ServerStatusResponse.failed)
  final ServerStatusResponse status;

  @JsonKey(name: 'message', defaultValue: 'Empty message')
  final String message;

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
