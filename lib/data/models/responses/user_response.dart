import 'package:json_annotation/json_annotation.dart';
import 'package:tutapp/domain/models/id.dart';
import 'package:tutapp/domain/models/user.dart';
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

  @JsonKey(name: 'id', defaultValue: '')
  final String id;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'notifications_count', defaultValue: 0)
  final int notificationsCount;

  @JsonKey(name: 'email', defaultValue: '')
  final String email;

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toDomain() => User(
        id: Id(id),
        name: name,
        notificationsCount: notificationsCount,
        email: email,
      );
}
