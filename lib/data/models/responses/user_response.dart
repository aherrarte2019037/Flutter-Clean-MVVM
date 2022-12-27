import 'package:json_annotation/json_annotation.dart';
part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  UserResponse({
    required this.id,
    required this.name,
    required this.notificationsCount,
    required this.email,
  });

  @JsonKey(name: 'id')
  final String id;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'notifications_count', defaultValue: 0)
  final int notificationsCount;

  @JsonKey(name: 'email')
  final String email;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
