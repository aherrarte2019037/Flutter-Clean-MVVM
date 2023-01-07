// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      user: UserResponse.fromJson(json['user'] as Map<String, dynamic>),
      contacts: (json['contacts'] as List<dynamic>?)
              ?.map((e) => ContactResponse.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      failureType:
          $enumDecodeNullable(_$LoginFailureTypeEnumMap, json['failureType']),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'failureType': _$LoginFailureTypeEnumMap[instance.failureType],
      'user': instance.user,
      'contacts': instance.contacts,
    };

const _$LoginFailureTypeEnumMap = {
  LoginFailureType.unknown: 'unknown',
  LoginFailureType.wrongPassword: 'wrongPassword',
  LoginFailureType.notRegistered: 'notRegistered',
  LoginFailureType.noConnection: 'noConnection',
};
