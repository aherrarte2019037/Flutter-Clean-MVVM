// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      notificationsCount: json['notificationsCount'] as int? ?? 0,
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'notificationsCount': instance.notificationsCount,
      'email': instance.email,
    };
