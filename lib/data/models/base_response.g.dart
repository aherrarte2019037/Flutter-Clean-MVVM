// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse(
      status:
          $enumDecodeNullable(_$ServerStatusResponseEnumMap, json['status']) ??
              ServerStatusResponse.failed,
      message: json['messages'] as String? ?? 'Empty message',
    );

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': _$ServerStatusResponseEnumMap[instance.status]!,
      'messages': instance.message,
    };

const _$ServerStatusResponseEnumMap = {
  ServerStatusResponse.success: 'success',
  ServerStatusResponse.failed: 'failed',
};
