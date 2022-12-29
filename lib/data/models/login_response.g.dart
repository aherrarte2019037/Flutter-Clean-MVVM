// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      status:
          $enumDecodeNullable(_$ServerStatusResponseEnumMap, json['status']) ??
              ServerStatusResponse.failed,
      message: json['messages'] as String? ?? 'Empty message',
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => ContactResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': _$ServerStatusResponseEnumMap[instance.status]!,
      'messages': instance.message,
      'user': instance.user,
      'contacts': instance.contacts,
    };

const _$ServerStatusResponseEnumMap = {
  ServerStatusResponse.success: 'success',
  ServerStatusResponse.failed: 'failed',
};
